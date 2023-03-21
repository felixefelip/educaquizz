require 'rails_helper'

RSpec.describe "quizzes/index", type: :view do
  before(:each) do
    assign(:quizzes, [
      Quiz.create!(
        description: "Description"
      ),
      Quiz.create!(
        description: "Description"
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
