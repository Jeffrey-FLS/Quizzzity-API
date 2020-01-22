
class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|

      t.string 'title', null: false
      t.string 'img', default: '', null: false
      t.integer 'duration', default: 0, null: false
      t.string 'difficulty', default: 'beginner', null: false
      t.integer 'num_of_questions', default: 0, null: false
      t.integer 'quizzed', default: 0, null: false
      t.boolean 'collaborative', default: true, null: false
      t.boolean 'personal', default: false, null: false
      t.belongs_to :user, foreign_key: true
      t.index ['title'], name: 'index_quizzes_on_title', using: :btree

      t.timestamps
    end
  end
end
