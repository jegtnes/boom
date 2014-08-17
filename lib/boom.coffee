###
# This file is the entry point of your package. It will be loaded once as a
# singleton.
#
# More information: https://atom.io/docs/latest/creating-a-package#source-code
###

exec = require("child_process").exec

module.exports =

  ###
  # This required method is called when your package is activated. It is passed
  # the state data from the last time the window was serialized if your module
  # implements the serialize() method. Use this to do initialization work when
  # your package is started (like setting up DOM elements or binding events).
  ###
  activate: (state) ->
    puts = (error, stdout, stderr) ->
      if error
        console.log "You do not have Powder installed"
      else
        console.log "Powder is installed"
    exec = require("child_process").exec
    exec "powder", puts

    workspace = atom.workspaceView
    workspace.command 'boom:toggleBackground', =>
      @toggleBackground()

  ###
  # This optional method is called when the window is shutting down, allowing
  # you to return JSON to represent the state of your component. When the
  # window is later restored, the data you returned is passed to your module's
  # activate method so you can restore your view to where the user left off.
  ###
  serialize: ->
    console.log 'serialize()'

  ###
  # This optional method is called when the window is shutting down. If your
  # package is watching any files or holding external resources in any other
  # way, release them here. If you're just subscribing to things on window, you
  # don't need to worry because that's getting torn down anyway.
  ###
  deactivate: ->
    console.log 'deactivate()'


  ###
  # This custom method toggles the .yeoman class on the appropriate DOM
  # element.
  ###
  toggleBackground: ->
