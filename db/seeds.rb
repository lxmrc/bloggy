10.times do |n|
  username = Faker::Twitter.screen_name
  email = "user-#{n+1}@example.com"
  password = "password"
  User.create!(username: username,
               email: email,
               password:              password,
               password_confirmation: password)
end

20.times do
  user = User.all.sample
  content = Faker::Lorem.sentence(word_count: rand(20))
  user.posts.create!(content: content) 
end
