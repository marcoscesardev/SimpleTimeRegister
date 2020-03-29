class EmployeesController < CrudController

  private

  def object_params  
    params['employee'].reject! { |key, value| key == 'password' && value.blank? }

    params.require(:employee).permit(
      :is_admin,
      :name,
      :born_day,
      :cpf,
      :address,
      :phone,
      :is_active,
      :email,
      :password
    )
  end
end
