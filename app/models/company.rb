class Company < ApplicationRecord
  belongs_to :city
  enum company_type: [:main, :branch]
end
