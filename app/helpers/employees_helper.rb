module EmployeesHelper
  def list_attributes(object = resource_class)
    object.new.attributes.keys - 
      [
        "created_at",
        "updated_at",
        "encrypted_password"
      ]
  end

  def list_attributes_show
    resource.attributes.keys - ["encrypted_password"]
  end
end
