
$(function() {



  var width = 1100;
  var animationSpeed = 800;
  var slideDuration = 6000;
  var currentSlide = 1;

  var slider = $('#slider');
  var slideContainer = slider.find('#slides');
  var slides = slideContainer.find('.slide');

  setInterval(function() {
    slideContainer.animate({'margin-left': '-='+width}, animationSpeed, function() {
      currentSlide++;
      if (currentSlide === slides.length) {
        currentSlide = 1;
        slideContainer.css('margin-left', 0);
      }
    });
  }, slideDuration);

  $('#prev').click(function() {
    slideContainer.animate({'margin-left': '+='+width}, animationSpeed);
  });

  $('#next').click(function() {
    slideContainer.animate({'margin-left': '-='+width}, animationSpeed);
  });



});
