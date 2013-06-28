class Teacher < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name

  validates :name, presence: true
  friendly_id :name, use: :slugged

  scope :recent, -> { order('id DESC').limit(5) }
end
