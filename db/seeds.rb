employees = 
  [{
    name: 'Admin',
    email: 'admin@admin.com',
    password: '12345678',
    is_admin: true,
    address: Faker::Address.full_address,
    cpf: Faker::Number.number(digits: 11),
    born_day: Faker::Date.birthday,
    phone: Faker::Number.number(digits: 11)
  }].concat(
    14.times.map do
      { 
        name: Faker::TvShows::HowIMetYourMother.unique.character,
        email: Faker::Internet.unique.email, 
        password: '12345678',
        address: Faker::Address.full_address,
        cpf: Faker::Number.number(digits: 11),
        born_day: Faker::Date.birthday,
        phone: Faker::Number.number(digits: 11)
      }
    end
  )

Employee.create!(employees)

280.times.each do |index|
  begin
    employee_id = (2..15).to_a.sample

    TimeRegister.create!(
      registered_at: Faker::Time.between(from: DateTime.now - 5, to: DateTime.now),
      employee_id: employee_id,
      registered_by_id: employee_id
    )
  rescue
    next
  end
end
