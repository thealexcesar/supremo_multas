class Translate
  def self.created_msg controller_name = nil
    I18n.t("general.messages.created", model: I18n.t("activerecord.models.#{controller_name.underscore}"))
  end
  def self.destroyed_msg controller_name = nil
    I18n.t("general.messages.destroyed", model: I18n.t("activerecord.models.#{controller_name.underscore}"))
  end
  def self.registered_msg controller_name = nil
    I18n.t("general.messages.created", model: I18n.t("activerecord.models.#{controller_name.underscore}"))
  end
  def self.updated_msg controller_name = nil
    I18n.t("general.messages.updated", model: I18n.t("activerecord.models.#{controller_name.underscore}"))
  end


  # ------ errors ------
  # def self.register_error controller_name = nil
  # end
  # def self.edit_error controller_name = nil
  # end
  # def self.destroy_error controller_name = nil
  # end
end