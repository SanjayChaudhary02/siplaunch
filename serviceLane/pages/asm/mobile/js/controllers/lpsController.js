asmControllers.controller('lpsController', function($scope, mainService, $location, $http,$rootScope, $timeout){  	
    	
	$scope.bindLpsCurrentInfo = function(){
		$scope.isLoading.loadimage = true;
		$scope.lps.currentPage = "current";
		$scope.lps.lpsUpadte = true;
		$scope.lps.CurrentPopup = false;
		$scope.lps.authCodeAvailable = null;
		$scope.showConcurrent();
		mainService.getLpsCurrentData().then(function(data) {
		$scope.isLoading.loadimage = false;
		$scope.lps.lpsCurrentErr = false;
		$scope.lps.flatTireErr = false;
		$scope.lps.selectedDetail = [];
		$rootScope.lpsCurrentObj = data;		
		if(data.hasOwnProperty('error')){
					$scope.lps.flatTireErr = true;
		}else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
				$scope.lps.lpsCurrentErr = true;
		}else
			$scope.lps.authCodeAvailable = data.lpsCurrent.authCodeAvailable;
		
		});
	}
	$scope.bindLpsPendingInfo = function(){
		$scope.isLoading.loadimage = true;
		$scope.lps.currentPage = "pending";
		$scope.lps.authCodeAvailable = null;		
		mainService.getLpsPendingData().then(function(data) {
		$scope.isLoading.loadimage = false;
		$scope.lps.lpsPendingErr = false;
		$rootScope.lpsPendingObj = data;
		$scope.lps.flatTireErr = false;
		$scope.lps.CurrentPopup = false;
		$scope.lps.lpsUpadte = true;	
		$scope.lps.selectedDetail = [];		
		if(data.hasOwnProperty('error')){
			$scope.lps.flatTireErr = true;	
		}else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
				$scope.lps.lpsPendingErr = true;
			}
			else
				$scope.lps.authCodeAvailable = data.lpsPending.authCodeAvailable;
		
		});
	}
	$scope.bindLpsHistoryInfo = function(cusId){
		$scope.isLoading.loadimage = true;
		$scope.lps.currentPage = "history";
		$scope.lpsHistoryCustIds='';
		mainService.getLpsHistoryData(cusId).then(function(data) {
		$scope.isLoading.loadimage = false;
		$scope.lpsHistoryErr = false;
		$scope.lpsHistoryObj = data;
		$scope.lps.flatTireErr = false;
		if(data.hasOwnProperty('error')){
			$scope.lps.flatTireErr = true;	
		}else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
				$scope.lpsHistoryErr = true;
			}
		
		});
	}
	$scope.lpsRefresh = function(){
		$scope.lps.CurrentPopup = false;
		if($scope.lps.currentPage == 'current') $scope.bindLpsCurrentInfo()
		if($scope.lps.currentPage == 'pending') $scope.bindLpsPendingInfo()
		if($scope.lps.currentPage == 'history') $scope.bindLpsHistoryInfo()
	}
	$scope.expandCollapseAllGrp = function(page,state){	
		if(page == 'current'){
			$rootScope.lpsCurrentObj.lpsCurrent.groupList.forEach(function(e) {
			e.open = state;
		  });	
	  }
	  if(page == 'pending'){
			$rootScope.lpsPendingObj.lpsPending.groupList.forEach(function(e) {
			e.open = state;
		  });	
	  }if(page == 'history'){
			$scope.lpsHistoryObj.lpsHistory.historyObjectList.forEach(function(e) {
			e.open = state;
		  });	
	  }
	}
	
	$scope.icon = {
        "false": 'icon-plus-sign',
        "true": 'icon-minus-sign'
      }
	  
	  
	
	$scope.accordionHeader = function(cusId,openst,idx){
		if(!openst){
			$scope.isLoading.loadimage = true;
			if($scope.lpsHistoryCustIds)
				$scope.lpsHistoryCustIds+=","+cusId;
			else
				$scope.lpsHistoryCustIds = cusId;
			
				mainService.getLpsHistoryData($scope.lpsHistoryCustIds).then(function(data) {			
						$scope.lpsHistoryGrpObj = data.lpsHistory;
						//$scope.lpsHistoryGrpObj = JSON.parse(data).lpsHistory;
						$scope.isLoading.loadimage = false;
				});
			
		}
	}
	
    $scope.lpsOptionChanges = function(setId,initSt,itemId,grpId){		
		if(initSt == 'false'){
			$scope.lps.lpsUpadte = false;
			var x = grpId+'-'+itemId+'*'+setId;
			for(var i=0;i<$scope.lps.selectedDetail.length;i++)
			{
				var y=grpId+'-'+itemId;
				var j= $scope.lps.selectedDetail[i].split("*");
				if(j[0] == y)
					$scope.lps.selectedDetail.pop(i);
				
			}
			$scope.lps.selectedDetail.push(x);		
		}
		else{			
			for(var i=0;i<$scope.lps.selectedDetail.length;i++)
			{
				var y=grpId+'-'+itemId;
				var j= $scope.lps.selectedDetail[i].split("*");
				if(j[0] == y)
					$scope.lps.selectedDetail.pop(i);
				
			}		
		}
		
	}
	
	$scope.UpadteOptions = function(cbtn){
		$rootScope.authCodeSelection = false;
		$rootScope.authFlatTireErr = false;		
		$scope.lps.cbtn = cbtn;
		angular.element('body').css('overflow-y','hidden');
		if(($scope.lps.selectedDetail.length && $scope.lps.authCodeAvailable) || $scope.lps.CurrentPopup || (cbtn && $scope.lps.authCodeAvailable)){			
			$rootScope.lpsAuthCodeObj = null;
			$rootScope.authCodeSelection = true;
			$scope.isLoading.loadimage = true;
			mainService.getAuthCodeData().then(function(data) {	
						$rootScope.lpsAuthCodeObj = data;
						if(data.hasOwnProperty("error"))
							$rootScope.authFlatTireErr = true;
						$scope.isLoading.loadimage = false;
			});
		}
		if(($scope.lps.selectedDetail.length && !$scope.lps.authCodeAvailable && !$scope.lps.CurrentPopup) || (cbtn && !$scope.lps.authCodeAvailable)){
			$scope.showuserselction('lps');
		}
		if(!$scope.lps.selectedDetail.length && !cbtn){
			alert("No net changes have been made to the LPS.");
			$scope.lps.lpsUpadte = true;
		}
		
	}
	
	 
	
});
	