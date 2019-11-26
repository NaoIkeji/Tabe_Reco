require 'rails_heiper'

RSpec.describe PostsController, type: :controller do
	describe '新規投稿ページ' do
		context "新規投稿ページが正しく表示される" do
			before do
				get:new
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end