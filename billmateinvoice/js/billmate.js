$('li[class^="billmate_flag_"]').click(function()
	{
		var country = $(this).attr('class').replace('billmate_flag_', '');
		$('.billmate_form_'+country).toggle();
		if ($('.billmate_form_'+country).is(":visible"))
		$('.billmate_form_'+country).append('<input type="hidden" name="activate'+country+'" value="on" id="billmate_activate'+country+'"/>');
	else
		$('#billmate_activate'+country).remove();
});

$(document).ready(function(){
    var height = 0;
    $('.billmate-blockSmall').each(function(){
	if (height < $(this).height())
	    height = $(this).height();
    });

    $('.billmate-blockSmall').css({'height' : $('.billmate-blockSmall').css('height', height+'px')});
});