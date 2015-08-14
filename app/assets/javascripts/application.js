// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .




$(document).ready(function(){
    var counter = 1;
    // this function controls the clicks on the article navigation bar to sort content by time
    /*
    // DRYing:
    function animate_width(el, amount, display_val){
      el.animate({width: amount}, 800).css("display", display_val)
    }
    */
    $(".columns").click(function(){
        var self = this
        $('h1').each(function(){
            if ($(this).hasClass(self.id) == true){
                if ($(self).parent().hasClass("users")){
                    $(this).parent().animate({
                        width: "100%"
                    }, 800, function() {})
                    // This last argument, the function, is an optional parameter
                    $(this).parent().css("display", "block")
                } else {
                    $(this).parent().animate({
                        width: "30.66666667%"
                    }, 800, function() {})
                    $(this).parent().css("display", "block")
                } // closes "users" class else
            } else {
                $(this).parent().animate({
                     width: "0"
                }, 800, function() {})
                $(this).parent().css("display", "none");
                     // Animation complete.
            };
        }); // closes h1.each function
     });// closes columns click function

     // this function controls clicks on Guardian content (if it has been loaded after a search) and controls expanding/descreasing the size of the columns
     $(".guardianClick").click(function(){
       // No need to declare twice
       // var self = this
         if (counter % 2 != 0) {
             var self = this;

             console.log(counter);
             $(this).parent().parent().animate({
                 width: "100%"
             }, 800, function(){
                 $(self).prev().css("overflow", "scroll")
                 $(self).html("See Less")
                 $(self).css("background-color", "#FFAF94")
             });
             counter++
        } else {
            var self = this;
             $(this).parent().parent().animate({
                 width: "48%"
             }, 800, function(){
                 $(".storyPreview").css("overflow", "hidden")
                 $(self).html("You've Read This!")
             });
             counter++
         }
        //  });
     }); // closes guardianClick function

}); // closes document.ready

// If you have to comment your code to remind yourself which brackets close what, you should probably extract a bunch of your code into new, smaller methods.
