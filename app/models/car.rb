class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :company
  belongs_to :created_by, class_name: "User", foreign_key: :created_by

  enum status: [:enabled, :disabled]

  validates :license_plate, uniqueness: true
end