$(function(){
	$('#navigation').slide({
		type: "menu",
		titCell: '.main',
		targetCell: '.sub',
		effect: 'slideDown',
		delayTime: 300,
		triggerTime: 100
	});
	$('#banner').slide({
		titCell: ".hd ul",
		mainCell: ".bd",
		effect: "fade",
		delayTime:1500,
		interTime: 5000,
		autoPlay: true,
		autoPage: true,
		trigger: "click"
	});
	$('#banner').mouseover(function(){
		$(this).find('.next').show();
		$(this).find('.prev').show();
	}).mouseleave(function(){
		$(this).find('.next').hide();
		$(this).find('.prev').hide();
	})
	//详情页多图
	$('#info_slideshow').slide({
		trigger : 'click'
	});
});