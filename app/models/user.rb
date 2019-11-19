class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :meals, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cheers, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  accepts_nested_attributes_for :targets, allow_destroy: true


  def followed_by?(user)
    passive_relationships.find_by(follower_id: user.id).present?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end

end
