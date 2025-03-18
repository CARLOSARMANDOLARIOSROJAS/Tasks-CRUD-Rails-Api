require 'faker'

10.times do
  Task.create(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    completed: [true, false].sample
  )
end
