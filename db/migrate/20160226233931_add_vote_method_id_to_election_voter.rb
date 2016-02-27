class AddVoteMethodIdToElectionVoter < ActiveRecord::Migration
  def change
    add_column :elections_voters, :vote_method_id, :integer
  end
end
