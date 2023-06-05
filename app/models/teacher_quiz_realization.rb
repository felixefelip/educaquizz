# == Schema Information
#
# Table name: teacher_quiz_realizations
#
#  id          :bigint           not null, primary key
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :bigint           not null
#  user_id     :bigint           not null
#
class TeacherQuizRealization < ApplicationRecord
  belongs_to :teacher, foreign_key: :user_id, inverse_of: :teacher_quiz_realizations, class_name: "User"
  belongs_to :quiz
end
