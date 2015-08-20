flapperNews.controller('MainCtrl', ['$scope', 'posts', function($scope, posts){

  $scope.posts = posts;

  $scope.newPost = {};

  $scope.createPost = function(){
    $scope.posts.post($scope.newPost).then(function(data){
      $scope.posts.push(data);
      $scope.newPost = {};
    });
  };

  $scope.upvote = function(post){
    post.customPUT(post, 'upvote').then(function(data){
      post.upvotes += 1;
    });
  };

}]);
