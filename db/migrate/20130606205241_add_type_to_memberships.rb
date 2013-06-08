class AddTypeToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :membership_type, :string
  end
end
