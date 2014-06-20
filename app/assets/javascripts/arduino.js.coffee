# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@IndexCtrl = ($scope) ->
  $scope.title = "My blog"

@ArduinoCtrl($scope, $http) ->
	$scope.setServo = @(analogID, value) ->
		var url = "http://192.168.1.165/arduino/servo/" + analogID + "/" + value;
		console.log(url);
		$http.get(url);
  
function ArduinoCtrl($scope, $http)
{

	$scope.setServo = function(analogID, value) {
			var url = "http://192.168.1.165/arduino/servo/" + analogID + "/" + value
			console.log(url);
			$http.get(url);
	}

}