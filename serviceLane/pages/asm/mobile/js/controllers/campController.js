
asmControllers.controller('campController', function($scope, mainService, $location,$rootScope){ 
	//if(!$scope.inputValue){ $location.path("/"); return;}
	$rootScope.isServiceCallMade = false;
	//$scope.$emit('showErrorMsg', {content :true, showMsgBox : true, msg : "", msgType : "Error", msgSubType : "" });
	var bindCampInfo = function(){
		if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
		else{
			$scope.showConcurrent(); 
			mainService.getCampInfoData($scope.inputValue).then(function(data) {
				$scope.resetLeftMenu();
				$scope.isLoading.loadimage = false;
				$rootScope.campaign = true;
				if(data.error){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;					
				}else{
					$rootScope.sysError = false;
					$rootScope.campObj = data.serviceCampaigns;
					$scope.showSSC = data.showSSC;
					if($scope.showSSC == true){
						$scope.showVheader = true;	
					}
					$rootScope.showInfo = false;       
					if($rootScope.campObj == null || $rootScope.campObj =='' ||  $rootScope.campObj=='undefined'){
						$rootScope.content = true;
						$rootScope.showInfo =true;
						$rootScope.isServiceCallMade =true;
						$rootScope.defaultMessage =false;
						return
					}
				
				}				
			});	
		}	
	};	
	$scope.campDocList = function(id,$event){	
		$rootScope.campaignDoc = true;			
		$scope.listCunt = 3;
		var idx = id.split("_");;
		console.log("id",idx[1]);
		$scope.documentObj = $scope.campObj[idx[1]].t3DocumentList;
		var evtobj = window.event ? window.event : e;
		displayballoontip($event.target, evtobj,1);	
		
	};	
	$scope.showMore = function(op){
		if(op == "more")
			$scope.listCunt = $scope.documentObj.length;			
		if(op == "less")
			$scope.listCunt = 3;
	};
	if(!$scope.isUserBlocked){
		$scope.isLoading.loadimage = true;
		bindCampInfo();
	}
	$scope.$on('bindCampInfo', function(event, mass) { bindCampInfo(); });
   $scope.showTechnicianPopup = function(techname,lastDate,assId,exp,cert) {		
		$scope.campTechnician.show = true;
		$scope.isLoading.loadimage = true;
		$scope.campTechnician.errMsg = false;
		$scope.campTechnician.techFlatTireError = false;
		mainService.getTechData(techname,lastDate,assId,exp,cert).then(function(data) {						
			$scope.isLoading.loadimage = false;	
			$scope.campTechnician.campData = {"name": techname,"lastDate": lastDate,"associateId": assId,"certificate":cert,"exp":exp};
			$scope.campTechnician.data = data;			
				if(data.hasOwnProperty('error')){
					$scope.campTechnician.techFlatTireError = true;
				}
				else if(data.hasOwnProperty('errorMsg')){					
					$scope.campTechnician.errMsg = true;
					$scope.campTechnician.data = data;
				}
		});        
    }
});