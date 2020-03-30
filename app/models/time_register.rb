class TimeRegister < ApplicationRecord
  belongs_to :employee
  belongs_to :registered_by, class_name: 'Employee'

  validates :registered_at, :employee_id, :registered_by_id, presence: true

  validate :cannot_register_in_the_future

  private

  def cannot_register_in_the_future
    if registered_at > DateTime.now
      errors.add(:registered_at, I18n.t('messages.invalid'))
    end
  end 
end
