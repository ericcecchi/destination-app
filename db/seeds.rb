# frozen_string_literal: true

# Create a main sample user.
User.create!(
  name:                  'Eric Cecchi',
  email:                 'eric.cecchi@gmail.com',
  password:              'foobar',
  password_confirmation: 'foobar',
  admin:                 true,
  activated:             true,
  activated_at:          Time.zone.now
)

User.create!(
  name:                  'Zachary Collazo',
  email:                 'ztcollazo08@gmail.com',
  password:              'foobar',
  password_confirmation: 'foobar',
  admin:                 true,
  activated:             true,
  activated_at:          Time.zone.now
)

# Generate a bunch of additional users.
25.times do |n|
  name     = Faker::Name.name
  email    = "example-#{n + 1}@destination.app"
  password = 'password'
  User.create!(
    name:                  name,
    email:                 email,
    password:              password,
    password_confirmation: password,
    activated:             true,
    activated_at:          Time.zone.now
  )
end

destinations = [
  {
    params:            {
      name:      'Chicago, IL',
      content:   'Coolest city in the world',
      image_url: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F02%2F11%2Fchicago-illinois-CHITG0221.jpg&w=1050&h=704&c=sc&poi=face&q=85'
    },
    external_place_id: 'ChIJ7cv00DwsDogRAMDACa2m4K8'
  },
  {
    params:            {
      name:      'Seattle, WA',
      content:   'Supersonic city',
      image_url: 'https://media.cntraveler.com/photos/60480c67ff9cba52f2a91899/16:9/w_2560%2Cc_limit/01-velo-header-seattle-needle.jpg'
    },
    external_place_id: 'ChIJVTPokywQkFQRmtVEaUZlJRA'
  },
  {
    params:            {
      name:      'Richmond, VA',
      content:   'Historic capital city of Virginia',
      image_url: 'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,h_800,q_65,w_1920/v1/clients/virginia/CN19071201V_233_57a18292-4ab6-4633-b730-60cf1f0e531b.jpg'
    },
    external_place_id: 'ChIJ7cmZVwkRsYkRxTxC4m0-2L8'
  }
]

destinations.each do |destination|
  Destinations::Create.run!(destination)
end

# Generate posts for a subset of users.
users = User.order(:created_at).take(6)
users.each do |user|
  3.times do
    title   = Faker::Lorem.sentence(word_count: 3)
    description = Faker::Lorem.sentence(word_count: 250)
    user.guides.create(title: title, description: description, destination: Destination.limit(1).offset(rand(3)).take)
  end
  20.times do
    title   = Faker::Lorem.sentence(word_count: 3)
    content = Faker::Lorem.sentence(word_count: 200)
    user.recommendations.create!(title: title, content: content, place: Destination.limit(1).offset(rand(3)).take)
  end
end
