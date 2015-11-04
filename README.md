# ngAutocomplete
AngularJS directive for autocomplete input box

### Installation

Terminal
>```
bower install ng-simple-autocomplete
```

bower.json
>```json
...
"dependencies": {
	"ng-simple-autocomplete": "1.0.0",
	...
}
...
```

### Prepare

Add the files **ngAutocomplete.js** and **ngAutocomplete.css** to your html file. This files are located inside **dist** folder into package folder.

>```html
<link rel="stylesheet" type="text/css" href="bower_components/ng-simple-autocomplete/dist/ngAutocomplete.css">
```

>```html
<script type="text/javascript" src="bower_components/ng-simple-autocomplete/dist/ngAutocomplete.js"></script>
```

Note: The path to **bower_components** can be diferent because .bowerrc file

### Usage

>```html
<auto-complete ng-model="yourModel" ng-local-data="array" />
```

Where **yourModel** is a variable that you need to save the selected item in autocomplete directive and **array** is an array with the values than it can be selected from the autocomplete directive.

### Credits

This project has been created by [Raúl Salvador Andrade](http://github.com/rabrux) and is sponsored by [WA Technologies](http://wat.mx)