class Car < ApplicationRecord
  belongs_to :car_model
  enum status: [:enabled, :disabled]

  validates :year, presence: true
  validates :license_plate, uniqueness: true
end