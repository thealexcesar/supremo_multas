class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :branch_id
  belongs_to :detran, class_name: "State", foreign_key: :detran_id
  belongs_to :fine_point

  enum fine_status: [:identified, :unidentified]


end
