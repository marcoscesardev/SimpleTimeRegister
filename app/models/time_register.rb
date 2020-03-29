class TimeRegister < ApplicationRecord
  belongs_to :employee

  belongs_to :registered_by, class_name: 'Employee'
end
