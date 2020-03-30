class TimeRegistersController < CrudController
  before_action :load_collections, only: [:new, :create, :edit, :update]

  def collection
    super.order(registered_at: :desc).includes(:employee)
  end

  def load_collections
    @current_ability = Employee.last
    @employees = Employee.all
  end

  private

  def object_params
    if params[:action] == "create"
      params["time_register"].merge!({"registered_by_id": current_employee.id})
    end
    
    params.require(:time_register).permit(
      :employee_id,
      :registered_at,
      :justification,
      :registered_by_id
    )
  end
end
