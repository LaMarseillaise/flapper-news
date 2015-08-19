flapperNews.controller('MainCtrl', ['$scope', 'Post', function($scope, Post){

  $scope.posts = Post.posts;

  $scope.createPost = function(){
    $scope.posts.push({
      title: $scope.title,
      link: $scope.link,
      upvotes: 0,
      comments: [
        {author: 'Joe', body: 'Cool post!', upvotes: 0},
        {author: 'Bob', body: 'Great idea but everything is wrong!', upvotes: 0}
      ]
    });
    $scope.title = "";
    $scope.link = "";
  };

  $scope.upvote = function(post){
    post.upvotes += 1;
  };

}]);
