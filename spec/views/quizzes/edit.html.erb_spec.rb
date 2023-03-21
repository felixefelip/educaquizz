require 'rails_helper'

RSpec.describe "quizzes/edit", type: :view do
  let(:quiz) {
    Quiz.create!(
      description: "MyString"
    )
  }

  before(:each) do
    assign(:quiz, quiz)
  end

  it "renders the edit quiz form" do
    render

    assert_select "form[action=?][method=?]", quiz_path(quiz), "post" do

      assert_select "input[name=?]", "quiz[description]"
    end
  end
end
