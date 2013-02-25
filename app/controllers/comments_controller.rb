class CommentsController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @comment = @plan.comments.create(params[:comment])
    respond_to do |format|
      format.html { redirect_to plan_path(@plan) }
      format.js
    end
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    @plan = Plan.find(params[:plan_id])
    respond_to do |format|
      format.html { redirect_to plan_path(@plan) }
      format.js
    end
  end

end
