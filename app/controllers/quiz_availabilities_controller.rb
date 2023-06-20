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

    @scores = @quiz_availability.quiz_realizations.map(&:score)
    @boa_nota = @scores.select { |score| score >= 7 }
    @nota_na_media = @scores.select { |score| score > 6 && score <= 7 }
    @nota_ruim = @scores.select { |score| score < 6 }

    @percentual_boa_nota = if @boa_nota.count.zero?
        0
      else
        (100 * @boa_nota.count) / @scores.count
      end

    @percentual_nota_na_media = if @nota_na_media.count.zero?
        0
      else
        (100 * @nota_na_media.count) / @scores.count
      end

    @percentual_nota_ruim = if @nota_ruim.count.zero?
        0
      else
        (100 * @nota_ruim.count) / @scores.count
      end
  end

  def create
    @quiz_availability = current_user.quiz_availabilities.create!(quiz: @quiz)

    redirect_to quiz_url(@quiz), notice: "Quiz iniciado com sucesso. Código: #{@quiz_availability.id}"
  end

  def set_quiz
    @quiz = ::Quiz::Record.find(params[:quiz_id])
  end

  def set_quiz_availability
    @quiz_availability = ::Quiz::Availability::Record.find(params[:id])
  end
end
