class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[show]

  add_breadcrumb "Quizzes", "#"

  def index
    @quizzes = ::Quiz::Record.all
  end

  def show
    add_breadcrumb @quiz.description, quiz_path(@quiz)
  end

  private

  def set_quiz
    @quiz = ::Quiz::Record.find(params[:id])
  end
end
