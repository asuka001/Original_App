class Word < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :word, presence: true, length: { maximum:50 }
  validates :mean, presence: true, length: { maximum:255 }
  validates :category, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :like_users, through: :favorites, source: :user
  
  def self.search(search)
    return Word.all unless search
    Word.where(["word LIKE ?", "%#{search}%"])
  end
  
end
