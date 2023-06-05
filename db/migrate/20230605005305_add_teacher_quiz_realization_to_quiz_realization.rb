class AddTeacherQuizRealizationToQuizRealization < ActiveRecord::Migration[7.0]
  def change
    add_reference :quiz_realizations, :teacher_quiz_realization, null: false, foreign_key: true
    remove_reference :quiz_realizations, :quiz
  end
end
