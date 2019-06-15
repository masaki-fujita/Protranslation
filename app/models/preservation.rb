class Preservation < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :content_sentence, presence: true, length: { maximum: 255 }
  validates :content_signals, presence: true, length: { maximum: 255 }
end
