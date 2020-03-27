module ApplicationHelper
  def real_attribute(attribute, klass = nil)
    if attribute.to_s.end_with?('_id')
      attribute = attribute.to_s.split('_id').first

      if klass.blank?
        return attribute
      end
    end

    attribute
  end

  def localized_attribute(klass, attribute_name)
    klass.human_attribute_name real_attribute(attribute_name)
  end

  def localized(collection_object)
    collection_object.map(&:localized)
  end

  def object_title(object = resource_class, plural = false)
    I18n.t("activerecord.models.#{object.model_name.i18n_key}.#{plural ? :other : :one}")
  end

  def menu(model, icon)
    render 'layouts/menu', { model: model, controller: model.to_s.downcase.pluralize, icon: icon }
  end
end
