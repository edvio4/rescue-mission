class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: true, length: { minimum: 40, message: "must be at least 40 charcters long" }
  validates :description, presence: true, length: { minimum: 150, message: "must be at least 150 charcters long" }
end
