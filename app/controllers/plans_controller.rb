class PlansController < ApplicationController

  def new
    @plan = Plan.new
    @comment = Comment.new
  end

  def create
    @plan = Plan.new(params[:plan])
    @plan.open = true
    @plan.save
    if not params[:comment] || params[:comment][:prose].blank?
      comment = Comment.new(params[:comment])
      comment.plan_id = @plan.id
      comment.save
    end
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end

  def index
    if params[:label]
      @plans = Plan.labeled(params[:label]).search(params[:search])
      @active_label = params[:label]
    else
      @plans = Plan.search(params[:search])
    end
    @open_plans = @plans.where(:open => true).order('created_at DESC')
    @closed_plans = @plans.where(:open => false).order('closing_time DESC')
    @labels = Label.scoped
    @new_label = Label.new
    @plan = Plan.new # new plan
  end

  def show
    @plan = Plan.find(params[:id])
    @new_comment = Comment.new
    @labels = Label.scoped
  end

  def update
    plan = Plan.find(params[:id])
    plan.update_attributes(params[:plan])

    if not params.has_key?(:new_comment)
      new_comment = Comment.new(params[:new_comment])
#      new_comment.plan_id = plan.id
#      new_comment.save
    end
    redirect_to plans_path
  end

  def close
    @plan = Plan.find(params[:id])
    @plan.open = false
    @plan.closing_time = Time.now
    @plan.save 
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end

  def reopen
    plan = Plan.find(params[:id])
    plan.open = true
    plan.save
    redirect_to plans_url(plan)
  end

  def destroy
    @plan = Plan.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end

end
