class Show < ActiveRecord::Base
  has_many :songs

  validates :title, :year, :composer, :img_url, presence: true
end