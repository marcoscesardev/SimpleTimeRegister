class HomeController < ApplicationController
  def index; end

  def time_register
    @object = TimeRegister.new(
      employee_id: current_employee.id,
      registered_at: Time.now,
      registered_by_id: current_employee.id,
    )

    if @object.save
      flash[:notice] = I18n.t(
        'messages.object_successfully_created',
        object_name: TimeRegister.model_name.human
      )

      render :index
    else 
      flash[:alert] = @object.errors if @object.errors.present?

      render :index
    end
  end
end
