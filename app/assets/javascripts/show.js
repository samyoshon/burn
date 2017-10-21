/*
jQuery event that triggers when the button is pressed
# is an ID jQuery selector, usage:#anyElementId
*/
$('.btn-contact-info').on('click',function(){
    
/*
In CSS, you can check if an element is visible by checking if the property display value is different from none, because if it's value is none, it will not be visible
*/
    if($('#1').css('display')!='none'){
/*    
So, if div 1 is visible, the condition will be true
*/
    $('#2').html($('#static').html()).show().siblings('div').hide();
        
/*
When you use it with parameter, example:
.html('<div><b>Any</b> plain text or HTML you want here.</div>')
It set the element HTML to whatever you put on it's parameter

When you use the method .html() without parameter, it returns the element HTML, so by using $('#static').html(), it will return the HTML from the DIV with ID static.

So I'm setting the DIV 2 HTML to whatever is static HTML

Right after setting the HTML, I use .show() to show div 2, and right after that I use .siblings('div').hide(), to hide any DIV siblings of the one I've just have showed up.

In jQuery, you can use methods to run synchronously, concatenating them with dots, example:
$('#div1').show().siblings('div').hide();

In this example it will show #div1 then right after that search for it div siblings and hide them.
*/
    }else if($('#2').css('display')!='none'){
/*    
Condition to check if DIV 2 is visible
*/
        $('#1').show().siblings('div').hide();
/*    
If it is, it will show DIV 1 and right after that will search for it siblings and hide them with .siblings('div').hide();
*/
    }
});show.js