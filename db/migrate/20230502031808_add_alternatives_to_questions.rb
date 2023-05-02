class AddAlternativesToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :alternative1, :string
    add_column :questions, :alternative2, :string
    add_column :questions, :alternative3, :string
    add_column :questions, :alternative4, :string
  end
end
