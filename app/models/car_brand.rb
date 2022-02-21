class CarBrand < ApplicationRecord
  belongs_to :company
  belongs_to :created_by, class_name: "User", foreign_key: :created_by
  has_many :car_models

  validates :name, presence: true
end
