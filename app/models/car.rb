class Car < ApplicationRecord
  belongs_to :car_model
  enum status: [:enabled, :disabled]
end