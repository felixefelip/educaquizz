module QuizRealizations
  class SearchController < ApplicationController
    before_action :set_quiz_availability, only: :create

    def create
      @quiz_realization = current_user.quiz_realizations.create!(quiz_availability: @quiz_availability)

      redirect_to new_question_quiz_realization_quiz_realization_answer_url(
                    question_id: @quiz_realization.quiz.questions.first.id,
                    quiz_realization_id: @quiz_realization.id,
                  ), notice: "Quiz iniciado com sucesso."
    end

    private

    def set_quiz_availability
      @quiz_availability = current_user.quiz_availabilities.find(params[:quiz_availability_id])
    end
  end
end
