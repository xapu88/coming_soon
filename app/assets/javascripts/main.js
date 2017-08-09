
$(document).ready(function()
{
	$("body").vegas({
		timer: false,
		delay: 7000,
	    transition: 'fade',
	    transitionDuration: 2000,
	    slides:
	    [
	        { src: "/assets/1.jpg" },
	        { src: "/assets/2.jpg" },
	        { src: "/assets/3.jpg" },
	        { src: "/assets/4.jpg" },
	        { src: "/assets/5.jpg" },
	        { src: "/assets/6.jpg" },
	        { src: "/assets/7.jpg" }
	    ],
	    overlay: '/assets/01.png',
	    animation: [ 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ]
	});
});
