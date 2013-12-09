4.times do
  u = User.new(name: Faker::Name.name, 
                  email: Faker::Internet.email, 
                  password: "helloworld", 
                  password_confirmation: "helloworld")
  u.skip_confirmation!
  u.save
  rand(2..4).times do
    p = Project.create(title: "Public #{Faker::Lorem.words(rand(1..10)).join(" ")}", 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id,
                       description: "#{Faker::Lorem.words(rand(1..10)).join(" ")}" )
  end
end

4.times do
  u = User.new(name: Faker::Name.name, 
                  email: Faker::Internet.email, 
                  password: "helloworld", 
                  password_confirmation: "helloworld")
  u.skip_confirmation!
  u.save
  rand(2..4).times do
    p = Project.create(title: "Private #{Faker::Lorem.words(rand(1..10)).join(" ")}", 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id, 
                       description: "#{Faker::Lorem.words(rand(1..10)).join(" ")}",
                       private: true)
  end
end

  u = User.new(name: Faker::Name.name, 
                  email: "premium@example.com", 
                  password: "helloworld", 
                  premium: true,
                  password_confirmation: "helloworld")
  u.skip_confirmation!
  u.save
  rand(2..4).times do
    p = Project.create(title: "Private #{Faker::Lorem.words(rand(1..10)).join(" ")}", 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       user_id: u.id, 
                       description: "#{Faker::Lorem.words(rand(1..10)).join(" ")}",
                       private: true)
  end

  u = User.new(name: Faker::Name.name, 
                  email: "public@example.com", 
                  password: "helloworld", 
                  password_confirmation: "helloworld")
  u.skip_confirmation!
  u.save
  rand(2..4).times do
    p = Project.create(title: "Public #{Faker::Lorem.words(rand(1..10)).join(" ")}", 
                       body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                       description: "#{Faker::Lorem.words(rand(1..10)).join(" ")}",
                       user_id: u.id)
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"