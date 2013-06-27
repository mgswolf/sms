class SchoolClass < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name

  validates :name, presence: true
  friendly_id :name, use: :slugged
end
