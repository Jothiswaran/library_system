class ExpectedReturnDate < ActiveRecord::Migration
  def self.up
  	add_column :borrows, :expected_return_date, :date
  end

  def self.down
  	add_column :borrows, :expected_return_date
  end
end
