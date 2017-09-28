class WeightsController < ApplicationController
  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      flash[:success] = "Weight Updated."
      redirect_to user_path(current_user)
    else
      redirect_to new_weight_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def weight_params
    params.require(:weight).permit(:weight, :user_id)
  end
end
