class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :words
  has_many :favorites
  has_many :likes, through: :favorites, source: :word
  
  def like(word_id)
    self.favorites.find_or_create_by(word_id: word_id)
  end
  
  def unlike(word_id)
    favorite = self.favorites.find_by(word_id: word_id)
    favorite.destroy if favorite
  end
  
  def like?(other_word)
    self.likes.include?(other_word)
  end
end
