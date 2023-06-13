class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[show]

  def index
    @quizzes = ::Quiz::Record.all
  end

  def show; end

  private

  def set_quiz
    @quiz = ::Quiz::Record.find(params[:id])
  end
end
