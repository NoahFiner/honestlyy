class Question < ApplicationRecord
  validates :question, presence: true, length: {maximum: 80}
  validates :choice_a, presence: true, length: {maximum: 10}
  validates :choice_b, presence: true, length: {maximum: 10}
  validates :choice_c, presence: true, length: {maximum: 10}
  validates :choice_d, presence: true, length: {maximum: 10}
end
