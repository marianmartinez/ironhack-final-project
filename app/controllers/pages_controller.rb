class PagesController < ApplicationController
  def home

  end

  def search
    if params[:search]
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
end
