module ApplicationHelper

  def current_company
    current_user.company
  end

  def options_for_enum enum_name
    model_name = controller_name.classify.constantize
    values = eval("#{model_name}.#{enum_name}")
    values.keys.map { |w| [t("activerecord.attributes.#{enum_name}.#{w}" ), w] }
  end

  def enum_to_name model, enum_name
    value = model.try(enum_name)
    t("activerecord.attributes.#{enum_name.to_s.pluralize}.#{value}") unless value.blank?
  end

  def editing_model
    model_name = controller_name.classify.underscore
    t("general.editing", model: t("activerecord.models.#{model_name}") )
  end
  def new_model
    model_name = controller_name.classify.underscore
    t("general.new_model_f", model: t("activerecord.models.#{model_name}") )
  end

end
