class GoalsController < ApplicationController
  before_action :set_track
  before_action :set_goals
  before_action :set_goal, only: %i(new create edit update destroy)

  def index
    @track = Track.find params[:track_id]
		@goals = @track.goals.order(goal_date: :desc)
  end

  def new
      @track = Track.find params[:track_id]
	    @goal = @track.goals.new
	end
	def create
      @track = Track.find params[:track_id]
	    @goal = @track.goals.new goal_params
	    if @goal.save
	    	flash[:notice] = "Goal created successfully"
	    	redirect_to track_goals_path(@track)
	    else
	    	flash.now[:alert] = "Error"
	    	render 'new'
	    end
	end

  private

  def set_track
    if params[:track_id] # support with or without
      @track = current_user.tracks.find(params[:track_id])
    end
  end

  def set_goals
    if @track
      @goals = @track.goals
    else
      @goals = current_user.goals
    end
  end

  def set_goal
    if params[:id] # show, edit, update, destroy
      @goal = @goals.find_by(id: params[:id])
    else # new, create
      @goal = params[:goal] ? @goals.build(goal_params) : @goals.build
    end
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :goal_date,
                                 :accomplished, :goal_id )
  end
end
