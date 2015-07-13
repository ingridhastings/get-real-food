class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :farm

	validates_presence_of :score
	validates_presence_of :content
end
