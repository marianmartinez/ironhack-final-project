class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def show
		unless @track = Track.find_by(id: params[:id])
		  render 'track_not_found'    
		end
	end

  def new
      @track = Track.new
  end

  def create
      @track = Track.new entry_params
      if @track.save
        redirect_to tracks_path
      else
        render 'new'
      end
  end

  private
  def entry_params
      params.require(:track).permit(:name)
  end

end
