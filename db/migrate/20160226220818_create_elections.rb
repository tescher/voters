class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
