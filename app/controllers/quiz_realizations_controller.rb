class QuizRealizationsController < ApplicationController
  before_action :set_quiz, only: :create

  def create
    @quiz_realization = current_user.quiz_realizations.create!(quiz: @quiz)

    redirect_to new_question_quiz_realization_quiz_realization_answer_url(
                  question_id: @quiz.questions.first.id,
                  quiz_realization_id: @quiz_realization.id,
                ), notice: "Quiz iniciado com sucesso."
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
end
