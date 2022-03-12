class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_company
    current_user.company
  end
  def admin?
    self.user_type == "admin"
  end
  def manager?
    self.user_type == "manager"
  end
  def root?
    admin? || manager?
  end

  private
  def enable_disable_msg status
    I18n.t("general.messages.status", model: I18n.t("activerecord.attributes.statuses.#{status}"))
  end

end
