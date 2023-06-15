# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if (Quiz::Record.count.zero?)
  ApplicationRecord.transaction do
    quiz1 = Quiz::Record.create!(description: "História")

    Quiz::Question::Record.create!(description: "Qual o nome do presidente do Brasil que ficou conhecido como Jango",
                     difficulty: 3,
                     quiz_id: quiz1.id,
                     alternative1: "Jânio Quadros",
                     alternative2: "Jacinto Anjos",
                     alternative3: "Getúlio Vargas",
                     alternative4: "João Goulart",
                     correct_answer: 3)

  Quiz::Question::Record.create!(description: "Em que ano foi descoberto o Brasil?",
                     difficulty: 2,
                     quiz_id: quiz1.id,
                     alternative1: 1891,
                     alternative2: 2010,
                     alternative3: 1520,
                     alternative4: 1500,
                     correct_answer: 4)
  end
end
