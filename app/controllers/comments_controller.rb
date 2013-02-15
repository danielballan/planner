class CommentsController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @comment = @plan.comments.create(params[:comment])
    redirect_to plan_path(@plan)
  end

end
