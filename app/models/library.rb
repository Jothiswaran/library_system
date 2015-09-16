class  Library< ActiveRecord::Base
	validates_presence_of :name,:phone,:city
	named_scope :findLibrary
	has_many :borrows
	has_many :users
end