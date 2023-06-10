require "rails_helper"

RSpec.describe QuizRealization::RespondQuestion do
  describe "#call", :aggregate_failures do
    context "when there are more questions to respond" do
      it "retuns type there_are_more_questions" do
        quiz = create(:quiz)
        question1 = create(:question, quiz:)
        _question2 = create(:question, quiz:)
        teacher_quiz_realization = create(:teacher_quiz_realization, quiz:)
        quiz_realization = create(:quiz_realization, teacher_quiz_realization:)

        result = nil
        expect { result = described_class.call(answer: 2, question: question1, quiz_realization:) }
          .to change(QuizRealizationAnswer, :count).by(1)

        expect(result).to be_success
        expect(result.type).to eq(:there_are_more_questions)
      end
    end

    context "when is the last question answered" do
      it "retuns type there_are_more_questions" do
        quiz = create(:quiz)
        question1 = create(:question, quiz:)
        question2 = create(:question, quiz:)
        teacher_quiz_realization = create(:teacher_quiz_realization, quiz:)
        quiz_realization = create(:quiz_realization, teacher_quiz_realization:)

        result1 = described_class.call(answer: 2, question: question1, quiz_realization:)
        expect(result1).to be_success
        expect(result1.type).to eq(:there_are_more_questions)

        result2 = nil
        expect { result2 = described_class.call(answer: 2, question: question2, quiz_realization:) }
          .to change(QuizRealizationAnswer, :count).by(1)

        expect(result2).to be_success
        expect(result2.type).to eq(:last_question_answered)
      end
    end
  end
end
