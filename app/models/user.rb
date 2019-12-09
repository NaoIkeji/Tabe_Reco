class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_ruby, presence: true
  validates :first_name_ruby, presence: true
  validates :nickname, presence: true
  validates :introduction, length: { maximum: 200 }

  attachment :profile_image

  accepts_nested_attributes_for :targets, allow_destroy: true


  has_many :meals, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cheers, dependent: :destroy


  # ----自分がフォローするユーザーとの関連 --------
  # 自分がフォローするユーザーとの関係(Relationship)を能動的関係(フォローしている：active_relationship)というモデルを擬似的に作る。← フォローする側の中間テーブルを再定義する
  # 自分がフォローするユーザーを中間テーブル(active_relationshipを介して)集める。
  # 自分は複数のフォローする関係をもてるのでhas_many。active_relationshipのFKはfollower_id(フォローする人のid)。foreign_key:オプションで参照先のテーブル(Relationship)の外部キーのカラム名を指定できる。
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 中間テーブル(active_relationships)を介して、followedモデルのユーザー(フォローされる人)を集める。→「following」と定義。sourceでモデルの参照元を指定。
  # 自分は複数のフォローされる人をフォローすることができるのでhas_many。
  has_many :following, through: :active_relationships, source: :followed
  # ---------------------------------------------


  # ----自分がフォローされるユーザーとの関連 -----------
  # 自分がフォローされるユーザーとの関係(Relationship)を受動的関係(フォローされている：passive_relationship)というモデルを擬似的に作る。← フォローされる側の中間テーブルを再定義する
  # 自分をフォローしてくるユーザーを中間テーブル(passive_relationship)を介して集める。
  # 自分は複数のユーザーからフォローされる関係をもてるのでhas_many。passive_relationshipのFKはfollowed_id(フォローされる人のid)。
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 中間テーブル(passive_relationship)を介して、followerモデルのユーザー（フォローしている人）を集める。→「followers」と定義。sourceでモデルの参照元を指定。
  # 自分は複数のフォローする人にフォローされることがあるのでhas_may。
  has_many :followers, through: :passive_relationships, source: :follower
  # ----------------------------------------------


  # 自分(user)がfollow済みかどうか判定したいため、followed_by?メソッドを用意
  # 自分がフォローしようとしているユーザーのフォローしている人の中に自分がいるかどうかを調べる。
  # 自分をフォローしているユーザーに自分(引数のuser)がいるかどうか。
  def followed_by?(user)
    passive_relationships.find_by(follower_id: user.id).present?
  end

  # Userがいいねしているかどうかを判定したいため、favorited_by?メソッドを用意
  def favorited_by?(user)
    # favoritesの中に引数で送られたuserのidがあるかどうか。
    favorites.where(user_id: user.id).exists?
  end

  # Userが応援しているかどうかを判定したいため、cheered_by?メソッドを用意
  def cheered_by?(user)
    # cheersの中に引数で送られたuserのidがあるかどうか。
    cheers.where(user_id: user.id).exists?
  end

end
