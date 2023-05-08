# == Schema Information
#
# Table name: quiz_realizations
#
#  id          :bigint           not null, primary key
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :bigint           not null
#  user_id     :bigint           not null
#
class QuizRealization < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :quiz_realization_answers, dependent: :destroy
end
