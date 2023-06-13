class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]

  def index
    @questions = ::Quiz::Question.all
  end

  def show; end

  private

  def set_question
    @question = ::Quiz::Question.find(params[:id])
  end
end
