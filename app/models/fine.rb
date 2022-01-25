class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :branch_id
  enum fine_status: [:identified, :unidentified]
end
