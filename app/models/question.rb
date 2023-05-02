# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  alternative1 :string
#  alternative2 :string
#  alternative3 :string
#  alternative4 :string
#  description  :string
#  difficulty   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quiz_id      :bigint           not null
#
class Question < ApplicationRecord
  belongs_to :quiz
end
