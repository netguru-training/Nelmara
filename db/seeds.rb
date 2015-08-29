puts "Seeds: start"

User.create!(email: 'admin@admin.com',password: 'adminadmin', username: 'admin')

5.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
end

users = User.all

20.times do
  user = users.sample
  Post.create!(
    body: Faker::Hacker.say_something_smart,
    title: Faker::Hacker.verb + Faker::Hacker.adjective + Faker::Haker.noun,
    user: user,
    image: Faker::Avatar.image
    )
(0..7).times do
  Comment.create!(
    body: Faker::Lorem.sentence,
    user: users.sample
      )
  end


end

puts "Seeds: done"
