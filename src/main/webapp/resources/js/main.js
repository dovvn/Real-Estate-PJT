//fullpage.js
$(document).ready(function() {
$('#fullpage').fullpage({
	anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage', 'lastPage'],
	menu: '#menu',
	scrollBar:true,
	continuousVertical: false
	});
});


//메뉴
/**스크롤이 설정한 높이 이상 내려갔을때 스타일추가하기**/
if (jQuery(window).width() > 0) {
   jQuery(window).on("scroll",function(ev){
       if(jQuery(window).scrollTop() > 10 ) { /**높이 픽셀 조정**/
           jQuery('#header').addClass('fixed');  /**위의 높이에서 .fixed 클래스를 추가합니다. 스타일에서 자유롭게 수치 조절 가능합니다.**/
		   $("#header").css("border-bottom", "0px");
		   $("#header").css("opacity", "0.8");
		   $('.nav-item a').removeClass('text-light');
		   $('.nav-item a').addClass('text-dark');
		   $('.nav-item').removeClass('text-light');
		   $('.nav-item').addClass('text-dark');
		   $('.navbar-brand').css("color", "#333");
		   $('.logo').css("color","#333");
       }
       else{
		jQuery('#header').removeClass('fixed');
		   $("#header").css("border-bottom", "1px solid rgba(255, 255, 255, 0.3)");
		   $('.nav-item a').removeClass('text-dark');
		   $('.nav-item a').addClass('text-light');
		   $('.nav-item').removeClass('text-dark');
		   $('.nav-item').addClass('text-light');
		   $('.navbar-brand').css("color", "#fff");
		   $('.logo').css("color","#fff");
       }
       return false;
   });
}

$(function () {
	$('.intro_box li').mouseover(function () {
		$(this).children('#box_hover').css("display", "block");
		$(this).children('#box_active').css("display", "none");
	})

	$('.intro_box li').mouseleave(function () {
		$(this).children('#box_hover').css("display", "none");
		$(this).children('#box_active').css("display", "block");
	})
})

$(function(){
	//마우스오버
	$("#gnb_layer").hide();
	$("#h_menu a").mouseover(function(){
		$("#gnb_layer").slideDown(300);
		//return false;
		$("#header").css("background","#FFF");
		$("#header .h_logo img").attr("src","image/h_logo_change.png");
		$("#header #h_menu > li a").css("color","#000");
		$("#header #h_menu > li a:hover").css("color","#00F");
		$("#header .h_info > li a").css("color","#000");
		$("#gnb_layer").css("border-top","1px solid #c1c1c1");
		$("#gnb_layer").css("border-bottom","1px solid #c1c1c1");
	});
		$("#gnb_layer").mouseleave(function(){
		$("#header").css("background","");
		$("#header .h_logo img").attr("src","image/h_logo.png");
		$("#header #h_menu > li a").css("color","#FFF");
		$("#header .h_info > li a").css("color","#FFF");
		closeMenu();
	});
});