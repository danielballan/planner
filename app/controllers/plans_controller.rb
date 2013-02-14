class PlansController < ApplicationController

  def new
    @plan = Plan.new
    @comment = Comment.new
  end

  def create
    plan = Plan.new(params[:plan])
    comment = Comment.new(params[:comment])
    plan.open = true
    plan.save
    comment.plan_id = plan.id
    comment.save
    redirect_to plans_url
  end

  def index
    @open_plans = Plan.find(:all, conditions: {'open' => true})
    @closed_plans = Plan.find(:all, conditions: {'open' => false})
  end

  def show
    @plan = Plan.find(params[:id])
    @comments = Comment.find_all_by_plan_id(@plan.id)
    @new_comment = Comment.new
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

  def reopen
    plan = Plan.find(params[:id])
    plan.open = true
    plan.save
    redirect_to plans_url(plan)
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_path
  end

end
