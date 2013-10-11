class Song < ActiveRecord::Base
  belongs_to :show

  validates :embed_id, presence: true
end