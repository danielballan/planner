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

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:id])
    respond_to do |format|
      format.js { @comment }
    end
  end

end
