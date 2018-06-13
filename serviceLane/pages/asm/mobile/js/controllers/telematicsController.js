
asmControllers.controller('telematicsController', function($scope, mainService, $location,$rootScope){ 
	
	$rootScope.isServiceCallMade = false;
	var bindTelematicsInfo = function(){
		$scope.telenote = 'Please note that "Enform Remote User" does not have an expiration date. Services are dependent on the primary subscriber\'s expiration date.';
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent(); 
			mainService.getTelematicsData($scope.inputValue).then(function(vdata) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.telematicsIconflag = true;
				$scope.telematicsProdErr = false;
				$scope.XMSubscriptionVOErr = false;
				$scope.dcmErr = false;
				$scope.telematicsObj = vdata;
				
				if(vdata.hasOwnProperty('error')){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;	
				}
				else{
					if(vdata.telematicSubscriptionVO.hasOwnProperty('errorMsg') && vdata.telematicSubscriptionVO.errorMsg != 'N/A'){$scope.telematicsProdErr = true;
					}
					if(vdata.DCMlog.hasOwnProperty('errorMsg') && vdata.DCMlog.errorMsg != 'N/A'){
						$scope.dcmErr = true;
					}
					if(vdata.XMSubscriptionVO.hasOwnProperty('errorMsg') && vdata.XMSubscriptionVO.errorMsg != 'N/A'){$scope.XMSubscriptionVOErr = true;
					}
				}


				
			});	
		}
	};	
	if(!$scope.isUserBlocked){
		bindTelematicsInfo();
		$scope.isLoading.loadimage = true;
	}
	$scope.$on('bindTelematicsInfo', function(event, mass) { bindTelematicsInfo(); });
   
});