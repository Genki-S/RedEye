$(document).ready ->
  ((Vue) ->
    "use strict"

    window.app = new Vue(
      el: "#main"
      data:
        pomodori: []

      ready: ->
        jqxhr = $.ajax(
          url: "/api/v1/pomodori"
          data: "uid=681364011953743"
          context: this
          dataType: "json"
        )
        jqxhr.done (response) ->
          pomodori = response
          for pomodoro in pomodori
            time = moment(pomodoro.started_at)
            minutes = time.hour() * 60 + time.minute()
            pomodoro.leftPos = (minutes / (24 * 60)) * 100 + '%'
          this.$data.pomodori = pomodori
    )
  )(Vue)
