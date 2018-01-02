class Survey < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :options, through: :questions, class_name: :QuestionOption
  has_many :user_answers, through: :questions, class_name: :UserAnswer

  def generate_token(user)
    timestamp = DateTime.now.to_i
    "#{timestamp}#{self.id}#{user.id}".to_i
  end

  def times_taken
    user_answers.pluck(:submission_id).uniq.count
  end

end
