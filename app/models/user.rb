class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  has_many :farms, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
