var app = angular.module('gitactive', []);

app.controller('CommitCtrl', ['$scope', '$http', '$interval', function($scope, $http, $interval) {
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
}]);