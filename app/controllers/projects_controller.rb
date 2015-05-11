class ProjectsController < ApplicationController
  @@MAX_VOTES = 3

  def create
    @hackday = Hackday.find(params[:hackday_id])
    @project = @hackday.projects.build(filter_params)
    if @project.save
      redirect_to hackday_path(@hackday)
    else
      @hackday.projects.delete(@project)  # unassociate so it doesn't show in the list?
      render 'hackdays/show'
    end
  end

  def update
    @project = Project.find(params[:id])
    @hackday = @project.hackday
    votes = cookies[:"votes_#{@hackday.id}"].to_i || 0
    if votes < @@MAX_VOTES
      @project.vote
      @project.save
      cookies[:"votes_#{@hackday.id}"] = votes + 1
    end
    render 'hackdays/show'
  end

  private
    def filter_params
      return params.require(:project).permit(:name, :creators)
    end
end
