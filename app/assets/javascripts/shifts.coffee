# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#select_team').on 'change', ->
    alert('1')
    team_id = $(this).val()

    $.ajax '/teams/get_team_members',
        type: 'GET'
        dataType: 'json'
        data:
          team_id: team_id
        success:(data) ->
          if data.status == 'success'
            $('#member_list').html(data.team_members)
          else if data.status == 'error'
            alert data.message
          return false
    
  return
