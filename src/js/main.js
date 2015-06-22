'use strict';
require("babelify/polyfill");

if (window.matchMedia) {
	window.mobile = window.matchMedia('screen and (max-width: 480px)');
} else {
	window.mobile = {
		matches: false
	};
}


