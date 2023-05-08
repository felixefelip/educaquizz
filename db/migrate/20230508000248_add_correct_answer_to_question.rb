class AddCorrectAnswerToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :correct_answer, :integer, null: false
  end
end
