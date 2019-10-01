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

users = User.all
user  = users.first
following = users[2..10]
followers = users[4..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
