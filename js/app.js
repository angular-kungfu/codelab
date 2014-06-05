var app  = angular.module('movies', []);

app.service('MovieService', function ($http) {
	//please put your own api key
	var url = 'http://api.trakt.tv/movies/trending.json/API_KEY?callback=JSON_CALLBACK'
	this.get = function () {
		return $http.jsonp(url);
	}
});

app.controller('MoviesController', function ($scope, MovieService) {
	MovieService.get().then(function (response) {	
		$scope.movies = response.data.filter(function (movie) {
			return movie.year > 2013;
		});
	});
});