class ResultsController < ApplicationController
  before_action :authorize

  def show
    @result = Result.find(params[:id])
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to exercise_path(@result.exercise_id)
    else
      flash[:warning] = "Failed to Add."
      redirect_to exercise_path(@result.exercise_id)
    end
  end

  def destroy
    @result = Result.find(params[:id])
    if @result.destroy
      redirect_to root_path
    else 
      redirect_to result_path(@result)
    end
  end

  private 
  def result_params
    params.require(:result).permit(:sets, :reps, :weight, :exercise_id)
  end
end
