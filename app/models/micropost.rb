class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :houseprice, presence: true, numericality: { only_integer: true }
  validates :ptitle, presence: true
end