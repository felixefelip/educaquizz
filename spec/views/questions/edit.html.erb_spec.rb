require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  let(:question) {
    Question.create!(
      description: "MyString",
      difficulty: 1,
      quiz: nil
    )
  }

  before(:each) do
    assign(:question, question)
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(question), "post" do

      assert_select "input[name=?]", "question[description]"

      assert_select "input[name=?]", "question[difficulty]"

      assert_select "input[name=?]", "question[quiz_id]"
    end
  end
end
