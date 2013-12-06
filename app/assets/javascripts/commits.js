var app = angular.module('gitactive', ['gitactive.controllers']);
var controllers = angular.module('gitactive.controllers', []);

controllers.controller('CommitCtrl', function($scope, $http, $interval) {
  $scope.results = {};

  function grabResults() {
    $http({method: 'GET', url: '/commits.json'}).
    success(function(data, status, headers, config) {
      $scope.results = data;
    }).
    error(function(data, status, headers, config) {
      console.log('error');
    });
  }

  grabResults()
  $interval(grabResults, 30000);
})