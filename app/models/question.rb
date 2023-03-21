# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :string
#  difficulty  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :bigint           not null
#
# Indexes
#
#  index_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#
class Question < ApplicationRecord
  belongs_to :quiz
end
