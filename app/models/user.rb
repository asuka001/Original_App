class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :words
  has_many :favorites
  has_many :likes, through: :favorites, source: :word
  
  def like(other_word)
    unless self.words.include?(other_word)
      self.favorites.find_or_create_by(word_id: other_word.id)
    end
  end
  
  def unlike(other_word)
    favorite = self.favorites.find_by(word_id: other_word.id)
    favorite.destroy if favorite
  end
  
  def like?(other_word)
    self.likes.include?(other_word)
  end
end
