class WorkoutsController < ApplicationController
  before_action :authorize

  def show
    @workout = Workout.find(params[:id])
    @exercise = Exercise.new
    @exercises = Exercise.where(workout_id: @workout.id)
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:success] = "Workout Created"
      redirect_to user_path(current_user)
    else
      flash[:warning] = "Please complete all fields." 
      redirect_to user_path(current_user)
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    @exercises = Exercise.where(workout_id: @workout.id)
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
    @exercises = Exercise.where(workout_id: @workout.id)
    @exercises.each do |e|
      @results = Result.where(exercise_id: e.id)
      @results.destroy_all
    end
    @exercises.destroy_all
    if @workout.destroy
      flash[:warning] = "Workout Deleted."
      redirect_to user_path(current_user)
    else
      redirect_to workout_path(@workout)
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :user_id)
  end
end
