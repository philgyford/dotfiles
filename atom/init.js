
"use babel"

/* Extending vim-mode-plus */

/* From https://github.com/t9md/atom-vim-mode-plus/wiki/ExtendVimModePlusInInitFile#advanced-deletewithbackholeregister */
function consumeVimModePlusService(callback) {
  const consume = (pack) => callback(pack.mainModule.provideVimModePlus())

  const pack = atom.packages.getActivePackage('vim-mode-plus')
  if (pack) {
    consume(pack)
  } else {
    const disposable = atom.packages.onDidActivatePackage(pack => {
      if (pack.name === 'vim-mode-plus') {
        disposable.dispose()
        consume(pack)
      }
    })
  }
}

/* From https://github.com/t9md/atom-vim-mode-plus/wiki/ExtendVimModePlusInInitFile#advanced-deletewithbackholeregister */
consumeVimModePlusService(service => {
  class DeleteWithBackholeRegister extends service.getClass("Delete") {
    execute() {
      this.vimState.register.name = "_"
      super.execute()
    }
  }
  DeleteWithBackholeRegister.commandPrefix = "vim-mode-plus-user"
  DeleteWithBackholeRegister.registerCommand()
})
