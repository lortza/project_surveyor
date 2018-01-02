class QuestionOption < ApplicationRecord

  belongs_to :question, inverse_of: :question_options
  has_many :user_answers


  def response_counter
    user_answers.count
  end

end
