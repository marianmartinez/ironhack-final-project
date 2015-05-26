class SourcesController < ApplicationController
  before_action :set_source, only: [:search]
  before_action :set_tracks, only: [:search, :new, :create]

  def index

  end

  def create
    #raise params.inspect
    
    if @source.save
      flash[:notice] = "Source created successfully"
      redirect_to search_page_path
    else
      flash.now[:danger] = "Error. Try again"
      render 'search'
    end

  end

  def search
    if params[:search]
      @query_word = params[:search]
      @resources = GoogleBooks.search(
          "#{params[:search]}",
          {
           :count => 10, :page => 1,
           :api_key => 'AIzaSyCGZFL2tOiMcg3G5V4KC6ViLQcnrt29Jo4'
          }
        )
    else
      @resources = []
    end
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
