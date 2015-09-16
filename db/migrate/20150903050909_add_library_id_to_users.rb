class AddLibraryIdToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :library_id, :integer
  end

  def self.down
  end
end
