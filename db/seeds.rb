# frozen_string_literal: true

# Create a main sample user.
User.create!(
  name: 'Example User',
  email: 'example@railstutorial.org',
  password: 'foobar',
  password_confirmation: 'foobar',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

# Generate posts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.words(number: 3)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.recommendations.create!(title: title, content: content) }
end
