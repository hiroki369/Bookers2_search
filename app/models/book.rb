class Book < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: { maximum:200 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end


	def self.search(method,search)
		if method == "forward"
			@books = Book.where("title LIKE?","#{search}%")
		elsif method == "backward"
			@books = Book.where("title LIKE?","%#{search}")
		elsif method == "perfect"
			@books = Book.where("title LIKE?","#{search}")
		elsif method == "partial"
			@books = Book.where("title LIKE?","%#{search}%")
		else
			@books = Book.all
		end
	end
end
