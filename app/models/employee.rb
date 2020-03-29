class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :time_registers

  scope :active, -> { where(is_active: true) }

  def to_s
    "#{id} - #{name}"
  end

  def active_for_authentication?
    super && is_active?
  end
end
