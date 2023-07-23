class Book < ApplicationRecord
  #リレーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #バリデーション
  validates :title, presence: true
  validates :body, presence:true, length: { maximum: 200 }

  #いいね機能(current_userが投稿に対していいねしているか判断)
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{word}%")
    elsif search == "backward_math"
      @book = Book.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{word}%")
    else
      @book = Book.all
    end
  end

end
