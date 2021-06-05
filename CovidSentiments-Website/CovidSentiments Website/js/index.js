// backToTop button
var btn = $('#backToTop');

$(window).scroll(function() {
  if ($(window).scrollTop() > 300) {
    btn.addClass('show');
  } else {
    btn.removeClass('show');
  }
});

btn.on('click', function(e) {
  e.preventDefault();
  $('html, body').animate({scrollTop:0}, '300');
});

// //active nav
// $(document).ready(function(){
//     $('.nav-item').click(function(){
//         $('.nav-item').removeClass('active');
//         $(this).addClass('active');  
//     });
//   });

//smooth nav link scroll
$(document).ready(function() {
    $('#main-nav li a').click(function(e) {
        
        var targetHref = $(this).attr('href');
        
      $('html, body').animate({
          scrollTop: $(targetHref).offset().top
      }, 1000);
      
      e.preventDefault();
    });
  });

//modal
// Get the modal
var modal = document.getElementById('myModal');

// Get the images and bind an onclick event on each to insert it inside the modal
// use its "alt" text as a caption
var images = document.querySelectorAll(".img-thumbnail");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
for(let i = 0; i < images.length; i++){
  images[i].onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
  }
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
} 

