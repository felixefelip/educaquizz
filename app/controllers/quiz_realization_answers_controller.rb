class QuizRealizationAnswersController < ApplicationController
  before_action :set_question, only: %i[new create]
  before_action :set_quiz_realization, only: %i[new create]

  def new
    @quiz_realization_answer = @quiz_realization.quiz_realization_answers
      .find_or_initialize_by(question: @question)
  end

  def create
    @quiz_realization_answer =
      @quiz_realization.quiz_realization_answers.create!(answer: @answer, question: @question)

    next_question_id = calculate_next_question_id

    if next_question_id.nil?
      redirect_to root_path, notice: "Questão respondida com sucesso. Quiz finalizado!"
    else
      redirect_to new_question_quiz_realization_quiz_realization_answer_url(
        question_id: next_question_id,
        quiz_realization_id: @quiz_realization.id,
      ), notice: "Questão respondida com sucesso."
    end
  end

  def calculate_next_question_id
    @quiz_realization.quiz.questions[@quiz_realization.quiz_realization_answers.count]&.id
  end

  def set_quiz_realization
    @quiz_realization = current_user.quiz_realizations.find(params[:quiz_realization_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
