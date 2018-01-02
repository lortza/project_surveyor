class AddSubmissionIdToUserAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :user_answers, :submission_id, :bigint, limit: 12, null: false
  end
end
