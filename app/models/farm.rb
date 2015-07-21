class Farm < ActiveRecord::Base
	validates_presence_of :name, :address, :website

	geocoded_by :address
	after_validation :geocode


	has_many :reviews, dependent: :destroy

	def average_rating
		self.reviews.sum(:score) / reviews.size
	rescue ZeroDivisionError
		0
	end

	def self.search(search)
		if search
			where(['name ILIKE ? OR address ILIKE ?', "%#{search}%", "%#{search}%"])
		else
			all
		end
	end



end
