class CarModel < ApplicationRecord
  belongs_to :car_brand
  belongs_to :car_type
  has_many :cars

  validates :name, presence: true
end
