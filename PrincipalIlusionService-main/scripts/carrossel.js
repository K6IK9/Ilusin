let galeria = document.querySelector('.sec_galeria');
let isMouseDown = false;
let startX;
let scrollLeft;

galeria.addEventListener('mousedown', (e) => {
  isMouseDown = true;
  startX = e.pageX - galeria.offsetLeft;
  scrollLeft = galeria.scrollLeft;
});

galeria.addEventListener('touchstart', (e) => {
  isMouseDown = true;
  startX = e.touches[0].pageX - galeria.offsetLeft;
  scrollLeft = galeria.scrollLeft;
});

galeria.addEventListener('mouseleave', () => {
  isMouseDown = false;
});

galeria.addEventListener('mouseup', () => {
  isMouseDown = false;
});

galeria.addEventListener('touchend', () => {
  isMouseDown = false;
});

galeria.addEventListener('mousemove', (e) => {
  if (!isMouseDown) return;
  e.preventDefault();
  const x = e.pageX - galeria.offsetLeft;
  const walk = (x - startX) * 1.1;
  galeria.scrollLeft = scrollLeft - walk;
});

galeria.addEventListener('touchmove', (e) => {
  if (!isMouseDown) return;
  e.preventDefault();
  const x = e.touches[0].pageX - galeria.offsetLeft;
  const walk = (x - startX) * 1.1;
  galeria.scrollLeft = scrollLeft - walk;
});

let galeria02 = document.querySelector('.sec_galeria02');
let isMouseDown02 = false;
let startX02;
let scrollLeft02;

galeria02.addEventListener('mousedown', (e) => {
  isMouseDown02 = true;
  startX02 = e.pageX - galeria02.offsetLeft;
  scrollLeft02 = galeria02.scrollLeft;
});

galeria02.addEventListener('touchstart', (e) => {
  isMouseDown02 = true;
  startX02 = e.touches[0].pageX - galeria02.offsetLeft;
  scrollLeft02 = galeria02.scrollLeft;
});

galeria02.addEventListener('mouseleave', () => {
  isMouseDown02 = false;
});

galeria02.addEventListener('mouseup', () => {
  isMouseDown02 = false;
});

galeria02.addEventListener('touchend', () => {
  isMouseDown02 = false;
});

galeria02.addEventListener('mousemove', (e) => {
  if (!isMouseDown02) return;
  e.preventDefault();
  const x02 = e.pageX - galeria02.offsetLeft;
  const walk02 = (x02 - startX02) * 1.1;
  galeria02.scrollLeft = scrollLeft02 - walk02;
});

galeria02.addEventListener('touchmove', (e) => {
  if (!isMouseDown02) return;
  e.preventDefault();
  const x02 = e.touches[0].pageX - galeria02.offsetLeft;
  const walk02 = (x02 - startX02) * 1.1;
  galeria02.scrollLeft = scrollLeft02 - walk02;
});




/***** header sumiço*****/


let prevScrollPos = window.pageYOffset;

window.onscroll = function() {
  let currentScrollPos = window.pageYOffset;

  if (prevScrollPos > currentScrollPos) {
    document.getElementById("header").style.top = "4px";
  } else {
    document.getElementById("header").style.top = "-70px"; // Altura do cabeçalho para escondê-lo completamente
  }

  prevScrollPos = currentScrollPos;
}



document.addEventListener('keypress', function(e){
  if(e.key == 'Enter'){
    redirecionar();
  }
})

function redirecionar() {
  
  var valorDoInput = document.getElementById("meuInput").value;
  window.location.href = "../page/busca.html?valor=" + encodeURIComponent(valorDoInput);
  console.log(valorDoInput);
}




