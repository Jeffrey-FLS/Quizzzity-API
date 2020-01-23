
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

    quiz = Quiz.create(
        title: params[:quiz][:title],
        img: params[:quiz][:img],
        duration: params[:quiz][:duration],
        difficulty: params[:quiz][:difficulty],
        num_of_questions: params[:quiz][:num_of_questions],
        quizzed: params[:quiz][:quizzed],
        collaborative: params[:quiz][:collaborative],
        personal: params[:quiz][:personal],
        user: User.all.sample
    )

    if quiz.save
      render json: quiz, status: :ok
    else
      render json: {errors: quiz.errors.full_messages[0]}
    end

    #puts "TITLE IS" + params[:quiz][:title]
    #puts params[:questions]

    #render json:params
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
