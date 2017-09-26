class ExercisesController < ApplicationController
  before_action :authorize
  
  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
    @results = Result.where(exercise_id: @exercise.id)
    @result = Result.new
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to workout_path(@exercise.workout_id)
    else
      redirect_to workout_path(@exercise.workout_id)
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      redirect_to edit_exercise_path
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    if @exercise.destroy
      redirect_to root_path
    else
      redirect_to edit_exercise_path
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :sets, :workout_id)
  end
end
