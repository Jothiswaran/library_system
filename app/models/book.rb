require 'digest'
class Book < ActiveRecord::Base
		named_scope :findBook

		named_scope :available, :conditions => { :available => 1}

		named_scope :searchBook,  lambda { |search| {:conditions => ['name LIKE ?', "%#{search}%" ] } }

		named_scope :searchAuthor, lambda { |search| {:conditions => ['author LIKE ?', "%#{search}%" ] } }

		has_many :borrows
		has_many :users, :through => :borrows
		attr_accessible :name, :author, :available, :id
		validates_presence_of :name, :author   #it is just a method :name is argument
		validates_length_of :name, :maximum => 50
		validates_length_of :author, :maximum =>30
		validates_uniqueness_of :name, :case_sensitive => false


	def self.update(id)
		@b=Book.find(id)
		@b.available=false
		@b.save
	end

end