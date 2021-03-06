class PlansController < ApplicationController
  respond_to :html, :json, :js

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params[:plan])
    @plan.open = true
    @plan.save
    if not params[:comment][:prose].blank?
      comment = @plan.comments.build(params[:comment])
      comment.save
    end
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end

  def index
    @plans = Plan.search(params[:search])
    @active_labels = []
    if params[:labels]
      @active_labels = params[:labels]
      @plans = @plans.labeled(@active_labels)
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
    @plan = Plan.find(params[:id])
    @plan.update_attributes(params[:plan])
    respond_with @plan

    if not params.has_key?(:new_comment)
      new_comment = Comment.new(params[:new_comment])
    end
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
