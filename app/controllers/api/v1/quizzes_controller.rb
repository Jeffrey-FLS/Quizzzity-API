
class Api::V1::QuizzesController < ApplicationController

  # GET /quizzes
  def index
    @quizzes = Quiz.all
    render json: @quizzes
  end

end
