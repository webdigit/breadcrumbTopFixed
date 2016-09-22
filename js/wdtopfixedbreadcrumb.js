$(function(){
	var breadcrumb = {
		init: function(){
			//console.log('breadcrumb init');
			this.cacheDom();
			this.bindEvents();
		},
		cacheDom: function(){
			//console.log('breadcrumb cacheDom');
			this.$header = $('.sns_header_main .container');
			this.menu = '#sns_menu';
			this.$menu = $(this.menu);
			this.$logo = $('.small_logo_header');
			this.$cart = $('.small_cart_header');
			//this.$logoMini = $('.small_logo_header_mini');
			this.$shopCart = $('.shopcartshow');
			//this.$shopCart.hide();
		},
		bindEvents: function(){
			
			var viewportInterval = setInterval($.proxy(function(){
				if(!this.isElementInViewport(this.$menu)){
					this.showMenu();
					clearInterval(viewportInterval);
				}

			},this), 1000);
			
			this.$header.appear();
			this.$menu.appear();
			
			if(!this.$menu.is(':appeared') || !this.$header.is(':appeared')){
				console.log('force appear');
				this.showMenu();
			}
			
			this.$header.on('appear', $.proxy(function(e, $affected) {
				console.log('appear');
				this.hideMenu();
			},this));
			this.$header.on('disappear', $.proxy(function(e, $affected) {
			    console.log('disappear');
			    this.showMenu();
			},this));
			
		},
		hideMenu: function(){
			console.log('hideMenu');
			this.$cart.removeClass('small_cart_header_display');
			this.$menu.removeClass('fil-ariane');
			this.$logo.hide();
			this.$shopCart.hide();	
			this.$menu.removeAttr('style');	
		},
		showMenu: function(){
			console.log('showMenu');
			this.$menu.addClass('fil-ariane');
			this.$menu.attr('style', 'position: fixed!important;');
			this.$cart.addClass('small_cart_header_display');
			this.$logo.hide();
			this.$shopCart.show();
		},
		isElementInViewport: function(el) {
			console.log('isElementInViewport');
		    //special bonus for those using jQuery
		    if (typeof jQuery === "function" && el instanceof jQuery) {
		        el = el[0];
		    }

		    var rect = el.getBoundingClientRect();
		    console.log(rect);
		    
		    return (
		        rect.top >= 0 &&
		        rect.left >= 0 &&
		        //rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
		        rect.bottom <= ($(window).height()) &&
		        //rect.right <= (window.innerWidth || document.documentElement.clientWidth)
		        rect.right <= ($(window).width())
		    );
		}
	}
	breadcrumb.init();
});
