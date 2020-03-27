module EmployeesHelper
  def list_attributes(object)
    object.new.attributes.keys - 
      [
        "created_at",
        "updated_at",
        "encrypted_password",
        "reset_password_token",
        "reset_password_sent_at"
      ]
  end
end
