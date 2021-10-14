class AddTimestampsToVoters < ActiveRecord::Migration[5.2]
  def change
    add_column :voters, :created_at, :datetime
    add_column :voters, :updated_at, :datetime
  end
end
