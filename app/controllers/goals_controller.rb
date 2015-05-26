class GoalsController < ApplicationController
  before_action :set_track
  def index

  end

  private

  def set_track
    @track = current_user.tracks.find(params[:track_id])
  end
end
