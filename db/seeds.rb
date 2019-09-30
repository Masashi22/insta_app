User.create!(username: "Example User",
            email: "example@railstutorial.org",
            password: "password",
            password_confirmation: "password",
            admin: true)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  user = User.new(username: name,
              email: email,
              password: "password",
              password_confirmation: "password")
  user.skip_confirmation!
  user.save
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
