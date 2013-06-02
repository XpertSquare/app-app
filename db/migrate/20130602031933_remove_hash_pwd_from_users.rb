class RemoveHashPwdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :hash_pwd
    remove_column :users, :salt_pwd
    
  end

  def down
    add_column :users, :hash_pwd, :string
    add_column :users, :salt_pwd, :string
  end
end
