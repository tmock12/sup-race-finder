Fabricator :race do
  title { Faker::Company.name }
  date { rand(100).days.from_now }
end

Fabricator :active_race, from: :race do
  active { true }
end
