class Test < ApplicationRecord
  has_many :questions, inverse_of: :test, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, presence: true
  validates_presence_of :questions

  def cal_score
    10
  end
end
