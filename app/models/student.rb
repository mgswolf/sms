class Student < ActiveRecord::Base
  extend FriendlyId
  belongs_to :school_class
  has_many :teachers, through: :school_class
  attr_accessible :name, :school_class_id

  validates :name, :school_class, presence: true
  validates :school_class, associated: true

  friendly_id :name, use: :slugged

  scope :recent, -> { order('id DESC').limit(5) }

  def name_n_school_class
    "#{name} - #{school_class.name}"
  end
end
