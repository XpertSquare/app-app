class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.column 'account_id', :integer
      t.column 'user_id', :integer
      t.timestamps
    end
  end
end