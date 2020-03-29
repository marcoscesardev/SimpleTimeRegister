class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :layout_by_resource

  rescue_from Exception, with: -> { render_error 500 }
  rescue_from CanCan::AccessDenied, with: -> { render_error 403 }
  rescue_from ActiveRecord::RecordNotFound, with: -> { render_error 404 }
  rescue_from ActionController::RoutingError, with: -> { render_error 404 }

  def current_ability
    @current_ability = Ability.new(current_employee)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |employee| 
      employee.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :cpf,
        :address,
        :phone
      ) 
    end
  end

  def render_error(status = 404)
    raise unless Rails.env.production?

    render file: "public/#{status}.html", status: status, layout: false
  end

  private

  def layout_by_resource
    if devise_controller?
      "auth"
    else
      "application"
    end  
  end
end
