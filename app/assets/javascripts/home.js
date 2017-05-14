// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



document.addEventListener("DOMContentLoaded", function (event) {
  var bigBurger = document.querySelector('.bigburger')
  var navLink = document.querySelectorAll('.navlink')
  var dropBtn = document.querySelectorAll('.dropbtn')


  bigBurger.addEventListener( "click", function() {
    this.classList.toggle( "change" );
    for (var i = 0; i < navLink.length; i++){
      if (navLink[i].style.display === 'block') {
        navLink[i].style.display = 'none';
      } else {
        navLink[i].style.display = 'block';
      }
    }
    for (var i = 0; i < dropBtn.length; i++){
      if (dropBtn[i].style.display === 'block') {
        dropBtn[i].style.display = 'none';
      } else {
        dropBtn[i].style.display = 'block';
      }
    }

  });





})
