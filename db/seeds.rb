
3.times do
  User.create( name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password )
end

8.times do
  Album.create( name: Faker::Hacker.adjective, owner_id: rand(1..3), description: Faker::Hacker.say_something_smart )
end

30.times do
  Image.create( title: Faker::Hacker.adjective, album_id: rand(1..8), creator_id: rand(1..3), url: Faker::Avatar.image )
end
