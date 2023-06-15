module QuizAvailabilities
  class FinishController < ApplicationController
    before_action :set_quiz_availability, only: :create

    def create
      @quiz_availability.update!(finished_at: Time.zone.now)

      redirect_to quiz_path(
        id: @quiz_availability.quiz_id,
      ), notice: "Avaliação finalizada com sucesso."
    end

    private

    def set_quiz_availability
      @quiz_availability = current_user.quiz_availabilities.find(params[:quiz_availability_id])
    end
  end
end
