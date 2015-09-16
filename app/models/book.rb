require 'digest'
class Book < ActiveRecord::Base
		named_scope :findBook,  lambda { |libraryid| {:conditions => ['library_id = ?', "#{libraryid}" ] } }		

		named_scope :available, :conditions => { :available => 1}

		named_scope :searchBook,  lambda { |search, libraryid| {:conditions => ['name LIKE ? and library_id = ?', "%#{search}%","#{libraryid}" ] } }

		named_scope :searchAuthor, lambda { |search,libraryid| {:conditions => ['author LIKE ? and library_id=?', "%#{search}%","#{libraryid}" ] } }

		has_many :borrows
		has_many :users, :through => :borrows
		belongs_to :library
		attr_accessible :name, :author, :available, :id,:library_id
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