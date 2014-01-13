---
layout: post
---
While working on an angular.js project recently I ran into issues with long running http requests initiated by controllers that had since been destroyed causing subsequent requests to be delayed until they completed. To further complicate things, each browser support a different number of concurrent http requests, so behavior can is often erratic.

In a traditional web application, these requests would be destroyed by the browser when navigating to a new page, but in a single page web application no such cleanup happens and we're left to handle things on our own.

Luckily a recent build of angular added support for cancelling of outstanding $http requests via the `timeout` options.

Here's a quick example implementation that demonstrates cancelling multiple outstanding $http requests when the controller is destroyed (such as when navigating to a new view):

    angular.module("App").
        controller("SomeCtrl", ["$scope", $http", $q", function($scope, $http, $q){
            // Initiate a long running http request
            $http.get("http://example.com/endpoint", {timeout: $scope.canceler.promise});

            // And another one
            $http.get("http://example.com/another_endpoint", {timeout: $scope.canceler.promise});

            // Wait for the controller to be destroyed
            $scope.$on("$destroy", function(){
                // Cancel all outstanding $http requests
                // Multiple requests can share the same timeout promise
                $scope.canceler.resolve();
            });
        }]);