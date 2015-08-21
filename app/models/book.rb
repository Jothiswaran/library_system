require 'digest'
class Book < ActiveRecord::Base
		has_many :borrows, :dependent => :destroy
		has_many :users, :through => :borrow
		attr_accessible :name, :author, :available, :id
		validates_presence_of :name, :author   #it is just a method :name is argument
		validates_length_of :name, :maximum => 50
		validates_length_of :author, :maximum =>30
		validates_uniqueness_of :name, :case_sensitive => false

	def self.searchBook(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end

	end

	def self.searchAuthor(search)
		if search
			find(:all, :conditions => ['author LIKE ?', "%#{search}%"])
		else
			find(:all)
		end

	end

	def self.findBook(flag)
		if(flag)
			find(:all)
		else
			find(:all, :conditions => ['available = 1'])
		end
	end

	def self.update(id)
		@b=Book.find(id)
		@b.available=false
		@b.save

	end


end