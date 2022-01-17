class ApplicationController < ActionController::Base
  def create_msg
    I18n.t("general.messages.created", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  end
  def destroyed_msg
    I18n.t("general.messages.destroyed", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  end
  def updated_msg
    I18n.t("general.messages.updated", model: I18n.t("activerecord.models.#{controller_name.classify.underscore}"))
  end
end
