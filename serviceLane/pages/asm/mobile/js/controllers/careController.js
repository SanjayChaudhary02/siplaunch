asmControllers.controller('careController', function($scope, mainService, $location,$rootScope){ 
	$scope.isServiceCallMade = false;
	$scope.miraiEnabled = false;
	$scope.showCareHeading = true;	
	var bindCareInfo = function(){
		$scope.miraiEnabled = false;
		$scope.careFlatTire = false;
		if(!$scope.inputValue){ $rootScope.defaultMessage = true;return;}
		else{
			$scope.showConcurrent(); 
			mainService.getCareInfoData($scope.inputValue).then(function(data) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.care = true;
			if(data.hasOwnProperty('error')){
					$scope.careFlatTire = true;
				}else{
					$scope.careObj = data;			
					$scope.showCareHeading = true;			
					if ($scope.careObj.errorsMsg) {
						$rootScope.defaultMessage = false;
						$rootScope.showInfo = false;
					}
					
					$scope.isEligible = data.eligibleVin; 
					if($scope.isEligible == 'YES'){
						$scope.showVheader = true;
					}
					$scope.isOpen = false;
				   var objLen = $scope.careObj.vehicleServiceHistoryDetails;
				   if(objLen){
					   for(var i=0;i< objLen.length;i++){
						if(objLen[i].status == 'OPEN')
							$scope.isOpen = true;
						}
				   }
				}
			
			});	
		}
	}
	$scope.bindtoyotaCareInfo = function(){
		$scope.isLoading.loadimage = true;
		bindCareInfo();
	};
	$scope.bindMiraiSwapInfo = function(){
		$scope.miraiEnabled = true;
		$scope.miraiFlatTire = false;
		$scope.showOrHideOverAllIcons = false;
		$scope.isLoading.loadimage = true;
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent();
			mainService.getMiraiSwapData($scope.inputValue).then(function(vdata) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.customersurveyiconflag = true;
				$scope.miraiSwapErr = false;
				$scope.miraiSwapObj = vdata;
				
				if(vdata.hasOwnProperty('error') || vdata == null || vdata =='' ||  vdata=='undefined'){
					$scope.miraiFlatTire = true;	
				}
				else{
					if(vdata.hasOwnProperty('errorMsg') && vdata.errorMsg != 'N/A'){
						$scope.miraiSwapErr = true;
					}else{
						console.log("calling");
						  for(var i in $scope.miraiSwapObj.MiraiSwapJson.MiraiSwapList){
							  $scope.miraiSwapObj.MiraiSwapJson.MiraiSwapList[i].open = true;
							  if($scope.miraiSwapObj.MiraiSwapJson.MiraiSwapList[i].gridRowData.length > 0){
								  $scope.showOrHideOverAllIcons = true; 
							  }
							  
						  }
					}
				}
			
			});	
		}
	};
	$scope.expandOrCollapseAll = function(flag) {
		  for(var i in $scope.miraiSwapObj.MiraiSwapJson.MiraiSwapList)
			  $scope.miraiSwapObj.MiraiSwapJson.MiraiSwapList[i].open = flag;
		};

	if(!$scope.isUserBlocked){
		bindCareInfo();
		$scope.isLoading.loadimage = true;
	}
	$scope.$on('bindCareInfo', function(event, mass) {

if($scope.miraiEnabled){
	$scope.bindMiraiSwapInfo();
}
else{
	bindCareInfo();
}
	 });
});