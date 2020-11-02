command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 150000 # ms

render: (output) ->
  "bat <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 9px Menlo
  top: 16px
  right: 30px
  color: #eee8d5
  span
    color: #aaa
"""
