class Addimagetobooks < ActiveRecord::Migration
  def self.up
  	add_column :books,:image, :has_attached_file
  end
  
  def self.down
  end
end
