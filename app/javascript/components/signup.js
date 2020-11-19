const checkerChanger = () => {
  const dpn = document.getElementById("user_dpn");
  const tester = () => {
    console.log("hello");
  }
  if (dpn) {
    dpn.addEventListener("click", tester)
  }
}


// const initUpdateNavbarOnScroll = () => {
//   const navbar = document.querySelector('.navbar-lewagon');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-lewagon-white');
//       } else {
//         navbar.classList.remove('navbar-lewagon-white');
//       }
//     });
//   }
// }

export { checkerChanger };
