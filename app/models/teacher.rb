class Teacher < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :school_class_ids
  has_and_belongs_to_many :school_classes
  has_many :students, through: :school_classes
  has_many :evaluations

  validates :name, presence: true
  friendly_id :name, use: :slugged

  scope :recent, -> { order('id DESC').limit(5) }
end
