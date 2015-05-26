
$(document).ready(function(){
  if (Modernizr.touch) {
      // show the close overlay button
      $(".close-overlay").removeClass("hidden");
      // handle the adding of hover class when clicked
      $(".add-source").click(function(e){
         $(".image").not(this).removeClass("hover");
          if (!$(this).closest(".image").hasClass("hover")) {
              $(this).closest(".image").addClass("hover");
          }
      });
      // handle the closing of the overlay
      $(".close-overlay").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          if ($(this).closest(".image").hasClass("hover")) {
              $(this).closest(".image").removeClass("hover");
          }
      });
  }
});
