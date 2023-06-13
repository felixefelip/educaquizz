# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
module Quiz
  class Record < ApplicationRecord
    self.table_name = "quizzes"

    has_many :questions, dependent: :destroy,
                         inverse_of: :quiz,
                         foreign_key: :quiz_id,
                         class_name: "::Quiz::Question::Record"

    has_many :quiz_realizations, dependent: :destroy,
                                 inverse_of: :quiz,
                                 foreign_key: :quiz_id,
                                 class_name: "::Quiz::Realization::Record"

    has_many :quiz_realization_answers, dependent: :destroy,
                                        inverse_of: :quiz,
                                        foreign_key: :quiz_id,
                                        class_name: "::Quiz::RealizationAnswer::Record"

    validates :description, presence: true
  end
end
