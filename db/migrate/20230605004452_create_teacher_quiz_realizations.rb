class CreateTeacherQuizRealizations < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_quiz_realizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
