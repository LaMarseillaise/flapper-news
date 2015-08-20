var flapperNews = angular.module('flapperNews', ['ui.router', 'restangular', 'Devise']);

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
    controller: 'PostsCtrl',
    resolve: {
      post: ['$stateParams', 'Post', function($stateParams, Post){
        return Post.one($stateParams.id).get();
      }]
    },
  })
  .state('login', {
    url: '/login',
    templateUrl: 'templates/_login.html',
    controller: 'AuthCtrl',
    onEnter: ['$state', 'Auth', function($state, Auth) {
      Auth.currentUser().then(function (){
        $state.go('home');
      })
    }]
  })
  .state('register', {
    url: '/register',
    templateUrl: 'templates/_register.html',
    controller: 'AuthCtrl',
    onEnter: ['$state', 'Auth', function($state, Auth) {
      Auth.currentUser().then(function (){
        $state.go('home');
      })
    }]
  });

}]);

flapperNews.run(['$rootScope', function($rootScope){
  $rootScope.$on("$stateChangeError", console.log.bind(console));
}]);
