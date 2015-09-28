require 'rubygems'
require 'tire'
class  Library < ActiveRecord::Base
	include Tire::Model::Search
	# include Tire::Model::Callbacks
	attr_accessible :name, :city, :phone
	validates_presence_of :name, :city,:phone   #it is just a method :name is argument
	named_scope :findLibrary
	has_many :borrows
	has_many :users

	after_save :update_es_data

	mapping do 
		indexes :id, type: 'integer'
		indexes :name, type: 'string'
		indexes :city, type: 'string'
		indexes :phone, type: 'string'
	end

	def self.search(str)
		s=Tire.search 'libraries' do
			query do
				string "id:#{str}"
			end
		end
	s.results
	end

	def update_es_data
		update_index_es
	end

	def to_indexed_json
    	to_json
  	end 
end