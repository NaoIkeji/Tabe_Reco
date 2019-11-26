require 'rails_helper'

RSpec.describe Post type: :model do

	context "データが正しく保存される" do
		before do
			@post = Post.new
			@post.post_target = "甘いものを控える"
			@post.post_body = "ドーナツを2個食べた"
			@post.save
		end
		it "全て入力してあるので保存される" do
			expect(@post).to be_valid
		end
	end

	context "データが正しく保存されない" do
		before do
			@post = Post.new
			@post.post_target = ""
			@post.post_body = "ドーナツを2個食べた"
			@post.save
		end
		it "titleが入力されていないので保存されない" do
			expect(@post).to be_valid
			expect(@post).errors[:post_target].to include("can't be blank")
		end
	end
end