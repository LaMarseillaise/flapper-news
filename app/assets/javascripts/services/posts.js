flapperNews.factory('Post', ['Restangular', function(Restangular){
  var service = Restangular.service("posts");
  return service;
}]);
