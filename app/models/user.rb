class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_many :post_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
attachment :profile_image


validates :name, presence: true
validates :name, length: { in: 2..20}
validates :introduction, length: { maximum: 50 }


has_many :relationships
has_many :followings, through: :relationships, source: :follow
has_many :followed, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :followed, source: :user

# もしも、評価が偽(false)であれば○○する
# other userは、自分では無い？、無いならfind or create by

def follow(other_user)
	unless self == other_user
		self.relationships.find_or_create_by(follow_id: other_user.id)
	end
end


def unfollow(other_user)
	relationship = self.relationships.find_by(follow_id: other_user.id)
	relationship.destroy if relationship

end

def following?(other_user)
	self.followings.include?(other_user)
end

  def self.search(method,search)
  	if method == "forward"
  		@users = User.where("name LIKE?","#{search}%")
  	elsif method == "backward"
  		@users = User.where("name LIKE?","%#{search}")
  	elsif method == "perfect"
  		@users = User.where("name LIKE?","#{search}")
  	elsif method == "partial"
  		@users = User.where("name LIKE?","%#{search}%")
  	else
  		@users = User.all
  	end

 end



end
