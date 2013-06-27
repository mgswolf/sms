class Student < ActiveRecord::Base
  extend FriendlyId
  belongs_to :school_class
  attr_accessible :name, :school_class_id

  validates :name, :school_class, presence: true
  validates :school_class, associated: true

  friendly_id :name, use: :slugged


  scope :recent, -> { order('id DESC').limit(5) }
end
