asmControllers.controller('serviceHistoryController', function($scope, mainService, $location,$rootScope){
	
	$rootScope.isServiceCallMade = false;
	console.log("Entered Into   service history- "+$scope.inputValue);	
	var bindServiceHistoryInfo = function(flag){
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent();
			mainService.getServiceHistoryData($scope.inputValue,flag).then(function(vdata) {
				$scope.resetLeftMenu();	
				$scope.isLoading.loadimage = false;
				$rootScope.servicehistoryiconflag = true;
				$scope.nodataError = false;
				$scope.nshError = false;
				$scope.noNshDataError = false;
				$scope.noWarrantyDataError = false;
				$scope.noGoodwillDataError = false;
				$scope.serviceHistoryObj = vdata;
				if(vdata.hasOwnProperty('error')){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;	

				}
				else if($scope.serviceHistoryObj.nshAvailable == false && $scope.serviceHistoryObj.warrantyAvailable == false && $scope.serviceHistoryObj.nshErrorDesc != 'N/A')
				{
				$scope.nodataError = true;
				$scope.nshError = true;
				}
				else if($scope.serviceHistoryObj.nshAvailable == false && $scope.serviceHistoryObj.warrantyAvailable == false )
				{
				$scope.nodataError = true;
				}
				else
				{
					console.log('calling');
					if($scope.serviceHistoryObj.nshErrorDesc != 'N/A')
					{
					$scope.nshError = true;
					}
					 if($scope.serviceHistoryObj.nshAvailable == false && $scope.serviceHistoryObj.warrantyAvailable == true )
					 {
						$scope.noNshDataError = true;
					 }
					 if($scope.serviceHistoryObj.nshAvailable == true && $scope.serviceHistoryObj.warrantyAvailable == false )
					 {
						$scope.noWarrantyDataError = true;
					 }			
					 if($scope.serviceHistoryObj.goodWillArrayCount == 0 )
					 {
						$scope.noGoodwillDataError = true;
					 }	
					  for(var i in $scope.serviceHistoryObj.allHistoryArray)
						  $scope.serviceHistoryObj.allHistoryArray[i].open = (i == 0) ?true:false;
					  for(var i in $scope.serviceHistoryObj.goodWillArray)
						  $scope.serviceHistoryObj.goodWillArray[i].open = (i == 0) ?true:false;
					  for(var i in $scope.serviceHistoryObj.nshArray)
						  $scope.serviceHistoryObj.nshArray[i].open = (i == 0) ?true:false;
					  for(var i in $scope.serviceHistoryObj.warrantyArray)
						  $scope.serviceHistoryObj.warrantyArray[i].open = (i == 0) ?true:false;
					  $scope.warrantyAllAcordian = 'warranty';
					 
				}
			});	
		}
	};
	$scope.showOrRemoveNshErrorBox =  function(flag){
		angular.element("#serviceerrormessage").css('display',(flag) ? 'block' :'none');
	}
	$scope.removeOverAllMinusPlus =  function(type,count,warrantyType){
		if(count<= 0)
			{
			angular.element("#tab32accordion32minus").css('visibility',type);
			angular.element("#tab32accordion32plus").css('visibility',type);
			}
		$scope.warrantyAllAcordian = warrantyType;
		
	};
	$scope.viewOlderData =  function(){
		$scope.serviceOlderData = true;
		$scope.isLoading.loadimage = true;
		 bindServiceHistoryInfo(true);
	};
	$scope.viewBackServiceHistoryData =  function(){
		$scope.serviceOlderData = false;
		$scope.isLoading.loadimage = true;
		 bindServiceHistoryInfo();
	};
	$scope.expandOrCollapseAll = function(flag,accordianType) {
		if(accordianType == 'all')
		{
			for(var i in $scope.serviceHistoryObj.allHistoryArray)
				  $scope.serviceHistoryObj.allHistoryArray[i].open = flag;
		}
		else if(accordianType == 'nsh')
		{
		for(var i in $scope.serviceHistoryObj.nshArray)
			  $scope.serviceHistoryObj.nshArray[i].open = flag;
		}
		else if(accordianType == 'warranty')
		{
		for(var i in $scope.serviceHistoryObj.warrantyArray)
			  $scope.serviceHistoryObj.warrantyArray[i].open = flag;
		}	
		else if(accordianType == 'goodwill')
		{
		for(var i in $scope.serviceHistoryObj.goodWillArray)
			  $scope.serviceHistoryObj.goodWillArray[i].open = flag;
		}	
		 

		};
	console.log("$scope.isUserBlocked",$scope.isUserBlocked);
	if(!$scope.isUserBlocked){
		bindServiceHistoryInfo();
		$scope.isLoading.loadimage = true;
	}
	$scope.$on('bindServiceHistoryInfo', function() {$scope.serviceOlderData = false; bindServiceHistoryInfo(); });
});