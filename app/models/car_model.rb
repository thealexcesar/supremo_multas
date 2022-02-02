class CarModel < ApplicationRecord
  belongs_to :car_brand
  belongs_to :car_type
  belongs_to :company

  has_many :car_models

  validates :name, presence: true
end
