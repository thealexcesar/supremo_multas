class Company < ApplicationRecord
  belongs_to :city
  belongs_to :created_by, class_name: "User", foreign_key: :created_by

  has_many :cars
  has_many :car_brands
  has_many :car_models
  has_many :car_types
  has_many :fines
  has_many :fine_points
  has_many :users
  has_many :branches, class_name: "Company", foreign_key: :company_type

  enum company_type: [:main, :branch]

  validates :address, :cnpj, :district, :name, :phone, :zipcode, presence: true
end
