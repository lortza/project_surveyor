class Question < ApplicationRecord

  belongs_to :survey
  has_many :question_options
  has_many :options, class_name: :QuestionOption



 MULTI_PERMITTED = {false => 'Just One', true => 'Multiple'}

 REQUIRED = {false => 'Just One', true => 'Multiple'}


end
