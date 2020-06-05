
class Api::V1::UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users, status: 200
  end

  # GET /api/v1/users/new
  def new
    @user = User.new
    render :new
  end

  # POST /api/v1/users
  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  # GET /api/v1/users/:id
  def show
    if @user.valid?
      render json: @user, status: 200
    else
      render json: { failure: 'User not found' }
    end
  end

  # GET /api/v1/users/:id/edit
  def edit
    render :edit
  end

  # PATCH/PUT /api/v1/users/:id
  def update
    if @user.update(user_params)
      flash[:notifications] = ["UPDATED"]
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user.destroy
    flash[:notifications] = ["User deleted successfully"]
    redirect_to users_path
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end

end
