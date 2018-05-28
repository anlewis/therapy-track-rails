require 'faker'

user = User.create({
  uid: 'MyId',
  username: 'MyUsername',
  provider: 'MyProvider',
  name: 'MyName',
  email: ENV['test_user_email'],
  password: 'password',
  password_confirmation: 'password'
})

5.times do |index|
  start_time = Faker::Time.forward(14, :evening)
  end_time = (start_time.to_time + 1.hours).to_datetime
  Appointment.create!(summary: Faker::FunnyName.name,
                      location: Faker::Address.street_address,
                      description: Faker::ChuckNorris.fact,
                      start_time: start_time,
                      end_time: end_time,
                      user_id: user.id
                      )
end

puts "Created #{Appointment.count} appointments"
