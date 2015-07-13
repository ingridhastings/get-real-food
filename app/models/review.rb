class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :farm

	validates_presence_of :score
	validates_presence_of :content

	after_save :calculate_average

	def calculate_average
		a = self.farm.average_rating
		self.farm.update_attributes(total_average_rating: a)
	end
end
