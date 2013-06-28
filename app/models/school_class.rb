class SchoolClass < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :students_attributes
  has_many :students, :inverse_of => :school_class
  has_and_belongs_to_many :teachers

  validates :name, presence: true
  friendly_id :name, use: :slugged

  accepts_nested_attributes_for :students, reject_if: :all_blank, allow_destroy: true

  scope :recent, -> { order('id DESC').limit(5) }
end
