class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :time_registers

  validates :cpf, numericality: { only_integer: true}, length: { is: 11 }, uniqueness: true
  validates :born_day, :name, :cpf, :address, :phone, :email, presence: true

  validate :invalid_age
  
  scope :active, -> { where(is_active: true) }

  def to_s
    "#{id} - #{name}"
  end

  def active_for_authentication?
    super && is_active?
  end

  private

  def invalid_age
    if (DateTime.now.year - born_day.year) < 14 || (DateTime.now.year - born_day.year) > 120
      errors.add(:born_day, I18n.t('messages.invalid'))
    end
  end 
end
