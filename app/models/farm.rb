class Farm < ActiveRecord::Base
	validates_presence_of :name, :address, :website, :user_id
	belongs_to :user

	geocoded_by :address
	after_validation :geocode

	reverse_geocoded_by :latitude, :longitude
   	after_validation :reverse_geocode 

	has_many :reviews, dependent: :destroy

	def average_rating
		self.reviews.sum(:score) / reviews.size
	rescue ZeroDivisionError
		0
	end

	def self.search(search)
		if search
			where(['name LIKE ? OR address LIKE ?', "#{search}", "#{search}"])
		else
			all
		end
	end



end
