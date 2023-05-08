class CreateQuizRealizationAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_realization_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :quiz_realization, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
