
//http://www.west-wind.com/weblog/posts/2011/Apr/22/Restricting-Input-in-HTML-Textboxes-to-Numeric-Values
jQuery.fn.forceNumeric = function () {

     return this.each(function () {
         $(this).keydown(function (e) {
             var key = e.which || e.keyCode;

             if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
             // numbers   
                 key >= 48 && key <= 57 ||
             // Numeric keypad
                 key >= 96 && key <= 105 ||
             // comma, period and minus, . on keypad
                key == 190 || key == 188 || key == 109 || key == 110 ||
             // Backspace and Tab and Enter
                key == 8 || key == 9 || key == 13 ||
             // Home and End
                key == 35 || key == 36 ||
             // left and right arrows
                key == 37 || key == 39 ||
             // Del and Ins
                key == 46 || key == 45 ||
             // ctrl + A
                (event.keyCode == 65 && event.ctrlKey === true))
                 return true;

             return false;
         });
     });
 };

 $(document).ready(function(){
	 
 });
 
function hash(){
	$("#pw").val(Crypto.SHA256($("#pw").val()));
}
