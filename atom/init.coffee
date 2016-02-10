# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"


# Add toggle-invisibles command.
# From https://discuss.atom.io/t/is-there-a-command-for-show-invisibles/7224/12
atom.commands.add 'atom-text-editor',
  'settings:toggle-show-invisibles': (event) ->
    invisibles = atom.config.get('editor.showInvisibles')
    atom.config.set('editor.showInvisibles', !invisibles)
