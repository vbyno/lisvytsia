#= require jquery
#= require jquery_ujs
#= require underscore
#= require gmaps/google
#= require ckeditor/init
#= require bootstrap-sprockets
#= require unify
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.uk.js

#= require ./public/google_analytics
#= require ./public/listvytsia
#= require_tree ./public/listvytsia

# Pictures Engine
#= require angular
#= require angular-resource
#= require angular-rails-templates
#= require ng-file-upload-all
#= require ui-bootstrap-tpls-1.3.1
#= require angular-confirm

#= require pictures
#= require profiles
#= require hotels
#= require micro_groups
#= require calendars

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on 'ready page:load', ->
  angular.bootstrap(
    document,
    [
      'pictures',
      'hotels',
      'profiles',
      'micro_groups',
      'calendar'
    ],
    { strictDi: true }
  )
