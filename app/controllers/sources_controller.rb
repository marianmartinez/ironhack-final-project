class SourcesController < ApplicationController
  before_action :set_source, only: [:search]
  before_action :set_tracks, only: [:search, :new, :create]

  def index

  end

  def create
    @goal = Goal.find params[:source][:goal_id]
    @source = @goal.sources.new entry_params

    if @source.save
      flash[:success] = "Source created successfully"
      redirect_to search_path
    else
      flash.now[:error] = "Error. Try again"
      render 'search'
    end

  end

  def search
    @query_word = params[:search]
    @resources = Search.query(params[:search])
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
