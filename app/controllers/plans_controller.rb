class PlansController < ApplicationController

  def new
    @plan = Plan.new
    @comment = Comment.new
  end

  def create
    plan = Plan.new(params[:plan])
    comment = Comment.new(params[:comment])
    comment.plan_id = plan.id
    plan.open = true
    plan.save
    comment.save
    redirect_to plans_url
  end

  def index
    @plans = Plan.find(:all)
  end

  def show
    @plan = Plan.find(params[:id])
    @comments = Comment.find_all_by_plan_id(@plan.id)
  end

  def update
    plan = Plan.find(params[:id])
    plan.update_attributes(params[:plan])
  end

  def close
    plan = Plan.find(params[:id])
    plan.open = false
    plan.save 
    redirect_to plans_url
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_path
  end

end
