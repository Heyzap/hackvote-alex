class HackdaysController < ApplicationController

  def index
    @hackday = Hackday.new
    @hackdays = Hackday.all
  end

  def show
    @hackday = Hackday.find(params[:id])
    @project = @hackday.projects.build
  end

  def create
    @hackday = Hackday.new(:name => params[:hackday][:name])
    if @hackday.save
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
