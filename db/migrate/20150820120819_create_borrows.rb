class CreateBorrows < ActiveRecord::Migration
  def self.up
    create_table :borrows do |t|
    	t.date :borrow_date
    	t.date :return_date
    	t.boolean :returned
    	t.integer :user_id
    	t.integer :book_id

      t.timestamps
    end
    add_index :borrows, :user_id
    add_index :borrows, :book_id
  end

  def self.down
    drop_table :borrows
  end
end