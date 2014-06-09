Fabricator :classified do
  title { Faker::Company.name }
  price { "$#{rand(3000)}" }
  email { Faker::Internet.email }
end
