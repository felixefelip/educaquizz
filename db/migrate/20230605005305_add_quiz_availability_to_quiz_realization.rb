class AddQuizAvailabilityToQuizRealization < ActiveRecord::Migration[7.0]
  def change
    remove_reference :quiz_realizations, :quiz
    add_reference :quiz_realizations, :quiz_availability, null: false, foreign_key: true
  end
end
