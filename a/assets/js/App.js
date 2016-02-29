
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
    .controller('SearchController', ['$http','$httpParamSerializerJQLike',function($http, $httpParamSerializerJQLike) {
        var vm = this;
        vm.result = [];
        vm.search = function(){
            var city = vm.city;
            $http.post('index.php/tour/search', $httpParamSerializerJQLike({
                    city: city
                }),{
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
                }
            ).success(function(data, status, headers, config) {
                console.log(data);
                vm.result = data;


            }).error(function(data, status) {


            });
            /*for(var i=0; i< 10 ; i++){
                var temp = {id: 10+ Math.random() * 100, Name: 'Here' + Math.random(), City: 'City1' + Math.random()};
                vm.result.push(temp);
            }*/
        }

    }]);