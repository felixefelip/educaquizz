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
class Question < ApplicationRecord
  belongs_to :quiz
end
