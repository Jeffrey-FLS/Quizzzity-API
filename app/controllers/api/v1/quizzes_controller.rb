
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
      params[:questions].map do |question|
          Question.create(
              question: question[:question],
              questionType: question[:questionType],
              singleMultiple: question[:singleMultiple],
              correctAnswer: question[:correctAnswer],
              answerOne: question[:answerOne],
              answerTwo: question[:answerTwo],
              answerThree: question[:answerThree],
              quiz: quiz
          )

          #t.string 'question', null: false
          #t.string 'questionType', null: false
          #t.string 'singleMultiple', null: false
          #t.string 'correctAnswer', null: false
          #t.string 'answerOne', null: false
          #t.string 'answerTwo', null: false
          #t.string 'answerThree', null: false
          #t.belongs_to :quiz, foreign_key: true
              #question_type: question[:questionType],
              #question: question[:question],
              #answer: question[:answer],
              #choices: question[:choices],
              #point_value: question[:points],
              #assignment: assignment
          end

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
