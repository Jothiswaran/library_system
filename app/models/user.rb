require 'digest'
require 'rubygems'
require 'tire'
class User < ActiveRecord::Base

	include Tire::Model::Search
	#include Tire::Model::Callbacks
#	include Elasticsearsch::Model
	# include Elasticsearch::Model::Callbacks
	
	has_many :borrows, :dependent => :destroy
	has_many :books, :through => :borrows
	belongs_to :library
	attr_accessible :name, :email, :password, :password_confirmation, :library_id
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	attr_accessor :password
	validates_presence_of :name, :email   #it is just a method :name is argument
	validates_length_of :name, :maximum => 50
	validates_format_of   :email, :with => EmailRegex
	validates_uniqueness_of :email, :case_sensitive => false
	validates_confirmation_of :password
	validates_presence_of :password
	validates_length_of :password, :within => 6..40
	before_save :encrypt_password

	named_scope :findAll,  lambda { |libraryid| {:conditions => ['library_id = ?', "#{libraryid}" ] } }

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def remember_me!
		self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}") 
		save_without_validation
	end

	private
	def encrypt_password
		unless password.nil?
			self.salt=make_salt
			self.encrypted_password = encrypt(password)
		end
	end
	def encrypt(string)
		secure_hash("#{salt}#{string}")
	end
	def make_salt
		secure_hash("#{Time.now.utc}#{password}")
	end
	def secure_hash(string) 
		Digest::SHA2.hexdigest(string)
	end
end