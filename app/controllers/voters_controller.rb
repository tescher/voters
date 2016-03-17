class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :edit, :update, :destroy]

  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.all
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
  end

  # GET /voters/new
  def new
    @voter = Voter.new
  end

  # GET /voters/1/edit
  def edit
  end

  def search_form
    render "search"
  end

  # POST /voters/search
  def search
    request.format = :xls
    where_clause = ""
    if !params[:voted_in_any_ids].blank? && (params[:voted_in_any_ids].count > 0)
      voted_in_ids = params[:voted_in_any_ids]
      where_clause = "elections_voters.election_id IN (#{voted_in_ids.join(',')})"
      if !params[:vote_method_ids].blank? && (params[:vote_method_ids].count > 0)
        vote_method_ids = params[:vote_method_ids]
        where_clause += " AND elections_voters.vote_method_id IN (#{vote_method_ids.join(',')})"
      end
      voters_in_any = Voter.select("voters.*").joins(:elections_voters).where(where_clause).distinct.to_sql
    end
    if !params[:voted_in_all_ids].blank? && (params[:voted_in_all_ids].count > 0)
      voted_in_ids = params[:voted_in_all_ids]
      election_count = params[:voted_in_x].to_i>0 ?  params[:voted_in_x].to_i : params[:voted_in_all_ids].count
      where_clause = "elections_voters.election_id IN (#{voted_in_ids.join(',')})"
      if !params[:vote_method_ids].blank? && (params[:vote_method_ids].count > 0)
        vote_method_ids = params[:vote_method_ids]
        where_clause += " AND elections_voters.vote_method_id IN (#{vote_method_ids.join(',')})"
      end
      voters_in_all = Voter.select("voters.*").joins(:elections_voters).where(where_clause).group("voters.id").having("COUNT(DISTINCT election_id) >= #{election_count}").to_sql
    end
#    if !params[:not_voted_in_ids].blank? && (params[:not_voted_in_ids].count > 0)
#      not_voted_in_ids = params[:not_voted_in_ids]
#      if !(joins_clause.include? :elections_voters)
#        joins_clause << :elections_voters
#     end
#      where_clause = where_clause.length > 0 ? where_clause + " AND " : where_clause
#      where_clause += "elections_voters.election_id NOT IN (#{not_voted_in_ids.join(',')})"
#    end
    if (voters_in_any.blank? && voters_in_all.blank?) && !params[:vote_method_ids].blank? && (params[:vote_method_ids].count > 0)
      vote_method_ids = params[:vote_method_ids]
      where_clause = "elections_voters.vote_method_id IN (#{vote_method_ids.join(',')})"
      voters_method = Voter.select("voters.*").joins(:elections_voters).where(where_clause).distinct.to_sql
    end

    @voters = ""

    if (!voters_in_any.blank?)
      @voters = voters_in_any
    end

    if (!voters_in_all.blank?)
      if (!@voters.blank?)
        @voters = "("+@voters+") INTERSECT "
      end
      @voters += "("+voters_in_all+")"
    end

    if (!voters_method.blank?)
      @voters += "("+voters_method+")"
    end

    puts @voters

    if @voters.blank?
      @voters = []
    else

      @voters = Voter.find_by_sql(@voters)

      if !params[:not_voted_in_ids].blank? && (params[:not_voted_in_ids].count > 0)
        @voters = @voters.to_a
        @voters_filtered = []
        @voters.each do |v|
          elections_voters = ElectionsVoter.where(voter_id: v.id)
          found = false
          elections_voters.each do |ev|
            puts ev.election_id
            if (params[:not_voted_in_ids].include? ev.election_id.to_s)
              found = true
              puts "deleted #{v.id}"
              break
            end
          end
          if !found
            @voters_filtered << v
          end
        end
        @voters = @voters_filtered
      end
    end

    respond_to do |format|
      format.html {
        render :index
      }
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename="voters.xls"'
        render "search.xls"
      }
    end
  end

  # Get /voters/convert
  def convert
    @voters = Voter.all
    @voters.each do |v|
      if (ElectionsVoter.where("voter_id = '#{v.id}'").count < 1)
        (1..16).each do |i|
          field = "vh#{i}"
          if (!v.send(field).blank?)
            election_code = v.send(field)
            vote_method = VoteMethod.find_by_code(election_code.split(" ")[1])
            election_code = election_code.split(" ")[0]
            election = Election.find_by_code(election_code)
            election_voter = ElectionsVoter.new(election_id: election.id, voter_id: v.id, vote_method_id: vote_method.id)
            election_voter.save!
          end
        end
      end
    end
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(voter_params)

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, notice: 'Voter was successfully created.' }
        format.json { render :show, status: :created, location: @voter }
      else
        format.html { render :new }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    respond_to do |format|
      if @voter.update(voter_params)
        format.html { redirect_to @voter, notice: 'Voter was successfully updated.' }
        format.json { render :show, status: :ok, location: @voter }
      else
        format.html { render :edit }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter.destroy
    respond_to do |format|
      format.html { redirect_to voters_url, notice: 'Voter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_voter
    @voter = Voter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def voter_params
    params.require(:voter).permit(:un, :party, :dp, :last_name, :first_name, :middle_name, :suffix_name, :ascension, :reg_date, :condition_date, :org_reg_date, :dist_date, :residence_address, :residence_city, :residence_zip, :mailing_address1, :mailing_address2, :mailing_address3, :mailing_city, :mailing_state, :mailing_zip, :mailing_country, :gender, :cc, :vh1, :vh2, :vh3, :vh4, :vh5, :vh6, :vh7, :vh8, :vh9, :vh10, :vh11, :vh12, :vh13, :vh14, :vh15, :vh16)
  end
end
