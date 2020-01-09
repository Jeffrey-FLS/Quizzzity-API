
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string 'first_name', limit: 35, null: false
      t.string 'last_name', limit: 35, null: false
      t.string 'email', limit: 100, default: '', null: false
      t.string 'username', limit: 25, null: false
      t.string 'password', null: false
      # t.string 'password_digest', null: false
      t.index ['username'], name: 'index_users_on_username', using: :btree

      t.timestamps
    end
  end
end
