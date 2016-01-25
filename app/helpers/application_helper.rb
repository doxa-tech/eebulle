module ApplicationHelper

  def link_to_active(label,path)
    link_to label, path, class: (current_page?(path)? 'active' : nil)
  end

  def options_for_enum(record, enum)
    model = record.class
    pluralized_enum = enum.to_s.pluralize
    options_for_select(model.send(pluralized_enum).map {|k, v| [ t("#{model.model_name.i18n_key}.#{pluralized_enum}.#{k}"), k ]}, record.send(enum))
  end

end
