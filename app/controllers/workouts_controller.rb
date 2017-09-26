class WorkoutsController < ApplicationController
  before_action :authorize

  def show
    @workout = Workout.find(params[:id])
    @exercises = Exercise.where(workout_id: @workout.id)
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else 
      redirect_to new_workout_path
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      redirect_to edit_workout_path
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.destroy
      redirect_to root_path
    else
      redirect_to edit_workout_path(@workout)
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :user_id)
  end
end
