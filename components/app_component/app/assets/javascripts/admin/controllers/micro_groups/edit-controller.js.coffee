angular.module('admin.controllers')
.controller('MicroGroupsEditController', ['$http', '$location', '$routeParams', ($http, $location, $routeParams) ->
  controller = this;
  controller.micro_group = {
    name: '',
    permalink: '',
    city: '',
    idea: '',
    leaders: '',
    contacts: '',
    methodologies: '',
    priority: 0,
    calendar_url: null
  };

  controller.city_names = []

  $http.get('/admins/regions').then((response) ->
    controller.city_names = _.map(response.data, ((obj) -> obj.name));
  );

  $http.get("/admins/micro_groups/#{$routeParams.id}").then((response) ->
    controller.micro_group = response.data;
  );

  @updateMicroGroup = () ->
    $http.put("/admins/micro_groups/#{controller.micro_group.id}", @_microGroupParams()).then( ->
      $location.path('/micro_groups');
    );

  @locationPath = () ->
    "##{$location.path()}";

  @readonlyIdentifier = () ->
    true

  @_microGroupParams = () ->
    micro_group: {
      name: controller.micro_group.name,
      permalink: controller.micro_group.permalink,
      city: controller.micro_group.city,
      idea: controller.micro_group.idea,
      leaders: controller.micro_group.leaders,
      contacts: controller.micro_group.contacts,
      methodologies: controller.micro_group.methodologies
      calendar_url: controller.micro_group.calendar_url
      priority: controller.micro_group.priority
    }

  @_deleteMicroGroupParams = (micro_group) ->
    micro_group: {
      id: micro_group.id,
    };

  controller;
]);
