asmControllers.controller('customerSurveyController', function($scope, mainService, $location,$rootScope){ 
	
	$rootScope.isServiceCallMade = false;
	var bindCustomerSurveyInfo = function(){
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent();
			mainService.getCustomerSurveyData($scope.inputValue).then(function(vdata) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.customersurveyiconflag = true;
				$scope.cusotmerSurveyErr = false;
				$scope.customerSurveyObj = vdata;
				
				if(vdata.hasOwnProperty('error') || vdata == null || vdata =='' ||  vdata=='undefined'){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;	
				}
				else if(vdata.hasOwnProperty('errorMsg') && vdata.errorMsg != 'N/A'){
					$scope.cusotmerSurveyErr = true;
				}else{
					console.log("calling");
					  for(var i in $scope.customerSurveyObj.CustomerSurveyJSON.CustomerSurveyListList)
						  $scope.customerSurveyObj.CustomerSurveyJSON.CustomerSurveyListList[i].open = (i == 0) ?true:false;
				}
			});	
		}
	};	
	$scope.expandOrCollapseAll = function(flag) {
		  for(var i in $scope.customerSurveyObj.CustomerSurveyJSON.CustomerSurveyListList)
			  $scope.customerSurveyObj.CustomerSurveyJSON.CustomerSurveyListList[i].open = flag;
		};
	if(!$scope.isUserBlocked){
		bindCustomerSurveyInfo();
		$scope.isLoading.loadimage = true;
	}
	$scope.$on('bindCustomerSurveyInfo', function(event, mass) { bindCustomerSurveyInfo(); });
   
});