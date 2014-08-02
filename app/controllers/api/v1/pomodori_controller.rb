class Api::V1::PomodoriController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @pomodoro = Pomodoro.new(pomodoro_params)

    if @pomodoro.save
      render json: @pomodoro, status: :ok
    else
      render json: @pomodoro.errors, status: :unprocessable_entity
    end
  end

  private
    def pomodoro_params
      params.require(:pomodoro).permit(:title, :started_at, :finished_at, :interrupted_at, :user_id)
    end
end
