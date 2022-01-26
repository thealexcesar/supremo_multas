class State < ApplicationRecord
  belongs_to :country
  has_many :cities

  validates :acronym, :name, presence: true
end
