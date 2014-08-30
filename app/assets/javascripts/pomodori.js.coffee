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
          this.$data.pomodori = pomodori
    )
  )(Vue)
