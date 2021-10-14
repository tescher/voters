class CreateJoinTableElectionsVoters < ActiveRecord::Migration[5.2]
  def change
    create_join_table :elections, :voters do |t|
      t.index [:election_id, :voter_id]
      t.index [:voter_id, :election_id]
      t.string :vote_method
    end
  end
end
