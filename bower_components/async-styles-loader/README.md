# About
script will cache your styles in the localstorage, to update it change the name of the files.

# Usage
include this file in header of the page
then call function
getStyleAsync(path,name);
path is css file path
name could be anything, it's just so you can store multiple files in localstorage

## Example
```
if(document.all && !document.addEventListener){
	getStyleAsync("../css/fonts_ie8.css?ver=1.0.2",'fonts_ie8');
} else {
	getStyleAsync("../css/fonts.css?ver=1.0.2",'fonts');
}
getStyleAsync("../css/all.css?ver=1.0.2",'all');
```

### async-styles-loader


javascript asyncronus loader for css files
