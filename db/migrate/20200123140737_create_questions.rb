class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string 'question', null: false
      t.string 'questionType', null: false
      t.string 'singleMultiple', null: false
      t.string 'correctAnswer', null: false
      t.string 'answerOne', null: false
      t.string 'answerTwo', null: false
      t.string 'answerThree', null: false
      t.timestamps
    end
  end
end

    #question: "",
    #questionType: "",
    #singleMultiple: "",
    #correctAnswer: "",
    #answerOne: "",
    #answerTwo: "",
    #answerThree: ""
