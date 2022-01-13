module ApplicationHelper
  def options_for_enum enum_name
    model_name = controller_name.classify.constantize
    values = eval("#{model_name}.#{enum_name}")
    values.keys.map { |w| [t("activerecord.attributes.#{enum_name}.#{w}" ), w] }
  end
end
