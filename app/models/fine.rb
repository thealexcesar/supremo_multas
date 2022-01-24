class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :branch_id, optional: true
  enum fine_status: [:identified, :unidentified]
  enum company_type: [:main, :branch]
end
