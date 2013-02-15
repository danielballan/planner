class LabelsController < ApplicationController

  def create
    Label.create(params[:label])
    redirect_to plans_url
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to plans_path
  end
end
