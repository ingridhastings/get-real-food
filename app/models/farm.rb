class Farm < ActiveRecord::Base
	validates_presence_of :name, :phone, :address, :website, :user_id

	belongs_to :user

	geocoded_by :address
	after_validation :geocode
	has_many :reviews, dependent: :destroy
end
