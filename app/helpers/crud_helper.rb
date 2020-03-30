module CrudHelper
  def plural(klass = resource_class)
    klass.model_name.human(count: 'many')
  end

  def table_list
    content_tag :div, class: "" do
      content_tag :div, class: "col-xs-12" do
        content_tag :div, class: "table-responsive dt" do
          content_tag :div, class: "dataTables_wrapper" do
            yield
          end
        end
      end
    end
  end

  def list_attributes_show
    resource.attributes 
  end

  def list_attributes(object)
    object.new.attributes.keys - ["created_at", "updated_at"]
  end

  def formatted_attribute(resource, attribute, options = {})
    attribute = real_attribute(attribute)
    human_attr = attribute.to_s + '_humanize'
    
    if resource.respond_to?(human_attr)
      return resource.send(human_attr)
    elsif resource.respond_to?('translated_' + attribute.to_s)
      resource.send('translated_' + attribute.to_s)
    else
      value = resource.send(attribute)
      value = value.send(options[:attribute_method]) if options[:attribute_method]

      value
    end
  end

  def flash_message(flash)
    return [flash] if flash&.class.to_s == 'String'
    return [] if flash.blank?

    flash.map do |attribute, message|
      if respond_to?(:resource_class)
        "#{localized_attribute(resource_class.new.class, attribute)} " \
          "#{message.is_a?(String) ? message : message.join(', ')}"
      else
        attribute
      end
    end
  end

  def smart_resource_path(object, action = :show)
    path_base = "/#{object.class.name.underscore.pluralize}"
    
    path_base + 
      case action
      when :show
        "/#{object.id}"
      when :edit
        "/#{object.id}/edit"
      end
  end


  def back_button
    link_to raw(t('buttons.back')), :back, class: 'btn btn-lg btn-warning'
  end

  def create_link
    if can? :new, resource
      link_to raw(t('buttons.new')), new_resource_path, { class: 'btn btn-lg btn-primary' }
    end
  end

  def edit_link(object, options = []) 
    if can? :edit, object
      link_to(raw(options[:label]), smart_resource_path(object, :edit), class: options[:class])
    end
  end

  def destroy_link(object, options = []) 
    if can? :destroy, object
      link_to(
        raw(options[:label]),
        resource_path(object),
        class: options[:class],
        method: :delete 
      )
    end
  end

  def show_link(object)
    if can? :show, object
      link_to raw('<i class="material-icons">remove_red_eye</i>'), smart_resource_path(object)
    end
  end

  def value_by_field_type(value)
    klass = value.class

    case klass.to_s
    when 'TrueClass'
      "<span class='badge badge-pill badge-success'>#{I18n.t(value)}</span>".html_safe
    when 'FalseClass'
      return "<span class='badge badge-pill badge-danger'>#{I18n.t(value)}</span>".html_safe
    when 'ActiveSupport::TimeWithZone'
      I18n.l(value, format: :date_and_hour)
    else
      value.blank? ? '-' : value
    end
  end
end
