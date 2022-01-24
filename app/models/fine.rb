class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :company_id
end
