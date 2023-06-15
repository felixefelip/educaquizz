class QuizAvailabilitiesController < ApplicationController
  before_action :set_quiz, only: %i[index create]

  def index
    @quiz_availabilities = current_user.quiz_availabilities.where(quiz: @quiz)
  end

  def create
    @quiz_availability = current_user.quiz_availabilities.create!(quiz: @quiz)

    redirect_to quiz_url(@quiz), notice: "Quiz iniciado com sucesso."
  end

  def set_quiz
    @quiz = ::Quiz::Record.find(params[:quiz_id])
  end
end
