class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username , :limit => 100, :null => false
      t.string :hash_pwd , :limit => 100, :null => false
      t.string :salt_pwd , :limit => 100, :null => false

      t.timestamps
    end
  end
end
