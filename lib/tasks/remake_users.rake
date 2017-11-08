namespace :db do
  desc "Import User"
  task users: [:environment] do
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password = "123456"
      user = User.create! nick_name: name, email: email, password: password,
        password_confirmation: password
    end

    User.create! nick_name: "Admin", email: "admin@gmail.com",
      password: "123456", admin: true
  end
end
