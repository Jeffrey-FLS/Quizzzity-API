
# load 'shared_functions.rb'
require 'shared_functions'

class Api::V1::UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]

  include Shared

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users, status: 200
    console_msg("info", "All Users Indexed")
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
      render json: {success: "Welcome to Quizzzity, #{@user.username}"}, status: 200
      console_msg("success", "User was successfully created")
    else
      render json: {error: "Create User Failed"}, status: 304
      console_msg("error", @user.errors.full_messages[0])
    end
  end

  # GET /api/v1/users/:id
  def show
    if @user.valid?
      render json: @user, status: 200
      console_msg("success", "User of id #{@user.id} found")
    else
      render json: { failure: 'User not found' }, status: 404
      console_msg("error", @user.errors.full_messages[0])
    end
  end

  # GET /api/v1/users/:id/edit
  def edit
    render :edit
  end

  # PATCH/PUT /api/v1/users/:id
  def update
    if @user.update(user_params)
      msg = "User of id #{@user.id} updated"

      render json: {success: msg}, status: 200
      console_msg("success", msg)
    else
      render json: {error: "User Update Failed"}, status: 304
      console_msg("error", @user.errors.full_messages[0])
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    msg = "User of id #{@user.id} has been deleted"

    if @user.destroy
      render json: {success: msg}, status: 200
      console_msg("success", msg)
    else
      render json: {error: "User Delete Failed"}, status: 304
      console_msg("error", @user.errors.full_messages[0])
    end
  end

  # TESTING ####################################################################

  def login
    @user = User.find_by(username: params[:user][:username])

    console_msg("info", params[:user][:username])
    console_msg("info", params[:user][:password])
    console_msg("info", @user.attributes)
    # console_msg("info", @user.attributes[attribute].to_s)
    #
    #       console_msg("error", @user.errors.full_messages[0])


    # if @user && @user.authenticate(params[:user][:password])

    if @user && @user.password(params[:user][:password])
      # session[:user_id] = @user.id
      user = @user.to_s
      render json: { user: user } , status: 200

      console_msg("success", "User has successfully logged in")
      # redirect_to root_path
    else
      console_msg("error", "ERROR")
      console_msg("error", @user.errors.full_messages[0])
      # flash[:errors] = ["You failed to login!!! Loser."]
      # redirect_to login_path
    end
  end

  ##############################################################################

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :first_name, :last_name, :email, :username, :password )
  end

end
