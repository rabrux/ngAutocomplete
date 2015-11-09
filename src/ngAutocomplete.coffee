angular.module('ngSimpleAutocomplete', [])
	.directive 'autoComplete', [
		'$document'
		'$filter'
		'$timeout'
		($document, $filter, $timeout) ->
			{
				restrict: 'E'
				require: 'ngModel'
				template: '<div class=autocomplete><input type=text placeholder=Área id=searchInput class=form-control ng-model=searchText autocomplete=off><ul id=suggestions ng-show="searchText.length > 0"><li ng-repeat="suggestion in suggestions | filter:searchText">{{suggestion}}</li></ul></div>'
				scope: {}
				link: (scope, elem, attrs, ngModel) ->
					$timeout ->
						scope.suggestions = scope.$parent[attrs.ngLocalData]
						scope.selected = -1
						scope.$apply()
					, 1000

					angular.element($document).ready ->
						$autocomplete = angular.element('auto-complete')
						$input = $autocomplete.find('input')
						$list = $autocomplete.find('ul')
						$list.click (ev) ->
							scope.searchText = angular.element( ev.target )[0].innerHTML
							$list.hide()
							scope.$apply()

						$input.keyup (ev) ->
							# Save before value for undefined index
							if ev.which != 40 and ev.which != 38 and ev.which != 13
								scope.beforeValue = $input.val()
							# key arrow down
							if ev.which == 40
								if scope.selected < $filter('filter')(scope.suggestions, scope.searchText).length - 1
									scope.selected++
								else
									scope.selected = -1
							# key arrow up
							if ev.which == 38
								if scope.selected < 0
									scope.selected = $filter('filter')(scope.suggestions, scope.searchText).length - 1
								else
									scope.selected--
							# key intro
							if ev.which == 13
								$list.hide()
							for i in $list.find('li')
								angular.element(i).css 'background', 'none'
							$list.find('li:nth-child(' + ( scope.selected + 1 ) + ')').css 'background', 'rgba(110, 110, 110, 0.3)'
							if (ev.which == 40 or ev.which == 38 or ev.which == 13) and scope.selected != -1
								fil = $filter('filter')(scope.suggestions, scope.searchText)
								scope.searchText = fil[scope.selected]
								scope.$apply()
							else
								scope.searchText = scope.beforeValue
								scope.$apply()
						
						scope.$watch 'searchText', ->
							ngModel.$setViewValue scope.searchText

					return
			}
	]