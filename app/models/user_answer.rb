class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question_option
end
