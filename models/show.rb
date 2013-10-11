class Show < ActiveRecord::Base
  has_many :songs

  validates :title, :year, :composer, :img_url, presence: true
  validates :title, :img_url, uniqueness: true
end