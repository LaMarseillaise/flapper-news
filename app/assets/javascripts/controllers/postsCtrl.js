flapperNews.controller('PostsCtrl', ['$scope', 'post',
function($scope, post){

  $scope.post = post;

  $scope.newComment = {};

  $scope.addComment = function(){
    $scope.post.post('comments', $scope.newComment).then(function(data){
      $scope.post.comments.push(data);
      $scope.newComment = {};
    });
  };

  $scope.upvote = function(comment){
    $scope.post.one('comments', comment.id).customPUT(comment, 'upvote').then(function(data){
      comment.upvotes += 1;
    });
  };

}]);
