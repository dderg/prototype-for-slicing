
function getStyleAsync(css_href,cacheName){
	"use strict";
	// once cached, the css file is stored on the client forever unless
	// the URL below is changed. Any change will invalidate the cache
	// a simple event handler wrapper
	var head = document.getElementsByTagName('head')[0];
  function on(el, ev, callback) {
    if (el.addEventListener) {
      el.addEventListener(ev, callback, false);
    } else if (el.attachEvent) {
      el.attachEvent("on" + ev, callback);
    }
  }

	// if we have the fonts in localStorage or if we've cached them using the native batrowser cache
	if ((window.localStorage && localStorage[cacheName]) || document.cookie.indexOf(cacheName) > -1){
		// just use the cached version
		injectFontsStylesheet();
	} else {
	 // otherwise, don't block the loading of the page; wait until it's done.
    if ( !!(window.addEventListener) )
      on(window, "DOMContentLoaded", injectFontsStylesheet)
    else // MSIE
      on(window, "load", injectFontsStylesheet)
	}

	// quick way to determine whether a css file has been cached locally
	function fileIsCached(href) {
		return window.localStorage && localStorage[cacheName] && (localStorage[cacheName+"_file"] === href);
	}

	// time to get the actual css file
	function injectFontsStylesheet() {
	 // if this is an older browser
		if (!window.localStorage || !window.XMLHttpRequest) {
			var stylesheet = document.createElement('link');
			stylesheet.href = css_href;
			stylesheet.rel = 'stylesheet';
			stylesheet.type = 'text/css';
			head.appendChild(stylesheet);
			// just use the native browser cache
			// this requires a good expires header on the server
			document.cookie = cacheName;
		
		// if this isn't an old browser
		} else {
			 // use the cached version if we already have it
			if (fileIsCached(css_href)) {
				injectRawStyle(localStorage[cacheName]);
			// otherwise, load it with ajax
			} else {
				var xhr = new XMLHttpRequest();
				xhr.open("GET", css_href, true);
				// cater for IE8 which does not support addEventListener or attachEvent on XMLHttpRequest
				xhr.onreadystatechange = function () {
					if (xhr.readyState === 4) {
						// once we have the content, quickly inject the css rules
						injectRawStyle(xhr.responseText);
						// and cache the text content for further use
						// notice that this overwrites anything that might have already been previously cached
						localStorage[cacheName] = xhr.responseText;
						localStorage[cacheName+"_file"] = css_href;
					}
				};
				xhr.send();
			}
		}
	}

	// this is the simple utitily that injects the cached or loaded css text
	function injectRawStyle(text) {
		var style = document.createElement('style');
		// cater for IE8 which doesn't support style.innerHTML
		style.setAttribute("type", "text/css");
		if (style.styleSheet) {
			style.styleSheet.cssText = text;
		} else {
			style.innerHTML = text;
		}
		head.appendChild(style);
	}
}