class CarBrand < ApplicationRecord
  has_many :car_models
  belongs_to :company
end
