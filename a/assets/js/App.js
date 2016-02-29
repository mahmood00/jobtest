
angular.module('toursApp', ['ngRoute'])
    .config(function($routeProvider) {
        /*var resolveProjects = {
            projects: function (Projects) {
                return Projects.fetch();
            }
        };*/

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
        var resultShowAt = 9;
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
                vm.error = null;
                allResult = data;
                resultShowAt = 9;
                vm.result = allResult.slice(0, resultShowAt + 1);

            }).error(function(data, status) {
                if(data.error){
                    vm.error = data.error;
                }
            });

        }
        angular.element($window).bind("scroll", function() {

            if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                var oldresultShowAt = resultShowAt;
                for( ;resultShowAt <= oldresultShowAt + 10 && resultShowAt < allResult.length; resultShowAt++){
                    vm.result.push(angular.copy(allResult[resultShowAt]));

                }
            }
            $timeout(function() {
                $scope.$apply();
            });
        });

    }]);