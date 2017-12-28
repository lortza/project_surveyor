class Question < ApplicationRecord

  belongs_to :survey
  has_many :question_options, inverse_of: :question
  has_many :options, class_name: :QuestionOption

  accepts_nested_attributes_for :options,
                                :reject_if => :all_blank,
                                :allow_destroy => true


 # MULTI_PERMITTED = {false => 'Just One', true => 'Multiple'}

 REQUIRED = {false => 'No', true => 'Yes'}

  def multiple?
    multiple_permitted
  end

  def required?
    required
  end


end
