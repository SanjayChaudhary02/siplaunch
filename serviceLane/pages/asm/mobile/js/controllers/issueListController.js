asmControllers.controller('issueListController', function($scope, mainService, $location, $rootScope, $anchorScroll){
	
	var bindIssueListInfo = function(auditName){	
		$scope.isLoading.loadimage = true;
		$scope.issueList ={data:'',flatTireErr:false , message: false}
		$scope.showConcurrent();					                         
        mainService.getIssueListData(auditName).then(function(data)
		{
            $scope.isLoading.loadimage = false;
			$scope.issueList.data =data; 
			if(data.hasOwnProperty("error")){
                $scope.issueList.flatTireErr =true;
            }
			else if(data.hasOwnProperty("errormsg")){               
				$scope.issueList.message = true;
            }
            else{		
				$scope.issueList.message = false;
            }
		});
     };
	$scope.callEditEntry = function(vin,id){
		$scope.showAuditAssistant('editEntry',undefined,vin,id);		
	}
	/*$scope. issueList.editList = function(type,servCat,sec,subComp,cond,desc){
		$scope.pageName = onePath;
        $scope.selectedLeftTopMenu = onePath;
        $location.path(onePath);
		$scope.isLoading.loadimage = true;
		bindIssueEntryInfo(type,servCat,sec,subComp,cond,desc);
	}*/
	
	if($scope.PODVar.auditName)
	{
		bindIssueListInfo($scope.PODVar.auditName);
	}	
	$scope.$on('bindIssueListInfo', function(event,pass) {		
		bindIssueListInfo($scope.PODVar.auditName);
	});
	
});