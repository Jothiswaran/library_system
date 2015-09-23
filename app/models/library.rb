class  Library< ActiveRecord::Base
	attr_accessible :name, :city, :phone
	validates_presence_of :name, :city,:phone   #it is just a method :name is argument
	named_scope :findLibrary
	has_many :borrows
	has_many :users
end