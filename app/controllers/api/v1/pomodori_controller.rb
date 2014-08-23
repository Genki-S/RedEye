class Api::V1::PomodoriController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    user = User.find_by(uid: params[:uid])
    pomodoro = Pomodoro.new(pomodoro_params)
    pomodoro.user = user

    if pomodoro.save
      render json: pomodoro, status: :ok
    else
      render json: pomodoro.errors, status: :unprocessable_entity
    end
  end

  private
    def pomodoro_params
      params.permit(:title, :started_at, :finished_at, :interrupted_at)
    end
end
