User.create!(username: "Example User",
            email: "example@railstutorial.org",
            password: "password",
            password_confirmation: "password")

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  User.create!(username: name,
              email: email,
              password: "password",
              password_confirmation: "password")
end
