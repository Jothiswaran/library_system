class Libraries < ActiveRecord::Migration
  def self.up
  	create_table :libraries do |t|
      t.string :name
      t.string :city
      t.string :phone
      t.timestamps
    end
  end

  def self.down
  end
end
