class VoteMethodsController < ApplicationController
  before_action :set_vote_method, only: [:show, :edit, :update, :destroy]

  # GET /vote_methods
  # GET /vote_methods.json
  def index
    @vote_methods = VoteMethod.all
  end

  # GET /vote_methods/1
  # GET /vote_methods/1.json
  def show
  end

  # GET /vote_methods/new
  def new
    @vote_method = VoteMethod.new
  end

  # GET /vote_methods/1/edit
  def edit
  end

  # POST /vote_methods
  # POST /vote_methods.json
  def create
    @vote_method = VoteMethod.new(vote_method_params)

    respond_to do |format|
      if @vote_method.save
        format.html { redirect_to @vote_method, notice: 'Vote method was successfully created.' }
        format.json { render :show, status: :created, location: @vote_method }
      else
        format.html { render :new }
        format.json { render json: @vote_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_methods/1
  # PATCH/PUT /vote_methods/1.json
  def update
    respond_to do |format|
      if @vote_method.update(vote_method_params)
        format.html { redirect_to @vote_method, notice: 'Vote method was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_method }
      else
        format.html { render :edit }
        format.json { render json: @vote_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_methods/1
  # DELETE /vote_methods/1.json
  def destroy
    @vote_method.destroy
    respond_to do |format|
      format.html { redirect_to vote_methods_url, notice: 'Vote method was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_method
      @vote_method = VoteMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_method_params
      params.require(:vote_method).permit(:name, :code)
    end
end
