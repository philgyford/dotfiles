"use babel"

const path = require("path")


///////////////////////////////////////////////////////////////////////////
// Extending vim-mode-plus

// General service consumer function
// From https://github.com/t9md/atom-vim-mode-plus/wiki/ExtendVimModePlusInInitFile#overview
function consumeService(packageName, functionName, fn) {
  const consume = pack => fn(pack.mainModule[functionName]())

  if (atom.packages.isPackageActive(packageName)) {
    consume(atom.packages.getActivePackage(packageName))
  } else {
    const disposable = atom.packages.onDidActivatePackage(pack => {
      if (pack.name === packageName) {
        disposable.dispose()
        consume(pack)
      }
    })
  }
}

consumeService("vim-mode-plus", "provideVimModePlus", service => {
  return
  const Base = service.Base

  // In vim-mode-plus, stop `d` putting the delete text on the clipboard.
  // Add this to keymap too:
  // 'atom-text-editor.vim-mode-plus:not(.insert-mode)':
  //   '\\ d': 'vim-mode-plus-user:delete-with-backhole-register'
  // From https://github.com/t9md/atom-vim-mode-plus/wiki/ExtendVimModePlusInInitFile#advanced-deletewithbackholeregister
  // And from https://github.com/t9md/dotfiles/blob/a36f604f01f04fcb8ef98b0badfa9ba4397c1505/atom/init.js
  class DeleteWithBackholeRegister extends Base.getClass("Delete") {
    static commandPrefix = "vim-mode-plus-user"
    execute() {
      this.vimState.register.name = "_"
      super.execute()
    }
  }
  DeleteWithBackholeRegister.registerCommand()
})
