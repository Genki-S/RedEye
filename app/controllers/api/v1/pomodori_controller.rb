class Api::V1::PomodoriController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    user = User.where(uid: params[:uid]).first
    unless user
      render json: {}, status: 401
      return
    end

    date = Date.parse(params[:date]) if params[:date]
    date ||= Date.today

    render json: user.pomodori.started_on(date).to_json(include: :reflection)
  end

  def create
    user = User.find_by(uid: params[:uid])
    pomodoro = Pomodoro.new(pomodoro_params)
    pomodoro.user = user

    if params.has_key?(:reflection)
      reflection = Reflection.create(reflection_params)
      pomodoro.reflection = reflection
    end

    if params.has_key?(:interruption)
      interruption = Interruption.create(interruption_params)
      pomodoro.interruption = interruption
    end

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

    def reflection_params
      params.require(:reflection).permit(:evaluation)
    end

    def interruption_params
      params.require(:interruption).permit(:reason)
    end
end
