def create_project(user)
  Project.create(title: "Public #{Faker::Lorem.words(rand(1..10)).join(" ")}", 
                  body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                  user_id: user.id,
                  description: "#{Faker::Lorem.words(rand(1..10)).join(" ")}" )
end

def create_user
  standard_user = User.new(name: Faker::Name.name, 
                  email: Faker::Internet.email, 
                  password: "helloworld", 
                  password_confirmation: "helloworld")
  standard_user.skip_confirmation!
  standard_user.save
  standard_user
end

def create_collaboration(project, user)
  project.collaborations.new(user_id: user.id)
  project.save
end

4.times do
  standard_user = create_user
  rand(2..4).times do
    p = create_project(standard_user)
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
    pr = create_project(u)
      standard_user = create_user
    create_collaboration(pr, standard_user)
  end

  u = User.new(name: Faker::Name.name, 
                  email: "public@example.com", 
                  password: "helloworld", 
                  password_confirmation: "helloworld")
  u.skip_confirmation!
  u.save
  rand(2..4).times do
    p = create_project(u)
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"
