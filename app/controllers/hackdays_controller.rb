class HackdaysController < ApplicationController

  def index
    @hackday = Hackday.new
    @hackdays = Hackday.all
  end

  def show
    @hackday = Hackday.find_by_id(params[:id].to_i)
    @project = @hackday.projects.build
  end

  def create
    @hackday = Hackday.create(:name => params[:hackday][:name])
    if @hackday.valid?
      redirect_to hackday_path(@hackday)
    else
      @hackdays = Hackday.all
      render 'index'
    end
  end

  def update
    @hackday = Hackday.find(params[:id])
    @hackday.close_for_voting
    @hackday.save
    redirect_to hackday_path(@hackday)
  end
end
