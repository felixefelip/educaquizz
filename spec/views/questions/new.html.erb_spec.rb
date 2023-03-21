require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      description: "MyString",
      difficulty: 1,
      quiz: nil
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[description]"

      assert_select "input[name=?]", "question[difficulty]"

      assert_select "input[name=?]", "question[quiz_id]"
    end
  end
end
