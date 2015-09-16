class AddLibraryIdToBooks < ActiveRecord::Migration
  def self.up
  	add_column :books, :library_id, :integer
  end

  def self.down
  end
end
