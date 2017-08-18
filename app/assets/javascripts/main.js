
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
	        { src: "/assets/2.jpeg" },
	        { src: "/assets/3.jpeg" },
	        { src: "/assets/4.jpg" },
	        { src: "/assets/5.jpeg" },
	        { src: "/assets/6.jpg" }
	    ],
	    overlay: '/assets/01.png',
	    animation: [ 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ]
	});
});
