class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true
  validates :houseprice, presence: true, numericality: { only_integer: true }
  validates :ptitle, presence: true, length: { maximum: 140 }
  validates :psqft, presence: true, numericality: { only_integer: true }
  validates :pbed, presence: true, numericality: { only_integer: true }
  validates :pbath, presence: true, numericality: { only_integer: true }
  validates :pzip, presence: true, numericality: { only_integer: true }
  validates :paddress, presence: true
  validates :pcity, presence: true
  validates :pstate, presence: true
end