puts "Seeds: start"

User.create!(email: 'test@test.com',password: 'adminadmin', username: 'admin')

5.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    remote_avatar_url: Faker::Avatar.image(slug = nil, size = '50x50')
    )
end

users = User.all
image_tags = [["earth", 7]]
image_urls = {
  earth: ["http://i.imgur.com/uaoMjk5.jpg", "http://i.imgur.com/EA0JNvT.jpg",
    "http://i.imgur.com/dKknDjW.jpg", "http://i.imgur.com/Mzggt4v.jpg", "http://i.imgur.com/cJAkSwJ.jpg",
    "http://i.imgur.com/Fk0mHMo.jpg", "http://i.imgur.com/NOM4GlN.jpg"]
}


image_tags.each do |tag|
  tag[1].times do |n|
    user = users.sample
    Post.create!(
      body: Faker::Hacker.say_something_smart,
      title: "#{Faker::Hacker.verb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
      user: user,
      remote_image_url: image_urls[tag[0].to_sym][n],
      tag_list: [tag[0], "image"].join(", ")
      )
  end
end

20.times do
  user = users.sample
  post = Post.create!(
    body: Faker::Hacker.say_something_smart,
    title: "#{Faker::Hacker.verb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    user: user,
    image: Faker::Avatar.image,
    tag_list: "blog"
  )
  rand(0..5).times do 
    user = users.sample
    rand(0..1) == 1 ? post.liked_by(user) : post.disliked_by(user)
  end
  rand(0..7).times do
    comment = post.comments.create!(
      body: Faker::Lorem.sentence,
      user: users.sample
        )
    rand(0..5).times do 
      user = users.sample
      rand(0..1) == 1 ? comment.liked_by(user) : comment.disliked_by(user)
    end
  end


end

puts "Seeds: done"

