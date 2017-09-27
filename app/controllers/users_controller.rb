class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @workouts = Workout.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:warning] = "Please complete all fields."
      redirect_to new_user_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:info] = "Account updated."
      redirect_to user_path
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @workouts = Workout.where(user_id: current_user.id)
    @workouts.each do |w|
      @exercises = Exercise.where(workout_id: w.id)
      @exercises.each do |e|
        @results = Result.where(exercise_id: e.id)
        @results.destroy_all
      end
      @exercises.destroy_all
    end
    @workouts.destroy_all
    if current_user.destroy
      session[:user_id] = nil
      flash[:danger] = "Account deleted."
      redirect_to new_session_path
    else
      flash[:danger] = "Delete failed."
      redirect_to edit_user_path
    end
  end
  
  private
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confrimation)
  end
end
