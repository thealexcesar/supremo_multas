class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  enum status: [:enabled, :disabled]
  enum user_type: [:users, :admin, :manager]
  # validate :name, :status, user_types, presence: true

  def admin?
    self.user_type == "admin"
  end
  def manager?
    self.user_type == "manager"
  end
end
