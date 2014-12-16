class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, presence: true
  validates :question_id, presence: true
  validates :user_id, presence: true

end
