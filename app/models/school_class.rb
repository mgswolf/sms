class SchoolClass < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name
  has_many :students

  validates :name, presence: true
  friendly_id :name, use: :slugged

  scope :recent, -> { order('id DESC').limit(5) }
end
