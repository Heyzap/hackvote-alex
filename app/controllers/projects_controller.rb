class ProjectsController < ApplicationController
  MAX_VOTES = 3

  def create
    @hackday = Hackday.find(params[:hackday_id])
    @project = @hackday.projects.build(filter_params)
    if @project.save
      redirect_to hackday_path(@hackday)
    else
      @hackday.reload
      render 'hackdays/show'
    end
  end

  def update
    @project = Project.find(params[:id])
    @hackday = @project.hackday
    votes = session[:"votes_#{@hackday.id}"].to_i
    if votes < MAX_VOTES
      @project.vote
      @project.save
      session[:"votes_#{@hackday.id}"] = votes + 1
    end
    render 'hackdays/show'
  end

  private
    def filter_params
      return params.require(:project).permit(:name, :creators)
    end
end
