# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  alternative1   :string
#  alternative2   :string
#  alternative3   :string
#  alternative4   :string
#  correct_answer :integer          not null
#  description    :string
#  difficulty     :integer
#  image          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quiz_id        :bigint           not null
#
module Quiz::Question
  class Record < ApplicationRecord
    self.table_name = "questions"

    belongs_to :quiz, class_name: "::Quiz::Record"

    has_many :quiz_realization_answers, dependent: :destroy,
                                        foreign_key: :question_id,
                                        inverse_of: :question,
                                        class_name: "::Quiz::RealizationAnswer::Record"

    validates :description, presence: true
    validates :difficulty, numericality: { greater_than_or_equal_to: 1,
                                           less_than_or_equal_to: 3 }

    validates :correct_answer, numericality: { greater_than_or_equal_to: 1,
                                               less_than_or_equal_to: 4 }
  end
end
