const reloadedChecks = () => {

}

const checkerChanger = () => {
  const dpn = document.getElementById("user_dpn");
  const cocBox = document.getElementById("coc");
  const userCoc = document.getElementById("user_coc");
  const pds = document.getElementById("pds");


  if (dpn) {
    dpn.addEventListener("click", () => {
      cocBox.classList.toggle('closed')
    })
  }

  if (userCoc) {
    userCoc.addEventListener("click", () => {
      pds.classList.toggle('closed')
    })
  }
}


export { checkerChanger,  };
