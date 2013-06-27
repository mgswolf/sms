module ApplicationHelper
  def t_field(model,field)
    t("activerecord.attributes.#{model}.#{field}")
  end
end
