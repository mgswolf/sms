class Student < ActiveRecord::Base
  belongs_to :school_class
  attr_accessible :name, :school_class_id

  validates :name, :school_class_id, presence: true
  validates :school_class, associated: true

  scope :recent, -> { order('id DESC').limit(5) }
end
