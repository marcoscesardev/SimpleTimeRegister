class Ability
  include CanCan::Ability
  
  def initialize(employee)
    if employee&.is_admin?
      can :manage, :all
    else
      can :read, Employee, id: employee.id
      can :read, TimeRegister, employee_id: employee.id
    end
  end
end
