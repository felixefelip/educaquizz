module QuizRealizationAnswers
  class RespondQuestionController < ApplicationController
    before_action :set_question, only: :create
    before_action :set_quiz_realization, only: :create

    def create
      ::QuizRealization::RespondQuestion
        .call(answer: params[:answer], question: @question, quiz_realization: @quiz_realization)
        .on_success(:last_question_answered) { redirect_last_question_answered }
        .on_success(:there_are_more_questions) { redirect_there_are_more_questions }
    end

    private

    def redirect_last_question_answered
      redirect_to quiz_realization_url(id: @quiz_realization),
                  notice: "Questão respondida com sucesso. Quiz finalizado!"
    end

    def redirect_there_are_more_questions
      redirect_to new_question_quiz_realization_quiz_realization_answer_url(
        question_id: @quiz_realization.next_question.id,
        quiz_realization_id: @quiz_realization.id,
      ), notice: "Questão respondida com sucesso."
    end

    def set_quiz_realization
      @quiz_realization = current_user.quiz_realizations.find(params[:quiz_realization_id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end
  end
end
