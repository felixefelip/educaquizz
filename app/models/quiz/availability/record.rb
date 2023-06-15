# == Schema Information
#
# Table name: quiz_availabilities
#
#  id          :bigint           not null, primary key
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :bigint           not null
#  user_id     :bigint           not null
#
module Quiz::Availability
  class Record < ApplicationRecord
    self.table_name = "quiz_availabilities"

    belongs_to :teacher, foreign_key: :user_id,
                         inverse_of: :quiz_availabilities,
                         class_name: "::User::Record"

    belongs_to :quiz, class_name: "::Quiz::Record"

    has_many :quiz_realizations, dependent: :destroy,
                                 inverse_of: :quiz_availabilities,
                                 foreign_key: :quiz_availabilities,
                                 class_name: "::Quiz::Availability::Record"
  end
end
