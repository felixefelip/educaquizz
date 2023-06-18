class QuizAvailabilitiesController < ApplicationController
  before_action :set_quiz, only: %i[index create]
  before_action :set_quiz_availability, only: %i[show]

  add_breadcrumb "Quizzes", "#"

  def index
    add_breadcrumb @quiz.description, quiz_path(@quiz)
    add_breadcrumb "Disponibilizados", "#"

    @quiz_availabilities = current_user.quiz_availabilities.where(quiz: @quiz)
  end

  def show
    add_breadcrumb @quiz_availability.quiz.description, quiz_path(@quiz_availability.quiz)
    add_breadcrumb "Disponibilizados", "#"
    add_breadcrumb "Exibir", "#"
  end

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
