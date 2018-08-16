(() => {
  const {globalShortcut} = require('electron').remote
    
  globalShortcut.register('CommandOrControl+f', () => {
    let s = document.querySelector('.searchBox__mainColumn')
    s.focus();
    // s.scrollIntoView()
  })

  for (let idx = 0; idx < 8; idx++) {
    globalShortcut.register(`CommandOrControl+${idx+1}`, () => {
      document.querySelectorAll('.side-nav a')[idx].click()
    })
  }

  // globalShortcut.register(`CommandOrControl+k`, () => {
  //   const btn = document.querySelector('.fixed-action-btn a')
  //   if (btn) {
  //     btn.click()
  //   }
  // })

  
})()