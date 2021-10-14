class AddVoteMethodIdToElectionVoter < ActiveRecord::Migration[5.2]
  def change
    add_column :elections_voters, :vote_method_id, :integer
  end
end
