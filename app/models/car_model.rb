class CarModel < ApplicationRecord
  belongs_to :car_brand
  belongs_to :car_type
  belongs_to :company
  belongs_to :created_by, class_name: "User", foreign_key: :created_by

  has_many :cars

  validates :name, presence: true
end
