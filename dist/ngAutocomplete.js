(function(){angular.module("ngAutocomplete",[]).directive("autoComplete",["$document","$filter","$timeout",function(e,t,n){return{restrict:"E",require:"ngModel",template:'<div class=autocomplete><input type=text placeholder=Área id=searchInput class=form-control ng-model=searchText autocomplete=off><ul id=suggestions ng-show="searchText.length > 0"><li ng-repeat="suggestion in suggestions | filter:searchText">{{suggestion}}</li></ul></div>',scope:{},link:function(l,c,i,s){n(function(){return l.suggestions=l.$parent[i.ngLocalData],l.selected=-1,l.$apply()},1e3),angular.element(e).ready(function(){var e,n,c;return e=angular.element("auto-complete"),n=e.find("input"),c=e.find("ul"),c.click(function(e){return l.searchText=angular.element(e.target)[0].innerHTML,c.hide(),l.$apply()}),n.keyup(function(e){var i,s,r,a,u;for(40!==e.which&&38!==e.which&&13!==e.which&&(l.beforeValue=n.val()),40===e.which&&(l.selected<t("filter")(l.suggestions,l.searchText).length-1?l.selected++:l.selected=-1),38===e.which&&(l.selected<0?l.selected=t("filter")(l.suggestions,l.searchText).length-1:l.selected--),13===e.which&&c.hide(),u=c.find("li"),r=0,a=u.length;a>r;r++)s=u[r],angular.element(s).css("background","none");return c.find("li:nth-child("+(l.selected+1)+")").css("background","rgba(110, 110, 110, 0.3)"),40!==e.which&&38!==e.which&&13!==e.which||-1===l.selected?(l.searchText=l.beforeValue,l.$apply()):(i=t("filter")(l.suggestions,l.searchText),l.searchText=i[l.selected],l.$apply())}),l.$watch("searchText",function(){return s.$setViewValue(l.searchText)})})}}}])}).call(this);