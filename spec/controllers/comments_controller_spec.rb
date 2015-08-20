require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:comment)  { FactoryGirl.create :comment }
  let(:hot_post) { FactoryGirl.create :post }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) { sign_in(:user, user) }


  describe 'POST #create' do
    it 'creates a new comment' do
      expect{
        post :create, post_id: hot_post.id, comment: FactoryGirl.attributes_for(:comment)
      }.to change{hot_post.comments.count}.by(1)
    end

    it 'renders the new comment as json' do
      post :create, post_id: hot_post.id, comment: FactoryGirl.attributes_for(:comment)
      expect(response.body).to eq(Comment.last.to_json)
    end
  end


  describe 'PUT #upvote' do
    it 'adds one upvote to a post' do
      saved_count = comment.upvotes
      put :upvote, id: comment.id, post_id: comment.post.id
      comment.reload
      expect(comment.upvotes).to eq(saved_count + 1)
    end

    it 'responds with the upvoted post' do
      put :upvote, id: comment.id, post_id: comment.post.id
      comment.reload
      expect(response.body).to eq(comment.to_json)
    end
  end

end
