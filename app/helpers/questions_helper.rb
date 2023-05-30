module QuestionsHelper
  def link_to_respond_question(text:, quiz_realization_answer:, answer:)
    link_to(text, question_quiz_realization_quiz_realization_answers_url(
              answer:,
              question_id: quiz_realization_answer.question.id,
              quiz_realization_id: quiz_realization_answer.quiz_realization_id,
            ),
            method: :post,
            data: { confirm: "Tem certeza?", "turbo-method": :post })
  end
end
