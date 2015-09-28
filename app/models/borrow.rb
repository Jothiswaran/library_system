class Borrow < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	named_scope :issued, :conditions => { :returned => false}

	named_scope :pendingreturn, { :conditions => [ "expected_return_date > ? and returned = ?", Date.today, 0] }
	def self.returnbook(id)
		find(:all, :conditions => ['user_id = ? and returned = ?', id, 0])
	end
end