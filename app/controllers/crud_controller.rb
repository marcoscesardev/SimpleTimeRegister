class CrudController < ApplicationController
  inherit_resources

  load_and_authorize_resource
  helper_method :resource_name, :resource_class, :resource

  def index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def create
    @object = resource_class.new(object_params)

    if @object.save
      flash[:notice] = I18n.t(
        'messages.object_successfully_created',
        object_name: resource_class.model_name.human
      )

      redirect_to resource_path(@object)
    else
      flash[:alert] = @object.errors if @object.errors.present?

      render :new
    end
  end

  def update
    @object = resource_class.find(params[:id])

    if @object.update(object_params)
      flash[:notice] = I18n.t(
        'messages.object_successfully_updated',
        object_name: resource_class.model_name.human
      )

      redirect_to resource_path(@object)
    else
      flash[:alert] = @object.errors if @object.errors.present?

      render :edit
    end
  end

  def resource_name
    controller_name.singularize
  end
  
  def resource_params
    object_params.fetch(resource_name, {})
  end

  def resource_class(resource = resource_name)
    resource.camelize.constantize
  end

  def resource
    if instance_variable_defined?(:"@#{resource_name}")
      instance_variable_get(:"@#{resource_name}")
    else
      instance_variable_set("@#{resource_name}", resource_class.find_by(id: params[:id]))
    end
  end

  protected

  def build_resource
    resource_class.new
  end
end
