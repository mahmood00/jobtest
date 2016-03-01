
angular.module('toursApp', ['ngRoute'])
    .config(function($routeProvider) {

        $routeProvider
            .when('/', {
                controller:'LoginController as vm',
                templateUrl:'templates/login.html'
            })
            .when('/search', {
                controller:'SearchController as vm',
                templateUrl:'templates/search.html'
            })
            .otherwise({
                redirectTo:'/'
            });
    })
    .controller('LoginController', ['$http','$httpParamSerializerJQLike','$location',function($http, $httpParamSerializerJQLike, $location) {
        var vm = this;
        vm.submit = function(){
            var username = vm.username;
            var password = vm.password;

            $http.post('index.php/user/login', $httpParamSerializerJQLike({
                username: username,
                password: password
            }),{
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
            }
            ).success(function(data, status, headers, config) {
                if(data.success){
                    vm.error = null;
                    $location.path('search');
                } else {
                    vm.error = "Invalid Email or Password.";

                }

            }).error(function(data, status) {
                vm.error = "Invalid Email or Password.";

            });

        }

    }])
    .controller('SearchController', ['$http','$httpParamSerializerJQLike', '$window','$scope','$timeout',function($http, $httpParamSerializerJQLike, $window, $scope, $timeout) {
        var vm = this;
        vm.result = [];
        var allResult = [];
        vm.resultShowAt = 10;
        vm.search = function(){
            var city = vm.city;
            $http.post('index.php/tour/search', $httpParamSerializerJQLike({
                    city: city
                }),{
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
                }
            ).success(function(data, status, headers, config) {
                if(data.error){
                    console.error(data.error);
                    vm.error = data.error;
                    return 0;
                }
                if(data.length == 0){
                    vm.info = "No Result";
                } else {
                    vm.info = null;
                }
                vm.error = null;
                allResult = data;
                allResult.sort(function(a, b){
                    return  b.TourId - a.TourId;
                })
                vm.resultShowAt = 10;
                vm.result = allResult;

            }).error(function(data, status) {
                if(data.error){
                    vm.error = data.error;
                }
            });

        }
        angular.element($window).bind("scroll", function() {

            if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                if(vm.resultShowAt < allResult.length){
                    vm.resultShowAt += 10;
                }

            }
            $timeout(function() {
                $scope.$apply();
            });
        });

    }]);