class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :account_id
      t.string :name
      t.text :description
      t.string :length
      t.string :price
      t.boolean :is_visible
      t.boolean :is_online_booking

      t.timestamps
    end
  end
end
