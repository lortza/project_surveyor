class Question < ApplicationRecord

  belongs_to :survey
  has_many :question_options, inverse_of: :question, dependent: :destroy
  has_many :options, class_name: :QuestionOption
  has_many :user_answers, through: :options, class_name: :UserAnswer

  accepts_nested_attributes_for :options,
                                :reject_if => :all_blank,
                                :allow_destroy => true

 # TO DO: make required fields required

 REQUIRED = {false => 'No', true => 'Yes'}

  def multiple?
    multiple_permitted
  end

  def required?
    required
  end

end
