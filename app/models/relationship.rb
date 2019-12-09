class Relationship < ApplicationRecord
	# class_nameオプション → 関連するモデルクラス名を指定。関連名と参照先のクラス名を分けたい場合に使う
	# Followerモデル、Followedモデルを擬似的に作り出す
	# 「belongs_to 変更したい親モデル名, class_name: "元々の親モデル名"(文字列)」
	# Relationshipsテーブルのforeign_keyとしてfollower_id、followed_idと名前をつけている
	# モデル名もFollower, Followedとすれば帳尻が合う
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	# follower_idはフォローする人のid、followed_idはフォローされる人のid
	validates :follower_id, presence:true
	validates :followed_id, presence:true

end
