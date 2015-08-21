class Borrow < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	
	def self.returnbook(user_id)
		find(:all, :select => 'book_id', :conditions => ['user_id LIKE ? and returned = ?', "%#{user_id}%",false])
	end

end