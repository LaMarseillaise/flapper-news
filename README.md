# Flapper News

This application was built as part of a tutorial, [found here](https://thinkster.io/angular-rails/), for Angular on Rails.

The application is structured as a list of posts and their subordinate comments, which can be upvoted. Sign in is required for creating posts and comments, but not for viewing or upvoting them.

It includes [bower](https://github.com/bower/bower) for front-end dependencies, [ui-router](https://github.com/angular-ui/ui-router) for client-side routing, [Restangular](https://github.com/mgonto/restangular) (not part of the tutorial) for API calls from the front-end, and [Devise](https://github.com/plataformatec/devise) for user authentication on the backend. The Rails version is 4.2.3, and much of the backend is tested with [Rspec](https://github.com/rspec/rspec).
