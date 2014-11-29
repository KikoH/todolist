// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function() {
   $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.ajax({
      url: '/todolists?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function(data){
      $('#todolists').html(data);
    });
  });
});


// --------Vanilla javascript

// function display_search_results() {
//     // readyState === 4 means that the asynchronous request completed successfully
//     if (this.readyState === 4) {
//       console.log(this);
//       document.getElementById('todolists').innerHTML = this.responseText;
//     }
//   }

//   var form = document.getElementById('search-form');
//   form.addEventListener('submit', function(event) {
//     event.preventDefault();
//     var searchValue = document.getElementById('search').value;

//     var xhr = new XMLHttpRequest();
//     xhr.onload = display_search_results;
//     xhr.open('GET', '/todolists?search=' + searchValue, true);
//     xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
//     xhr.send();
//   });