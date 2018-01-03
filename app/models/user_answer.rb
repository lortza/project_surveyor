class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question_option
  belongs_to :question

  delegate :multiple?, :required?, to: :question

  validates :question_option, presence: true, if: :required?
end
