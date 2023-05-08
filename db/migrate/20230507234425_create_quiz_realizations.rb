class CreateQuizRealizations < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_realizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.timestamp :finished_at

      t.timestamps
    end
  end
end
