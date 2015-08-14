Rails.application.routes.draw do

  resources :posts, only: [:index, :show, :create] do
    member { put '/upvote' => 'posts#upvote' }

    resources :comments, only: [:create] do
      member { put '/upvote' => 'comments#upvote' }
    end
  end

end
