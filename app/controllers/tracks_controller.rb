class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new entry_params
    @track.user = current_user
    if @track.save
      redirect_to tracks_path
    else
      render 'new'
    end
  end

  def edit
		@track = Track.find params[:id]
  end

  def update
    @track = Track.find params[:id]
      if @track.update_attributes(entry_params)
      	flash[:notice] = "Track updated successfully"
      	redirect_to tracks_path
      else
      	flash.now[:alert] = "Error"
        render 'edit'
      end
  end

  def destroy
      @track = Track.find_by(id: params[:id])
      @track.destroy
      redirect_to tracks_path
  end

  private

  def entry_params
      params.require(:track).permit(:name)
  end

end
