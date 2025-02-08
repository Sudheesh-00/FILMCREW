(function($){
  "use strict"; 
	/*----------------------------
    Stikey Js
    ---------------------------- */ 
	(function () {
			var nav = $('.main-menu');
			var scrolled = false;
			$(window).scroll(function () {
				if (120 < $(window).scrollTop() && !scrolled) {
					nav.addClass('sticky_menu animated fadeInDown').animate({ 'margin-top': '0px' });
					scrolled = true;
				}
				if (120 > $(window).scrollTop() && scrolled) {
					nav.removeClass('sticky_menu animated fadeInDown').css('margin-top', '0px');
					scrolled = false;
				}
			});
		}());	
    /*----------------------------
     Main Slider Carousel
    ---------------------------- */	  
	if ($('.main-slider-carousel').length) {
		$('.main-slider-carousel').owlCarousel({
			loop:true,
			margin:0,
			nav:true,
			animateOut: 'fadeOut',
    		animateIn: 'fadeIn',
    		active: true,
			smartSpeed: 1000,
			autoplay: 6000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:1
				},
				1200:{
					items:1
				}
			}
		});    		
	}
	/*----------------------------
     Accordion Box
    ---------------------------- */	
	if($('.accordion-box').length){
		$(".accordion-box").on('click', '.acc-btn', function() {
			
			var outerBox = $(this).parents('.accordion-box');
			var target = $(this).parents('.accordion');
			
			if($(this).hasClass('active')!==true){
				$(outerBox).find('.accordion .acc-btn').removeClass('active ');
			}
			
			if ($(this).next('.acc-content').is(':visible')){
				return false;
			}else{
				$(this).addClass('active');
				$(outerBox).children('.accordion').removeClass('active-block animated fadeInUp');
				$(outerBox).find('.accordion').children('.acc-content').slideUp(300);
				target.addClass('active-block animated fadeInUp');
				$(this).next('.acc-content').slideDown(300);	
			}
		});	
	}	
    /*----------------------------
     Testimonial 
    ---------------------------- */		
	$('.testimonial_slider').owlCarousel({
    autoplay:true,
    // autoplayTimeout:1000,
    autoplayHoverPause:false,
    loop:false,
    margin:30,
    dots: false,
    nav: true,
	navText: ["<img src='images/prev-arrow-01.png'>","<img src='images/next-arrow-01.png'>"],
    responsiveClass:true,
    responsive:{
        0:{
            items:1
        },
        992:{
            items:2
        }
		}
	})	
	/*----------------------------
    Brand Slider
    ---------------------------- */
	$('.brand-slider').owlCarousel({
    loop:true,
    margin:10,
    responsiveClass:true,
    autoplay:true,
    responsive:{
        0:{
            items:1,
            nav:true
        },
        600:{
            items:3,
            nav:false
        },
        1000:{
            items:5,
            nav:true,
            loop:false
        }
    }
	});		
    /*----------------------------
    scrollUp
    ---------------------------- */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });
    /*----------------------------
     CounterUp
    ---------------------------- */	
	$('.counter1').counterUp({
            delay: 100,
            time: 3000
        });		
    /*----------------------------
     Responsive Menu
    ---------------------------- */			
   $("#mobilemenu").slicknav({
            prependTo: '#responsive-menu'
        });
		
    $(window).on("load",function(){
          jQuery(".pinch-loader").fadeOut(500);
		 }); 
 
})(jQuery); 