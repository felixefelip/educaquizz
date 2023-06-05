class TeacherQuizRealizationsController < ApplicationController
  before_action :set_quiz, only: :create

  # def show; end

  def create
    @teacher_quiz_realization = current_user.teacher_quiz_realizations.create!(quiz: @quiz)

    redirect_to quiz_url(@quiz), notice: "Quiz iniciado com sucesso."
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
end
