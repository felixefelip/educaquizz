require 'rails_helper'

RSpec.describe Quiz do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "factory" do
    it "be valid" do
      quiz = create(:quiz)
      expect(quiz).to be_valid
    end
  end
end
