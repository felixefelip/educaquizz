module QuizRealizationsHelper
  def correct_answer_hit_tag(question, quiz_realization_answer, alternative_number)
    return unless quiz_realization_answer.correct? &&
      alternative_number == question.correct_answer

    "Acertou!"
  end

  def correct_answer_not_hit_tag(question, quiz_realization_answer, alternative_number)
    return unless quiz_realization_answer.wrong? &&
      alternative_number == question.correct_answer

    "Resposta correta"
  end

  def your_wrong_answer_tag(_question, quiz_realization_answer, alternative_number)
    return unless quiz_realization_answer.wrong? &&
      alternative_number == quiz_realization_answer.answer

    "Sua resposta"
  end
end
