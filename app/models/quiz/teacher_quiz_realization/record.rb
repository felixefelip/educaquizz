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
module Quiz::TeacherQuizRealization
  class Record < ApplicationRecord
    self.table_name = "teacher_quiz_realizations"

    belongs_to :teacher, foreign_key: :user_id,
                         inverse_of: :teacher_quiz_realizations,
                         class_name: "::User"

    belongs_to :quiz, class_name: "::Quiz::Record"

    has_many :quiz_realizations, dependent: :destroy,
                                 inverse_of: :teacher_quiz_realization,
                                 foreign_key: :teacher_quiz_realization,
                                 class_name: "::Quiz::TeacherQuizRealization::Record"
  end
end
