class QuestionOption < ApplicationRecord

  belongs_to :question, inverse_of: :question_options
  has_many :user_answers

end
