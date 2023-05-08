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
class QuizRealizationAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :quiz_realization

  validates :answer, numericality: { greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 4, allow_nil: true }
end
