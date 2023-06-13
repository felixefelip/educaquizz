# == Schema Information
#
# Table name: quiz_realization_answers
#
#  id                  :bigint           not null, primary key
#  answer              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  question_id         :bigint           not null
#  quiz_realization_id :bigint           not null
#
module Quiz::RealizationAnswer
  class Record < ApplicationRecord
    self.table_name = "quiz_realization_answers"

    belongs_to :question, class_name: "::Quiz::Question::Record"
    belongs_to :quiz_realization, class_name: "::Quiz::Realization::Record"

    has_one :quiz, through: :quiz_realization
    has_many :questions, through: :quiz

    validates :answer, numericality: { greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: 4, allow_nil: true }

    def correct?
      answer == question.correct_answer
    end

    def wrong?
      !correct?
    end
  end
end
