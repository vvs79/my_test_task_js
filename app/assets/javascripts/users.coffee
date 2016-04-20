app = angular.module("User", ["ngResource"])

app.factory "User", ["$resource", ($resource) ->
  $resource("/users_admin/:id.json", {id: "@id"}, {'update': {method: 'PUT'}})
]

app.controller 'UserCtrl', ['$scope', 'User', ($scope, User) ->
  $scope.users = User.query()

  $scope.removeUser = (user) ->
    user.$remove()
    $scope.users.splice($scope.users.indexOf(user), 1)
]
