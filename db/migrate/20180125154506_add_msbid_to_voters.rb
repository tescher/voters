class AddMsbidToVoters < ActiveRecord::Migration[5.2]
  def change
    add_column :voters, :msbid, :string
  end
end
