class VisitorsController < ApplicationController
  def index
    redirect_to pomodori_path if current_user
  end
end
