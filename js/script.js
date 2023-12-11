
let prevScrollPos = window.pageYOffset;

window.onscroll = function() {
  let currentScrollPos = window.pageYOffset;

  if (prevScrollPos > currentScrollPos) {
    document.getElementById("header").style.top = "5px";
  } else {
    document.getElementById("header").style.top = "-50px"; 
  }

  prevScrollPos = currentScrollPos;
}




