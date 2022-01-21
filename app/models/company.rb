class Company < ApplicationRecord
  belongs_to :city
  has_many :branches, class_name: "Company", foreign_key: :company_id
  enum company_type: [:main, :branch]
end
