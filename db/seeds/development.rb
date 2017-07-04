# Load all factories
Dir[Rails.root.join("spec/factories/*.rb")].each do |file|
  require file
end

# Clean up database
[User, Category].map(&:delete_all)

# Create default user
jesse = FactoryGirl.create(:user, {
  name: "Jessé Soares",
  email: "jessecsoares@gmail.com"
})

# Create 50 users
users = [jesse]
50.times do
  name = Faker::Name.name
  users << FactoryGirl.create(:user, {
    name: name,
    email: Faker::Internet.email(name)
  })
end

# Create categories
categories = ["Ruby on Rails", "Python", "JavaScript", "Java"].map do |name|
  FactoryGirl.create(:category, name: name)
end

# Create 100 questions
questions = []
100.times do
  questions << FactoryGirl.create(:question, {
    user: users.sample,
    category: categories.sample,
    title: Faker::Lorem.sentence([*3..10].sample),
    description: Faker::Lorem.paragraphs([*3..5].sample).join("\n\n")
  })
end