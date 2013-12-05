4.times do
  u = User.create(name: Faker::Name.name, 
                  email: Faker::Internet.email, 
                  password: "helloworld", 
                  password_confirmation: "helloworld")

  rand(5..10).times do
    p = Project.create(title: Faker::Lorem.words(rand(1..10)).join(" "), 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id)
  end
end

  u = User.create(name: Faker::Name.name, 
                  email: "premium@example.com", 
                  password: "helloworld", 
                  premium: true,
                  password_confirmation: "helloworld")

  rand(5..10).times do
    p = Project.create(title: Faker::Lorem.words(rand(1..10)).join(" "), 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id, 
                       private: true)
  end

    u = User.create(name: Faker::Name.name, 
                  email: "public@example.com", 
                  password: "helloworld", 
                  password_confirmation: "helloworld")

  rand(5..10).times do
    p = Project.create(title: Faker::Lorem.words(rand(1..10)).join(" "), 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id)
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"


