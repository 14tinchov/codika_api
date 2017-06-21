puts "Create an user"
User.create(email: 'user@example.com', password: 'asdqwe123', password_confirmation: 'asdqwe123')
puts "Create a posts"
(1..10).each do
  Post.create(
    title: Faker::GameOfThrones.character,
    body: Faker::Lorem.paragraph
  )
  print "."
end
puts "\n Done Populate !"