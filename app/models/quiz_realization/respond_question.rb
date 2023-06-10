module QuizRealization
  class RespondQuestion < Micro::Case
    attributes :answer, :question, :quiz_realization, :quiz_realization_answer

    def call!
      quiz_realization_answer = quiz_realization.quiz_realization_answers.create!(answer:, question:)

      success_type = quiz_realization.next_question.nil? ? :last_question_answered : :there_are_more_questions

      Success success_type, result: { quiz_realization_answer: }
    end
  end
end
