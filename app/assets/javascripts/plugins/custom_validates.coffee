$(document).on 'ready page:load', () ->
  jQuery.validator.addMethod "mobilePhone", (value, element, params) ->
    $(element).intlTelInput("isValidNumber")