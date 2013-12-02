require 'faker'

  rand(4..10).times do
    password = Faker::Lorem.characters(10)
    u = User.new(
      name: Faker::Name.name, 
      email: Faker::Internet.email, 
      password: password, 
      password_confirmation: password)
    u.skip_confirmation!
    u.save

  rand(5..12).times do
    p = u.projects.create(
      title: Faker::Lorem.words(rand(1..10)).join(" "), 
      body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
    p.update_attribute(:created_at, Time.now - rand(600..31536000))

  end
end

u = User.first
u.skip_reconfirmation!
u.update_attributes(email: 'smoonpeyes@gmail.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"


