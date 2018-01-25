class AddMsbidToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :msbid, :string
  end
end
