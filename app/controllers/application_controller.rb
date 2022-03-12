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

  # protected
  #
  # def created_msg
  #   I18n.t("general.messages.created", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  # end
  # def destroyed_msg
  #   I18n.t("general.messages.destroyed", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  # end
  # def updated_msg
  #   I18n.t("general.messages.updated", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  # end
  # def enable_disable_msg status
  #   I18n.t('general.messages.status', status: I18n.t("activerecord.attributes.statuses.#{status}"))
  # end
end
