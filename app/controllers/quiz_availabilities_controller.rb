class QuizAvailabilitiesController < ApplicationController
  before_action :set_quiz, only: %i[index create]
  before_action :set_quiz_availability, only: %i[show]

  def index
    @quiz_availabilities = current_user.quiz_availabilities.where(quiz: @quiz)
  end

  def show; end

  def create
    @quiz_availability = current_user.quiz_availabilities.create!(quiz: @quiz)

    redirect_to quiz_url(@quiz), notice: "Quiz iniciado com sucesso."
  end

  def set_quiz
    @quiz = ::Quiz::Record.find(params[:quiz_id])
  end

  def set_quiz_availability
    @quiz_availability = ::Quiz::Availability::Record.find(params[:id])
  end
end
