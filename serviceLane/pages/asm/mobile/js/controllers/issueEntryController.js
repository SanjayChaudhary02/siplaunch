asmControllers.controller('issueEntryController', function($scope, mainService, $filter, $location, $rootScope, $anchorScroll){
	
	var oldData = null;
	$scope.issueEntry = 
	{
		flatTireErr : false, data : '', showError : true, showissue : false, errormsg: false , deleteIssues: false, files : {} ,
		device : '' , tagChange : false
	}; 
	$scope.eachInAll = {open: false}
	$scope.issueEntry.submitted = false;
	if(windowsCheck)
	{
		$scope.issueEntry.device = "windows";
	}
	else if(/Android|webOS|IEMobile/i.test(navigator.userAgent))  {
		$scope.issueEntry.device = "android";
	}
	else if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
		$scope.issueEntry.device = "iOS";
	}
	else{
		$scope.issueEntry.device = "browser";
	}
	
	var NewIssueEntryInfo = function(auditName,vin,tag){
		$scope.isLoading.loadimage = true;
		$scope.showConcurrent();
		mainService.getNewIssueEntryData(auditName,vin,tag).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("error")){
				$scope.issueEntry.flatTireErr =true;
			}			
			else{
				$scope.issueEntry.flatTireErr =false;
				$scope.issueEntry.submitted = false;				
				oldData = angular.copy(data);				
				$scope.issueEntry.vehDet = data.vehicleDetails;
				if( $scope.issueEntry.vehDet.lastBuild != "")
				{
					$scope.issueEntry.vehDet.lastBuild = $filter('date')(new Date($scope.issueEntry.vehDet.lastBuild),"MM/dd/yyyy ");
				}
				$scope.issueEntry.issueDet = data.issueDetails;
				$scope.issueEntry.vehDet.showImg = false;
				angular.element("#farImage").val(null);
				angular.element("#closeImage").val(null);
				angular.element("#addnlImage").val(null);
				angular.element("#podVideo").val(null);
				$scope.issueEntry.files =  {};
				$scope.issueEntry.files.img1 = undefined;
				$scope.issueEntry.files.img2 = undefined;
				$scope.issueEntry.files.img3 = undefined;
				$scope.issueEntry.files.video = undefined;
				$scope.eachInAll.open = false;
				$scope.issueEntry.deleteIssues = false;
				$scope.issueEntry.tagChange = false;
				$scope.PODVar.issueId = "";
			}  
		});
	};
	var issueDetail = function(rating,type,servCat,section,subComp,cond){
		$scope.isLoading.loadimage = true;
		var temp =$scope.issueEntry.issueDet.desc;		
		var tempfar = $scope.issueEntry.issueDet.farAwaythumbNailImg;
		var tempclose = $scope.issueEntry.issueDet.closeUpThumbNailImg;
		var tempAdd = $scope.issueEntry.issueDet.addithumbNailImg;
		var tempVideo = $scope.issueEntry.issueDet.videothumbNailImg;
		mainService.getNewIssueDetailData(rating,type,servCat,section,subComp,cond).then(function(data) {	
			$scope.isLoading.loadimage = false;			
			if(data.hasOwnProperty("error")){
				$scope.issueEntry.flatTireErr =true;
			}			
			else{
				$scope.issueEntry.flatTireErr =false;				
				$scope.issueEntry.issueDet = data.issueDetails;
				$scope.issueEntry.issueDet.desc = temp;
				$scope.issueEntry.issueDet.farAwaythumbNailImg = tempfar;
				$scope.issueEntry.issueDet.closeUpThumbNailImg = tempclose;
				$scope.issueEntry.issueDet.addithumbNailImg = tempAdd;
				$scope.issueEntry.issueDet.videothumbNailImg = tempVideo;				
			}  
		});		
	};
	$scope.issueEntry.fileUpload = function(){	
		var extraData = {	"vehicleDetails":$scope.issueEntry.vehDet, "changeTag": $scope.issueEntry.tagChange ,
							"noIssues": $scope.issueEntry.showissue,"deleteIssues": $scope.issueEntry.deleteIssues ,
							"issueId" : $scope.PODVar.issueId,"issueDetails": $scope.issueEntry.issueDet,
							"auditName": $scope.PODVar.auditName
						};	
		if(($scope.issueEntry.vehDet.defvin != '' && $scope.issueEntry.vehDet.deftag !='' && $scope.issueEntry.vehDet.model != '' && $scope.issueEntry.vehDet.grade != '' && $scope.issueEntry.vehDet.color != '' && $scope.issueEntry.vehDet.body != '' && $scope.issueEntry.vehDet.engine != '' && $scope.issueEntry.vehDet.drivetrain != '' && $scope.issueEntry.vehDet.plant != '' && $scope.issueEntry.vehDet.lastBuild != '' ) && ((!$scope.issueEntry.showissue && $scope.issueEntry.issueDet.defrating !='' && $scope.issueEntry.issueDet.deftype !=''&& $scope.issueEntry.issueDet.defsvc !='' && $scope.issueEntry.issueDet.defsection !='' && $scope.issueEntry.issueDet.defsub !='' && $scope.issueEntry.issueDet.defcond !='' && $scope.issueEntry.issueDet.desc !='' && (($scope.issueEntry.files.img1 != undefined || $scope.issueEntry.issueDet.farAwaythumbNailImg != undefined) && ($scope.issueEntry.files.img2 != undefined || $scope.issueEntry.issueDet.closeUpThumbNailImg)) || $scope.issueEntry.showissue)))
		{
			if($scope.issueEntry.showissue == true)
			{
				extraData.issueDetails= '';			
			}									
			bindIssueEntryInfo(extraData,$scope.issueEntry.files);					
			$anchorScroll();						
		}
		else if(
			(($scope.issueEntry.vehDet.defvin == '' || $scope.issueEntry.vehDet.deftag == '')||
			(!$scope.issueEntry.showissue && ($scope.issueEntry.issueDet.defrating =='' || $scope.issueEntry.issueDet.deftype =='' ||  $scope.issueEntry.issueDet.defsvc =='' ||  $scope.issueEntry.issueDet.defsection =='' ||  $scope.issueEntry.issueDet.defsub =='' ||  $scope.issueEntry.issueDet.defcond =='' )))|| (($scope.issueEntry.vehDet.defvin == '' || $scope.issueEntry.vehDet.deftag =='') && $scope.issueEntry.showissue) ){
			$scope.issueEntry.submitted = true;			
			$scope.showPlatformAlert("Please fill all the mandatory fields which are highlighted before proceeding");
			//$scope.eachInAll.open = true;
			$anchorScroll();
		}
		else{			
			ConfMsg = "Some fields are not filled , Do you want to proceed ?";
			$scope.confirm.name = "fieldConfirm";
			if (ConfMsg && windowsCheck){		
				var windArrIssueEntry = ["navigatorconfirm",ConfMsg,"Issue Entry"];
				window.external.notify(JSON.stringify(windArrIssueEntry));			
				}
			else{
				if(ConfMsg && confirm(ConfMsg))
				{		
					$scope.fieldCancel();					
				}
				else{
					$scope.eachInAll.open = true;
					return false;		
				}				
			}
			
		}
	};
	$scope.fieldCancel = function(){
		var extraData = {	"vehicleDetails":$scope.issueEntry.vehDet,"changeTag": $scope.issueEntry.tagChange ,
							"noIssues": $scope.issueEntry.showissue,"deleteIssues": $scope.issueEntry.deleteIssues ,
							"issueId" : $scope.PODVar.issueId ,"issueDetails": $scope.issueEntry.issueDet,
							"auditName": $scope.PODVar.auditName
						};
		if($scope.issueEntry.showissue == true)
		{	extraData.issueDetails= '';	 }
		bindIssueEntryInfo(extraData,$scope.issueEntry.files);					
		$anchorScroll();	
	};
	/* thumbnail view function */
	$scope.viewOriginal = function(type,id){
		$scope.findsimilar.overlay = true;
		$scope.issueEntry.vehDet.showImg = true;
		$scope.issueEntry.vehDet.showImage = id;		
	};
	
	$scope.hideImages = function(){
		$scope.issueEntry.vehDet.showImg = false;
		$scope.issueEntry.vehDet.showImage = '';
	};
	
	$scope.liveImage = function() {
		var options = { limit:1 };
		$scope.showPlatformAlert("To open camera");
		//window.plugins.VINBarcodeScanner.scan($scope.scannerSuccess, $scope.scannerFailure);	
		//navigator.device.capture.captureImage($scope.onSuccess, $scope.onError, options);			
	};
	$scope.onSuccess = function(mediaFiles){
		/*var i, path, len;
		for(i=0,len=mediaFiles.length; i<len;i+=1)
		{
			path=mediaFiles[i].fullPath;				
		}*/
		$scope.showPlatformAlert("success");
	};
	$scope.onError = function(error)
	{
		$scope.showPlatformAlert('Error code: '+error.code, null, 'Capture Error');	
	};
	
	$scope.plantLine = function(){				
		if($scope.issueEntry.vehDet.plant.indexOf("TMMK") >= 0)
		{
			$scope.issueEntry.vehDet.line = ["1","2","3"];
		}
		else if($scope.issueEntry.vehDet.plant.indexOf("TMMI") >= 0)
		{
			$scope.issueEntry.vehDet.line = ["East","West"];
		}	
		else if($scope.issueEntry.vehDet.plant.indexOf("TMMC") >= 0)
		{
			$scope.issueEntry.vehDet.line = ["North","South","West"];
		}
		else
		{
			$scope.issueEntry.vehDet.line = "";
		}		
	};
	$scope.callVehDetails = function(vin,tag){
		//NewIssueEntryInfo($scope.PODVar.auditName,vin,tag);
		$scope.isLoading.loadimage = true;
		mainService.getNewIssueEntryData($scope.PODVar.auditName,vin,tag).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("error")){
				$scope.issueEntry.flatTireErr =true;
			}
			else if(data.hasOwnProperty("errorMessage")){
				$scope.showPlatformAlert(data.errorMessage);
				$scope.issueEntry.vehDet.deftag='';
			}			
			else{
				$scope.issueEntry.flatTireErr =false;
				//oldData = angular.copy(data);				
				$scope.issueEntry.vehDet = data.vehicleDetails;
				if( $scope.issueEntry.vehDet.lastBuild != "")
				{
					$scope.issueEntry.vehDet.lastBuild = $filter('date')(new Date($scope.issueEntry.vehDet.lastBuild),"MM/dd/yyyy ");
				}
				if($scope.issueEntry.vehDet.plant.indexOf("TMMK") >= 0)
				{
					$scope.issueEntry.vehDet.line = ["1","2","3"];
				}
				else if($scope.issueEntry.vehDet.plant.indexOf("TMMI") >= 0)
				{
					$scope.issueEntry.vehDet.line = ["East","West"];
				}	
				else if($scope.issueEntry.vehDet.plant.indexOf("TMMC") >= 0)
				{
					$scope.issueEntry.vehDet.line = ["North","South","West"];
				}
				else
				{
					$scope.issueEntry.vehDet.line = "";
				}		
				$scope.issueEntry.issueDet = data.issueDetails;	
				angular.element("#farImage").val(null);
				angular.element("#closeImage").val(null);
				angular.element("#addnlImage").val(null);
				angular.element("#podVideo").val(null);
				$scope.issueEntry.files =  {};
			}  
		});
	};
	$scope.callIssueDetails = function(rating,svCtg,sec,subComp,Cond){
		issueDetail(rating,svCtg,sec,subComp,Cond);
	}
	$scope.backToList = function(){
		$scope.showAuditAssistant('issueList');
	};
	$scope.findSimilarIssues = function(svCtg,sec,subComp,Cond){
		$scope.isLoading.loadimage = true;
		mainService.getSimilarIssueData($scope.PODVar.auditName,svCtg,sec,subComp,Cond,$scope.PODVar.issueId).then(function(data) {	
			$scope.isLoading.loadimage = false;
			$scope.findsimilar.overlay = true;
			$scope.findsimilar.issuePopup = true;
			if(data.hasOwnProperty("error")){				
				$scope.findsimilar.flatTireErr =true;
			}
			else if(data.hasOwnProperty("errormsg")){				
				$scope.findsimilar.flatTireErr =false;
				$scope.issueEntry.errormsg = true;
				$scope.findsimilar.data = data;
			}
			else{
				$scope.findsimilar.flatTireErr =false;
				$scope.issueEntry.errormsg = false;
				$scope.findsimilar.data = data.similarIssues;
			}  
		});
	};	
	$scope.similarIssue = function(val){
		$scope.issueEntry.issueDet.desc = val.desc;
		issueDetail(val.rating,$scope.issueEntry.issueDet.deftype,val.svc.key,val.section.key,val.subComp.key,val.condition.key);
	};
	var bindIssueEntryInfo = function(fields,files){
		$scope.isLoading.loadimage = true;
		mainService.getIssueEntryData(fields,files).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("error")){
				$scope.showPlatformAlert(data.error);
			}
			else if(data.hasOwnProperty("issueMessage"))
			{
				ConfMsg = data.issueMessage;
				$scope.confirm.name = "noIssues";
				if (ConfMsg && windowsCheck){		
					var windArrIssueEntry = ["navigatorconfirm",ConfMsg,"Issue Entry"];
					window.external.notify(JSON.stringify(windArrIssueEntry));			
					}
				else{
						if(ConfMsg && confirm(ConfMsg))
						{	
							$scope.noIssueConfirm();
						}
						else
						{
							$scope.issueEntry.deleteIssues = false;
							return false;		
						}				
					}			
			}
			else if(data.hasOwnProperty("tagMessage"))
			{
				ConfMsg = data.tagMessage;
				$scope.confirm.name = "tagChange";
				if (ConfMsg && windowsCheck){		
					var windArrIssueEntry = ["navigatorconfirm",ConfMsg,"Issue Entry"];
					window.external.notify(JSON.stringify(windArrIssueEntry));			
					}
				else{
						if(ConfMsg && confirm(ConfMsg))
						{	
							$scope.tagChangeConfirm();
						}
						else
						{
							$scope.issueEntry.tagChange = false;
							return false;		
						}				
					}			
			}
			else{
				if($scope.selectedLeftTopMenu == 'issueEntry')
				{
					NewIssueEntryInfo($scope.PODVar.auditName);					
				}
				else if($scope.selectedLeftTopMenu == 'editEntry' && !$scope.issueEntry.showissue)
				{
					$scope.editEntryInfo($scope.PODVar.auditName,$scope.issueEntry.vehDet.defvin,$scope.PODVar.issueId);
				}
				else{
					$scope.backToList();
				}
				$scope.showPlatformAlert(data.errormessage);
				$scope.issueEntry.submitted = false;
				$scope.issueEntry.showissue = false;
				angular.element("#farImage").val(null);
				angular.element("#closeImage").val(null);
				angular.element("#addnlImage").val(null);
				angular.element("#podVideo").val(null);
				$scope.issueEntry.files.img1 = undefined;
				$scope.issueEntry.files.img2 = undefined;
				$scope.issueEntry.files.img3 = undefined;
				$scope.issueEntry.files.video = undefined;
			}
	  
		});
    };
	$scope.noIssueConfirm = function(){
		$scope.issueEntry.deleteIssues = true;
		$scope.fieldCancel();
	};
	$scope.tagChangeConfirm = function(){
		$scope.issueEntry.tagChange = true;
		$scope.fieldCancel();
	};
	$scope.removeImg = function(id)
	{
		angular.element(id).val(null);
	};
	$scope.issueEntryCancel = function(){
		ConfMsg = "Are you sure to cancel, click OK to proceed or cancel";
		$scope.confirm.name = "cancelConfirm";
		if (ConfMsg && windowsCheck){		
			var windArrIssueEntry = ["navigatorconfirm",ConfMsg,"Issue Entry"];
			window.external.notify(JSON.stringify(windArrIssueEntry));			
			}
			else{
				if(ConfMsg && confirm(ConfMsg))
				{		
					$scope.issueCancelConfirm();
				}
				else{
					return false;		
				}				
			} 		
		}
	$scope.issueCancelConfirm = function(){
		data = angular.copy(oldData);				
					$scope.issueEntry.vehDet = data.vehicleDetails;
					$scope.issueEntry.issueDet = data.issueDetails;									
					$scope.issueEntry.showissue = false;
					angular.element("#farImage").val(null);
					angular.element("#closeImage").val(null);
					angular.element("#addnlImage").val(null);
					angular.element("#podVideo").val(null);
					$scope.issueEntry.submitted = false;
					$scope.issueEntry.files =  {};
					if($scope.auditValue !='' && $scope.selectedLeftTopMenu == 'issueEntry')
					{
						NewIssueEntryInfo($scope.PODVar.auditName,'');						
					}
					else if($scope.auditValue !='' && $scope.selectedLeftTopMenu == 'editEntry')
					{
						$scope.editEntryInfo($scope.PODVar.auditName,$scope.PODVar.vin,$scope.PODVar.issueId);
					}		
	};	
	$scope.issueEntryDelete = function(){
		ConfMsg = "Are you sure to delete the issue Y/N ?";
		$scope.confirm.name = "deleteConfirm";
		if (ConfMsg && windowsCheck){		
			var windArrIssueEntry = ["navigatorconfirm",ConfMsg,"Issue Entry"];
			window.external.notify(JSON.stringify(windArrIssueEntry));			
		}
		else{
			if(ConfMsg && confirm(ConfMsg)){		
				$scope.issueDeleteConfirm();
			}
			else{
				return false;		
			}				
		} 		
	};
	$scope.issueDeleteConfirm = function(){
		var fieldvalues = {"issueId" : $scope.PODVar.issueId };	
		issueDelete(fieldvalues);					
		$scope.PODVar.issueId='';
	};
		
	$scope.editEntryInfo = function(auditName,vin,id){
		$scope.isLoading.loadimage = true;
		$scope.showConcurrent();		
		mainService.getEditIssueEntryData(auditName,vin,id).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("error")){
				$scope.issueEntry.flatTireErr =true;
			}			
			else {
				$scope.issueEntry.flatTireErr =false;
				oldData = angular.copy(data);				
				$scope.issueEntry.vehDet = data.vehicleDetails;
				if( $scope.issueEntry.vehDet.lastBuild != "")
				{
					$scope.issueEntry.vehDet.lastBuild = $filter('date')(new Date($scope.issueEntry.vehDet.lastBuild),"MM/dd/yyyy ");
				}
				$scope.issueEntry.issueDet = data.issueDetails;				
			}			
		});
	};
	
	var issueDelete = function(id){
		$scope.isLoading.loadimage = true;
		mainService.getDeleteIssue(id).then(function(data) {	
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty("errormessage")){
				$scope.showPlatformAlert(data.errormessage);	
				$scope.backToList();				
			}	   
			else{
				$scope.showPlatformAlert(data.error);
			}
		});
    };
	
	if($scope.PODVar.auditName)
	{
		if($scope.selectedLeftTopMenu == 'issueEntry')
		{
			NewIssueEntryInfo($scope.PODVar.auditName,$scope.auditValue);
		}
		else{
			$scope.editEntryInfo($scope.PODVar.auditName,$scope.PODVar.vin,$scope.PODVar.issueId);
		}
	}
	$scope.$on('tagChangeCall',function(){
		$scope.tagChangeConfirm();
	});
	$scope.$on('noIssueCall',function(){
		$scope.noIssueConfirm();
	});
	$scope.$on('fieldCancelCall',function(){
		$scope.fieldCancel();
	});
	$scope.$on('issueCancelCall',function(){
		$scope.issueCancelConfirm();
	});
	$scope.$on('issueDeleteCall',function(){
		$scope.issueDeleteConfirm();
	});
	$scope.$on('bindIssueEntryInfo', function(event,pass) {	
		NewIssueEntryInfo($scope.PODVar.auditName,$scope.auditValue);			
	});	
	
});

