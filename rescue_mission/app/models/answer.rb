class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true, length: { minimum: 50, message: "must be at least 50 charcters long" }
  validates :question_id, presence: true
end
