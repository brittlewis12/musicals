class Song < ActiveRecord::Base
  belongs_to :show

  validates :attr, presence: true
end