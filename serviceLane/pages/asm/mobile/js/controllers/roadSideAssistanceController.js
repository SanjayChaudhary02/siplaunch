
asmControllers.controller('roadSideAssistanceController', function($scope, mainService, $location,$rootScope){
	$rootScope.isServiceCallMade = false;
	var bindRoadSideAssistance = function(){
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent();
			 mainService.getRoadSideAssistance($scope.inputValue).then(function(vdata) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.roadSideIconflag = true;
				$scope.showScreenNote1 = false;
				$scope.roadSideAssistErr = false;
				$scope.roadSideAssistHistoryErr = false;
				$scope.roadSideAssistanceObject = vdata;
				
				if(vdata.hasOwnProperty('error')){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;	
				}
				else{
					$scope.loopNote = "<ul>";
					angular.forEach($scope.roadSideAssistanceObject.RoadSideAssistance.labelNote1Array, function(value, key) {
					 $scope.loopNote += "<li>"+value+"</li>";
					});
					$scope.loopNote += "</ul>";
					if(vdata.RoadSideAssistance.hasOwnProperty('errorMsg') && vdata.RoadSideAssistance.errorMsg != 'N/A'){$scope.roadSideAssistErr = true;
					}
					if(vdata.RoadSideAssistanceHistory.hasOwnProperty('errorMsg') && vdata.RoadSideAssistanceHistory.errorMsg != 'N/A'){$scope.roadSideAssistHistoryErr = true;
					} 
					if(vdata.RoadSideAssistance.data.hasOwnProperty('ScreenNote1') && vdata.RoadSideAssistance.data.ScreenNote1 != 'N/A')
						$scope.showScreenNote1 = true;
				}
				
			});	
		}
	};	
	if(!$scope.isUserBlocked){
		bindRoadSideAssistance();
		$scope.isLoading.loadimage = true;
	}
	$scope.$on('bindRoadSideAssistance', function(event, mass) { bindRoadSideAssistance(); });
   
});