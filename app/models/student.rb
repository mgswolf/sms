class Student < ActiveRecord::Base
  extend FriendlyId
  belongs_to :school_class
  has_many :teachers, through: :school_class
  has_many :evaluations
  attr_accessible :name, :school_class_id

  validates :name, :school_class, presence: true
  validates :school_class, associated: true

  friendly_id :name, use: :slugged

  scope :recent, -> { order('id DESC').limit(5) }

  def name_n_school_class
    "#{name} - #{school_class.name}"
  end

  def average_grade
    sum_grades / self.evaluations.size
  rescue
    0
  end

  def sum_grades
    self.evaluations.to_a.sum { |e| e.grade }
  rescue
    0
  end

  def approval_status
    if self.evaluations.size < 4
      {status: 'pending', msg: I18n.t("student.pending_avaliations")}
    elsif self.average_grade < 6
      {status: 'not-approved', msg: I18n.t("student.not_approved")}
    elsif self.average_grade >= 6
      {status: 'approved', msg: I18n.t("student.approved")}
    else
      raise "unknow error on evaluations"
    end
  end
end
