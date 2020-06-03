
class Api::V1::QuestionsController < ApplicationController

  # Commenting to commit and update app api

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions
  end

end
