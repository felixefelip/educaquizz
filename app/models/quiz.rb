# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :quiz_realizations, dependent: :destroy
  has_many :quiz_realization_answers, dependent: :destroy

  validates :description, presence: true
end
