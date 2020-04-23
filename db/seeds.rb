15.times do |n|
  User.create!(
    name: "テストマン#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: 'foobar',
    password_confirmation: 'foobar',
    avatar: ''
    )
end