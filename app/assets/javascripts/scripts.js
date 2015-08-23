$( document ).ready(function() { 
	  function moviein() {     
    $('.video').animate({
		opacity: 1,
		height: "100%"
		}, 1300, 'easeInOutQuint');
 	};

	  function showlogo_intro() {     
    $('.logo_intro').animate({left: '1.5%'}, 600, 'easeOutBack');
 	};

	  function showskip() { 
    $('.skip').animate({right: '-150px'}, 1100, 'easeOutElastic');
	};


    function blurr() { 
		$('#movie').animate({'opacity': 0}, 2800, 'easeInOutQuint');
    };
   	  function showskip_small() { 
    $('.skip').animate({right: '-312px'}, 1100, 'easeOutElastic');
	};

	
    	moviein();
		setTimeout(showlogo_intro, 1500);
		setTimeout(showskip, 2400);
		setTimeout(showskip_small, 8400);

});



