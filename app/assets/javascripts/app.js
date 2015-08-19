var flapperNews = angular.module('flapperNews', ['ui.router']);

flapperNews.config(['$stateProvider', '$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('home');

  $stateProvider.state('home', {
    url: '/home',
    templateUrl: '/templates/home.html',
    controller: 'MainCtrl'
  })
  .state('posts', {
    url: '/posts/{id}',
    templateUrl: '/templates/posts.html',
    controller: 'PostsCtrl'
  });

}]);
