

let prevScrollPos = window.pageYOffset;

window.onscroll = function() {
  let currentScrollPos = window.pageYOffset;

  if (prevScrollPos > currentScrollPos) {
    document.getElementById("header").style.top = "0";
  } else {
    document.getElementById("header").style.top = "-50px"; // Altura do cabeçalho para escondê-lo completamente
  }

  prevScrollPos = currentScrollPos;
}