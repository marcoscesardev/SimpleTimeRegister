class TimeRegister < ApplicationRecord
  belongs_to :employee
  belongs_to :registered_by, class_name: 'Employee'

  validates :registered_at, :employee_id, :registered_by_id, presence: true
end
