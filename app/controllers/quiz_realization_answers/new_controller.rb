module QuizRealizationAnswers
  class NewController < ApplicationController
    before_action :set_question, only: :new
    before_action :set_quiz_realization, only: :new

    def new
      @quiz_realization_answer = @quiz_realization.quiz_realization_answers
        .find_or_initialize_by(question: @question)
    end

    private

    def set_quiz_realization
      @quiz_realization = current_user.quiz_realizations.find(params[:quiz_realization_id])
    end

    def set_question
      @question = ::Quiz::Question::Record.find(params[:question_id])
    end
  end
end
