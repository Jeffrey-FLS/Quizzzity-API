
require 'shared_functions'

class Api::V1::AuthController < ApplicationController

  include Shared

  # def login
  #   user = User.find_by(username: params[:username])
  #
  #   # if user && user.authenticate(params[:password])
  #   if user && user.password(params[:password])
  #     # token = encode_token(user.id)
  #     # render json: {user: user, token: token}
  #     render json: {user: user}
  #   else
  #     render json: {errors: "Username or password incorrect."}
  #   end
  # end




  def login
    @user = User.find_by(username: params[:user][:username])

    # console_msg("info", @user.attributes[attribute].to_s)


    # if @user && @user.authenticate(params[:user][:password])

    if @user && @user.password(params[:user][:password])
      # session[:user_id] = @user.id
      render json: {
          status: :created,
          logged_im: true,
          user: @user
      }

      console_msg("success", "User was successfully created")
      # redirect_to root_path
    else
      console_msg("error", @user.errors.full_messages[0])
      # flash[:errors] = ["You failed to login!!! Loser."]
      # redirect_to login_path
    end
  end



end
