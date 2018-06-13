asmControllers.controller('vhrController', function($scope, mainService, $location, $http,$rootScope, $timeout){  	
    if(!$scope.inputValue){ $location.path("/"); return;}
	$scope.reportTypeOptions = ["ALL", "Maintenance","MIL ON","Generated","Scheduled"];	
	$scope.isFiltered = false;
	$scope.generateOptions = function(){
		$scope.isFiltered = true;
		bindVhrInfo(1);
	}
	$scope.vhrErrorMessage="";
	var bindVhrInfo = function(idx){
	if(!idx)
		$scope.reportSelected = {"type":$scope.reportTypeOptions[0]};
		$scope.flatTireError = false;
		$scope.vhrflatTireError = false;
		$scope.isLoading.loadimage = true;
		$scope.showConcurrent();
		mainService.getVhrInfo($scope.reportSelected.type, $scope.isFiltered).then(function(data) {
			$scope.resetLeftMenu();
			$scope.isLoading.loadimage = false;
			$scope.vhr = true;
			$scope.vhrErrorMessage = "N/A";
			$scope.telematicsErr = "N/A";
			$scope.showVHRData = true;
			if($scope.telmatcisObj){
				$scope.telmatcisObj = "";
			}
			if($scope.vhrTabObj){
				$scope.vhrTabObj = "";
			}
			$scope.vhrObj = data;
			if(data.hasOwnProperty('error')){
				$scope.flatTireError = true;
			}else {
				$scope.telmatcisObj = data.telematicJSON.data;
				if($scope.vhrObj.vhrJSON.hasOwnProperty('error')){
					$scope.vhrflatTireError = true;
				}
				if(!$scope.vhrObj.vhrJSON.hasOwnProperty('error')){
					if(data.vhrJSON.data.vhrVOS){
						$scope.vhrTabObj = data.vhrJSON.data.vhrVOS;
					}
				}
				if($scope.vhrObj.telematicJSON.hasOwnProperty('errorMsg') && $scope.vhrObj.telematicJSON.errorMsg !='N/A' ){
					$scope.telematicsErr = data.telematicJSON.errorMsg;
				}
				if($scope.vhrObj.vhrJSON.hasOwnProperty('errorMsg') && $scope.vhrObj.vhrJSON.errorMsg !='N/A' ){
					$scope.vhrErrorMessage = data.vhrJSON.errorMsg;
					$scope.showVHRData = false;
				}
			}
			
	});
};

$scope.bindDiagnosticInfo = function(){
	$scope.urlParams =  '&_portlet.lafUniqueId=t3PortalLookandFeel&_portlet.portalUrl=/serviceLane/appmanager/t3/ext&_portlet.portalId=t3ext&_portlet.contentType=text/html;+charset=UTF-8&_portlet.asyncMode=enabled&_portlet.discEnabled=true&_nfxr=false&_pageLabel=ASMPortal_portal_page_62&_appSource=slane1';
	$scope.diagFlatTireError = false;
	$scope.diagnosticError = false;
	$scope.showConcurrent();
	mainService.getDiagnosticInfo().then(function(data) {
			$scope.resetLeftMenu();
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty('error')){
				$scope.diagFlatTireError = true;
			}else {
				$scope.diagnosticObj = data;
			}
	});
}


	if(!$scope.isUserBlocked){
		$scope.isLoading.loadimage = true;
		//console.log("extendLeftMenu",$scope.leftMenu.isBrriEnabled,$scope.extendLeftMenu.isBrriEnabled)
		$scope.isBrriEnabled = $scope.leftMenu.isBrriEnabled;	
		if($scope.isBrriEnabled){
			bindVhrInfo(0);
			//$scope.bindDiagnosticInfo();
		}else{
			$scope.bindDiagnosticInfo();
		}
	}
	$scope.$on('bindVhrInfo', function(event, passedData) {
		if($scope.leftMenu.isBrriEnabled)
			bindVhrInfo(0);
			else{
				$scope.bindDiagnosticInfo();
			}
		
	});	
	
	$scope.generateReport = function(){
		$scope.showSpinner = true;
		$scope.generateRepoErrMsg = "N/A";
		mainService.getVhrRepo().then(function(data) {
			$scope.showSpinner = false;
			if(data.hasOwnProperty('errorMsg') && data.errorMsg !='N/A' ){
				$scope.vhrErrorMessage = data.errorMsg;
			}else{
			$scope.genRepoObj = data;
				if(!$scope.genRepoObj.result !='FAILURE'){	
					$scope.reportSelected = {"type":$scope.reportTypeOptions[0]};				
					bindVhrInfo(0);		
				}
			}
		});
		
	};
	
	
});