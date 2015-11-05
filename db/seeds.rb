# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

anthony = User.find(1)
anthony.tasks.create(description: "Clean dishes", category: "work", points: -1)
anthony.tasks.create(description: "Wash hair", category: "work", points: -1)
anthony.tasks.create(description: "Do project", category: "work", points: -1)
anthony.tasks.create(description: "Buy groceries", category: "work", points: -1)

anthony.tasks.create(description: "Watch movie", category: "play", points: 1)
anthony.tasks.create(description: "Read book", category: "play", points: 1)
anthony.tasks.create(description: "Go drink", category: "play", points: 1)
anthony.tasks.create(description: "Shopping", category: "play", points: 1)
