require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:hot_post) { FactoryGirl.create(:post) }

  describe 'GET #index' do
    it 'renders a list of posts in json' do
      2.times { FactoryGirl.create(:post) }
      get :index
      expect(response.body).to eq(Post.all.to_json)
    end
  end


  describe 'GET #show' do
    it 'renders a post in json' do
      get :show, id: hot_post.id
      expect(response.body).to eq(hot_post.to_json)
    end
  end


  describe 'POST #create' do
    it 'creates a new post' do
      expect{
        post :create, post: FactoryGirl.attributes_for(:post)
      }.to change{Post.count}.by(1)
    end

    it 'renders the new post as json' do
      post :create, post: FactoryGirl.attributes_for(:post)
      expect(response.body).to eq(Post.last.to_json)
    end
  end


  describe 'PUT #upvote' do
    it 'adds one upvote to a post' do
      saved_count = hot_post.upvotes
      put :upvote, id: hot_post.id
      hot_post.reload
      expect(hot_post.upvotes).to eq(saved_count + 1)
    end

    it 'responds with the upvoted post' do
      put :upvote, id: hot_post.id
      hot_post.reload
      expect(response.body).to eq(hot_post.to_json)
    end
  end

end
