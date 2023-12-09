let galeria = document.querySelector('.sec_galeria');
let conteudo = document.querySelector('.conteudo');
let isMouseDown = false;
let startX;
let scrollLeft;

galeria.addEventListener('mousedown', (e) => {
  isMouseDown = true;
  startX = e.pageX - galeria.offsetLeft;
  scrollLeft = galeria.scrollLeft;
});

galeria.addEventListener('mouseleave', () => {
  isMouseDown = false;
});

galeria.addEventListener('mouseup', () => {
  isMouseDown = false;
});


galeria.addEventListener('mousemove', (e) => {
  if (!isMouseDown) return;
  e.preventDefault();
  const x = e.pageX - galeria.offsetLeft;
  const walk = (x - startX) * 1.1;
  galeria.scrollLeft = scrollLeft - walk;
});

/*
galeria.addEventListener('mousemove', (e) => {
    if (!isMouseDown) return;
    e.preventDefault();
    const x = e.pageX - galeria.offsetLeft;
    const walk = (startX - x) * 1.1; // Inverte a direção da rolagem
    galeria.scrollLeft = scrollLeft + walk; // Usa "+" em vez de "-"
  });
*/

//---------------- CARROSEL 02

let galeria02 = document.querySelector('.sec_galeria02');
let conteudo02 = document.querySelector('.conteudo02');
let isMouseDown02 = false;
let startX02;
let scrollLeft02;

galeria02.addEventListener('mousedown', (e) => {
  isMouseDown02 = true;
  startX02 = e.pageX - galeria02.offsetLeft;
  scrollLeft02 = galeria02.scrollLeft;
});

galeria02.addEventListener('mouseleave', () => {
  isMouseDown02 = false;
});

galeria02.addEventListener('mouseup', () => {
  isMouseDown02 = false;
});

galeria02.addEventListener('mousemove', (e) => {
  if (!isMouseDown02) return;
  e.preventDefault();
  const x02 = e.pageX - galeria02.offsetLeft;
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
    document.getElementById("header").style.top = "-55px"; // Altura do cabeçalho para escondê-lo completamente
  }

  prevScrollPos = currentScrollPos;
}