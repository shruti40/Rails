# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'change', '#select_team', (e) ->
    team_id = $("#select_team").val()
    $('#member_list').html('')

    $.ajax "/teams/#{team_id}/get_team_members",
        type: 'GET',
        dataType: 'json',
        success:(data) ->
          if data.status == 'success'
            $.each data.team_members, (index, val) ->
              url = "/shifts/new?team_id=#{team_id}&user_id=#{val[0]}"
              $('#member_list').append('</br></br>'+ val[1] + '<div class="ml"></div><a  href="' + url + '">ADD SHIFT</a>')
          else if data.status == 'error'
            alert data.message
          return false
    return;
      
      


