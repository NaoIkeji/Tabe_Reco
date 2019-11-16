class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meals, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cheers, dependent: :destroy

  # フォロー取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # フォロワー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 自分がフォローしている人
  has_many :following_user, through: :follower, source: :followed
  # has_many :following, through: :active_relationships,  source: :followed

  # 自分をフォローしている人
  has_many :follower_user, through: :followed, source: :follower
  # has_many :followers, through: :passive_relationships, source: :follower

  attachment :profile_image

  accepts_nested_attributes_for :targets, allow_destroy: true

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: :user_id)
  end
  # def followed_by?(user)
  #   passive_relationships.find_by(follower_id: user.id).present?
  # end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end

end
