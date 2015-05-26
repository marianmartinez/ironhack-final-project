class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  # def new
  #     @track = Track.new
  # end
  # def create
  #     @track = Track.new entry_params
  #     if @track.save
  #       redirect_to tracks_path(@project)
  #     else
  #       render 'new'
  #     end
  # end
  #
  # private
  # def entry_params
  #     params.require(:track).permit(:name, :description)
  # end

end
