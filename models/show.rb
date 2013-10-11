class Show < ActiveRecord::Base
  has_many :songs

  validates :attr, presence: true
end