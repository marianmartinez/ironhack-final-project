class TracksController < ApplicationController
  before_action :set_track, only: %i(edit update destroy)

  def index
    @tracks = current_user.tracks.all
  end

  def new
    @track = current_user.tracks.build
  end

  def create
    @track = current_user.tracks.build(entry_params)
    if @track.save
      redirect_to tracks_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @track.update_attributes(entry_params)
    	flash[:success] = "Track updated successfully"
    	redirect_to tracks_path
    else
    	flash.now[:alert] = "Error"
      render 'edit'
    end
  end

  def destroy
    @track.destroy
    redirect_to tracks_path
  end

  private

  def set_track
    if params[:id]
      @track = current_user.tracks.find_by(id: params[:id])
    end
  end

  def entry_params
      params.require(:track).permit(:name)
  end

end
