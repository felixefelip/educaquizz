require 'rails_helper'

RSpec.describe "quizzes/show", type: :view do
  before(:each) do
    assign(:quiz, Quiz.create!(
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
