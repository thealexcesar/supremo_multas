class CarType < ApplicationRecord
  has_many :car_models
  belongs_to :company

  validates :name, presence: true
end
