asmControllers.controller('auditSetupController', function($scope, $filter, mainService, $location, $rootScope, $anchorScroll){	
	
	$scope.auditSetup = {flatTireErr : false, data : '', showMessage : false, auditName : '' , description : ''};
	var bindAuditSetupInfo = function(){
		$scope.isLoading.loadimage = true; 
		$scope.showConcurrent();                     
        mainService.getAuditSetupData().then(function(data) {
			    $scope.isLoading.loadimage = false;
                if(data.hasOwnProperty("error")){
                    $scope.auditSetup.flatTireErr =true;
				}
                else{
					$scope.auditSetup.showMessage = false;
					$scope.auditSetup.data = data;
					$scope.auditSetup.auditDate = $filter('date')(new Date(),"MM/dd/yyyy hh:mm a");
					$scope.auditSetup.auditName = $scope.auditSetup.description = '';
				}                               
		});
    };
	
	$scope.auditSave = function()
	{
		if( $scope.auditSetup.description == '' || $scope.auditSetup.auditDate ==''	) {
			$scope.auditSetup.showMessage=true;			
		}
		else{			
			var fieldvalues = {auditName:$scope.auditSetup.auditName,auditLead: $scope.auditSetup.data.defAuditLead , location: $scope.auditSetup.data.defAuditLocation , date: $scope.auditSetup.auditDate , auditType: $scope.auditSetup.data.defAuditType ,description : $scope.auditSetup.description };			
			bindAuditSetup(fieldvalues);
			$scope.auditSetup.showMessage = false;
		}		
	};
	
	var bindAuditSetup = function(auditSetup){
		$scope.isLoading.loadimage = true;
		mainService.getAuditSetup(auditSetup).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("successMessage")){
				$scope.showPlatformAlert(data.successMessage);
				$scope.auditSetup.auditName = data.auditName;
				mainService.getDivision().then(function(udata) {
					$scope.userDivisionData.auditNames = udata.auditNames;	
				});	
				//bindAuditSetupInfo();				
			}	   
			else{
				$scope.showPlatformAlert(data.error);
				$scope.auditSetup.auditName = data.auditName;
			}
		});
    };
	
	$scope.auditCancel = function(){
		ConfMsg = "Are you sure to cancel, click OK to proceed or cancel";
		$scope.confirm.name = "auditConfirm";
		if (ConfMsg && windowsCheck){			
			var windArrAudit = ["navigatorconfirm",ConfMsg,"Audit Setup"];
			window.external.notify(JSON.stringify(windArrAudit));			
		}
		else{	
				if(ConfMsg && confirm(ConfMsg))
				{	
					$scope.confirmSucess();
				}
				else{
					return false;		
				}				
			} 		
	};
	
	bindAuditSetupInfo(); 
	$scope.confirmSucess = function(){
		$scope.auditSetup.showMessage=false;					
		$scope.auditSetup.auditName = $scope.auditSetup.description = $scope.auditSetup.auditDate = '';
		angular.element("#input1").val(null);
		bindAuditSetupInfo();		
	};
	$scope.$on('auditConfirmSucess',function(){
		$scope.confirmSucess();
	});
	$scope.$on('bindAuditSetupInfo', function(event,pass) {		
		bindAuditSetupInfo(); 
	});
	
});

