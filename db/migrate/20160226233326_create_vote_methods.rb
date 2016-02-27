class CreateVoteMethods < ActiveRecord::Migration
  def change
    create_table :vote_methods do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
