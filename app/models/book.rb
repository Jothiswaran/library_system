require 'digest'
class Book < ActiveRecord::Base
		attr_accessible :name, :author, :available
		validates_presence_of :name, :author   #it is just a method :name is argument
		validates_length_of :name, :maximum => 50
		validates_length_of :author, :maximum =>20
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

end
