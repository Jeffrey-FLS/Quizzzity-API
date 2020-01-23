
class Api::V1::QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions
  end

end
