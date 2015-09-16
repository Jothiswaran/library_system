class AddSuperadminToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :superadmin, :boolean
  end

  def self.down
  end
end
