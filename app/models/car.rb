class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :company
  enum status: [:enabled, :disabled]

  validates :year, presence: true
  validates :license_plate, uniqueness: true
end