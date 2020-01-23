
class Api::V1::QuizzesController < ApplicationController

  # GET /quizzes
  def index
    @quizzes = Quiz.all
    render json: @quizzes
  end


  #def review
  #  review = Review.create({
  #                             content: params[:content],
  #                             user: session_user,
  #                             movie_id: params[:id].to_i,
  #                             stars: params[:stars]
  #                         })
  #
  #  if review.save
  #    render json: review, status: :ok
  #  else
  #    render json: {errors: review.errors.full_messages[0]}
  #  end
  #end

  def create
    #quiz = Quiz.new(
    #    title: params[:]
    #)
    #

    render json:params
  end


  #def create
  #  user = User.new(
  #      username: params[:username],
  #      password: params[:password],
  #      )
  #
  #  if user.save
  #    token = encode_token(user.id)
  #    render json: {user: user, token: token}
  #  else
  #    render json: {errors: user.errors.full_messages}
  #  end
  #end


end
