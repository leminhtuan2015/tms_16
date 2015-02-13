User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             suppervisor:     true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
  Course.create!(name: "course-#{n+1}", description: name)
  Subject.create!(name: "subject-#{n+1}", description: email)
  5.times do |m|
    Task.create!(name: "task-#{n+1}", subject_id: m+1)
  end
end