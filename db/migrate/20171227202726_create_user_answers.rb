class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.references :user, foreign_key: true, index: true
      t.references :question_option, foreign_key: true, index: true

      t.timestamps
    end

  end
end
