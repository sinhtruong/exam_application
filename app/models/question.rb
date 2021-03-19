class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true


  validates :title, :description, presence: true
  validates_presence_of :answers
  validate :ensure_answers_has_correct

  def ensure_answers_has_correct
    answers.each do |answer|
      return if answer.correct
    end
    errors.add(:answers, 'Least one Option must be marked as the correct answer')
  end
end
