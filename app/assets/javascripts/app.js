var flapperNews = angular.module('flapperNews', ['ui.router', 'restangular']);

flapperNews.config(['$stateProvider', '$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('home');

  $stateProvider.state('home', {
    url: '/home',
    templateUrl: '/templates/home.html',
    controller: 'MainCtrl',
    resolve: {
      posts: ['Post', function(Post){
        return Post.getList();
      }]
    },
  })
  .state('posts', {
    url: '/posts/{id}',
    templateUrl: '/templates/posts.html',
    controller: 'PostsCtrl'
  });

}]);

// flapperNews.config(['RestangularProvider', function(RestangularProvider) {
//
//   RestangularProvider.setBaseUrl('http://localhost:3000');
//   RestangularProvider.setRequestSuffix('.json')
//
// }]);
