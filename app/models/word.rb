class Word < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :word, presence: true, length: { maximum:50 }
  validates :mean, presence: true, length: { maximum:255 }
  
end
