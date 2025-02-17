angular.module('admin.controllers')
.controller('RolesEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.role = { title: '', permissions: [] };

  $http.get("/admins/roles/#{$routeParams.id}").then((response) ->
    controller.role = response.data;
  );

  @updateRole = () ->
    $http.put("/admins/roles/#{controller.role.id}", @_roleParams()).then( ->
      $location.path('/roles');
    );

  @newPermission = () ->
    controller.role.permissions.push({});

  @deletePermission = (permission) ->
    $http.put("/admins/roles/#{controller.role.id}", @_deletePermissionParams(permission)).then( ->
      controller.role.permissions.splice(controller.role.permissions.indexOf(permission), 1);
    );

  @locationPath = () ->
    "##{$location.path()}";

  @_roleParams = () ->
    role: {
      title: controller.role.title,
      permissions_attributes: controller.role.permissions
    };

  @_deletePermissionParams = (permission) ->
    role: {
      permissions_attributes: [{
        id: permission.id,
        _destroy: true
      }];
    };

  controller;
]);
