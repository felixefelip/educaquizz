# == Schema Information
#
# Table name: quiz_realizations
#
#  id                   :bigint           not null, primary key
#  finished_at          :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  quiz_availability_id :bigint           not null
#  user_id              :bigint           not null
#
module Quiz::Realization
  class Record < ApplicationRecord
    self.table_name = "quiz_realizations"

    belongs_to :user, class_name: "::User::Record"
    belongs_to :quiz_availability, class_name: "::Quiz::Availability::Record"

    has_one :quiz, through: :quiz_availability

    has_many :quiz_realization_answers, dependent: :destroy,
                                        foreign_key: :quiz_realization_id,
                                        inverse_of: :quiz_realization,
                                        class_name: "::Quiz::RealizationAnswer::Record"

    has_many :questions, through: :quiz

    def score
      correct_answers_count = quiz_realization_answers.count(&:correct?)
      questions_total_count = questions.count

      (correct_answers_count * 10) / questions_total_count
    end

    def next_question
      quiz.questions[quiz_realization_answers.count]
    end

    def find_realization_answer_by_question(question)
      quiz_realization_answers.find_by(question:)
    end
  end
end
