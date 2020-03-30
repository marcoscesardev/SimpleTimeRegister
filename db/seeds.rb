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

500.times.map do 
  begin
    employee_id = (2..15).to_a.sample

    TimeRegister.create!(
      registered_at: Faker::Time.between(from: 5.days.from_now, to: 10.minutes.from_now),
      employee_id: employee_id,
      registered_by_id: employee_id,
      registered_at: Time.current
    )
  rescue
    next
  end
end
