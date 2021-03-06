class SourcesController < ApplicationController
  before_action :set_source, only: [:search]
  before_action :set_tracks, only: [:search, :new, :create]

  def index
    @sources = Source.all.order(created_at: :desc)
  end

  def create
    #raise params.inspect
    @goal = Goal.find params[:source][:goal_id]
    @source = @goal.sources.new entry_params

    if @source.save
      flash[:success] = "Source created successfully"
      respond_to do |format|
        format.html { redirect_to search_path }
        format.js { render json: current_user.sources.count }
      end
    else
      flash.now[:error] = "Error. Try again"
      respond_to do |format|
        format.html { render 'search' }
        format.js { render :unprocesable_entity }
      end
    end

  end

  def search
    #raise params.inspect
    @query_word = params[:search]
    #raise @query_word.inspect
    @sources = Search.query(params[:search])
  end

  def destroy
      @source = Source.find params[:id]
      @source.destroy
      redirect_to sources_path
  end

  private

  def set_source
    @source = Source.new
  end

  def set_tracks
    @tracks = current_user.tracks.all.includes(:goals)
  end

  def entry_params
      params.require(:source).permit(:name, :url, :image, :kind)
  end
end
