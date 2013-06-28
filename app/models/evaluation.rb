class Evaluation < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
  attr_accessible :evaluation_date, :grade, :title, :student_id

  validates :teacher, :student_id, presence: true
  validates :grade, :numericality => {:greater_than_or_equal_to => 0.0,
                                      :less_than_or_equal_to => 10.0}
  validate :evaluations_limit, on: :create

  def evaluations_limit
    student = self.student
    if student
      return if student.evaluations.blank?
      errors.add(:base, :evaluations_limit) if student.evaluations.length >= 4
    end
  end
end
