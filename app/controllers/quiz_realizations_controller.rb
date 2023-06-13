class QuizRealizationsController < ApplicationController
  before_action :set_quiz_realization, only: :show
  before_action :set_teacher_quiz_realization, only: :create

  def show; end

  def create
    @quiz_realization = current_user.quiz_realizations.create!(teacher_quiz_realization: @teacher_quiz_realization)

    redirect_to new_question_quiz_realization_quiz_realization_answer_url(
                  question_id: @quiz_realization.quiz.questions.first.id,
                  quiz_realization_id: @quiz_realization.id,
                ), notice: "Quiz iniciado com sucesso."
  end

  def set_quiz_realization
    @quiz_realization = current_user.quiz_realizations.find(params[:id])
  end

  def set_teacher_quiz_realization
    @teacher_quiz_realization = ::Quiz::TeacherQuizRealization::Record.find(params[:teacher_quiz_realization_id])
  end
end
