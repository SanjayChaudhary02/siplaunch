// TODO : place all the controllers in different files
asmControllers.controller('indexController', function($scope, $http, mainService, $location, $rootScope, $timeout,$anchorScroll,$window,$attrs,$sce ){
	/*$scope.errorData = {content :true, showMsgBox : true, msg : "", msgType : "Error", msgSubType : "ABC" };
	var showErrorMsg = function(passedData){
		$scope.errorData.content = passedData.content;		
		//TODO: msg type
	}	
	$scope.$on('showErrorMsg', function(e, passedData) { showErrorMsg(passedData); });*/
	$scope.isIpad = false;
	if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
		$scope.isIpad = true;
	}
	$scope.isLoading = {loadimage:false};
	$scope.dataMileage = { mileage : "",subVal:""};
	$scope.printObj = {data:"",custDDShow: ""};
	$scope.isLoading = {loadimage: false};
	$scope.footerDate = new Date();
	//$scope.oldVinAndMenu = {'vin':'','menu':''};
	//$scope.currentPage = {tab:"current"};
	$scope.thirdParty = {val: false}
	$scope.lps = {flatTireErr : false,lpsCurrentErr: false,lpsPendingErr: false,authCodeAvailable: null,cbtn: false,selectedDetail:[],currentPage: "current",CurrentPopup: false,lpsUpadte: true};
	$scope.acknowledgement = false;	
	$scope.nextServiceApt = {overlay:false , aptPopup: false, flatTireErr: false , data:'' , submitted: false, custDDShow: ''};
	$scope.update = function(inputValue){
		$scope.master = angular.copy(inputValue);
	};
	$scope.reset = function(){
		$scope.inputValue = angular.copy($scope.master);
	};
	$scope.smData={smInfo:"",showSMGrid: false,smgridObj:"",eyeNoteShow: ""};
	$scope.kcData={kcInfo:"" };
	$scope.lsData={lsInfo:"" };
	//$scope.isLoader = false;
	$scope.authCodeErr = true;	
	$scope.genErr = true;		
	$scope.thirdParty.val = false;
	$scope.selectedLeftTopMenu = 'vov';
	$scope.showSuggestion = false;
	$scope.showEmailError = false;
	$scope.vAlert = false;
	$rootScope.showInfo = true;
	$rootScope.content = true;		
	$scope.notAvailable = "N/A";
	$scope.showMsg = false;
	$rootScope.showData = false;
	$scope.showError = false;
	$scope.isUserBlocked = false;
	$scope.salvage = { isSalvage: false, showSalvage: false, showSalvageError : false, data : '' , userAgreed : false};
	$scope.leftMenu = false;
	$scope.extendLeftMenu = {show: false, data: {},scroll: false};		
	$scope.history = false; 
	$rootScope.campaign = false;
	$rootScope.servicehistoryiconflag = false;
	$rootScope.customersurveyiconflag = false;
	$rootScope.telematicsIconflag = false;
	$rootScope.roadSideIconflag = false;
	$rootScope.vehispec = false;
	$rootScope.dtcInfo = false;
	$scope.vinIcon = false;
	$rootScope.care = false;
	$rootScope.vhr = false;
	$scope.footerLegal = false;
	$scope.campTechnician={show: false,techFlatTireError: false, errMsg: false, data: {}};
	$scope.footerFeedback = false;
	$scope.telematicsAccountDetails = false;
	$scope.serviceConnectAlerts = false;
	$scope.houseHoldDatas = '';
	$scope.startFade = false;
	$scope.stopFade = false;
	$scope.vehOneLiner = '';
	$rootScope.campaignDoc = false;
	$scope.showVheader = false;
	$rootScope.defaultMessage = true;
	$rootScope.isServiceCallMade = false;
	$scope.rightNavMenu =''
	//console.log("init");
	$scope.hideCareTab = false;
	$scope.menu = false;
	$scope.pageName = 'VEHICLE ONE-VIEW';
	$scope.tcmcDisclaimer = false;
	$scope.isFiltered= false;
	$scope.showSpinner = false;
	$scope.userSelection = false;
	$scope.userSelecionErr = false;
	$scope.announcementsObj = {};
	$scope.DMY = {};
	$scope.auditValue = '';
	$scope.confirm = { name : ""};
	$scope.findsimilar = {overlay:false , issuePopup: false, flatTireErr: false , data:''}
	$scope.DMY.selDMYType='';
	$location.path('/')
	$scope.curtTargetMenu = function(){
		var mdata = {activeMenu: 'vinInfo'}
	};	
	$scope.vinValReturn = function(num) {
		$scope.selectedLeftTopMenu = 'vov';
		$scope.pageName = 'VEHICLE ONE-VIEW';
		$scope.tcmcDisclaimer = false;
		$scope.inputValue = $scope.posts[num].name; 
		$scope.DMY.selDivi = 'VIN';
		$scope.callDMYAndVIN($scope.inputValue,true);
		$scope.history = false;
		$scope.vinIcon = false;
		
	};
	
	// concurrent Login implementation
	$scope.showConcurrent = function(){
		mainService.getConcurrent().then(function(udata) {
			if(udata.indexOf("Concurrent") != -1){
				window.location.href="/t3Portal/resources/jsp/concurrentLoginFailure.html";
			}
		});	
	};
	$scope.showConcurrent();
	//announcements shadow  pop up.
	$scope.showAnnouncementsPopupInfo = function() { 
		$scope.rightNavOverlay = true;			
		$scope.menu = false;
		$scope.rightNavMenu ='';
		angular.element('body').css('overflow-y','hidden');
		$scope.annoucementsInfo = true;
		//$scope.errorMsgToDisplay = '';
	};
 
	//announcement pop up.
	$scope.showAnnouncementsInfo = function(moreflag,scrollTopToYes,act) { 
		$scope.announcementsErr = false;
		$scope.isLoading.loadimage = true;	
			 mainService.getAnnouncementsData(moreflag).then(function(data) {
				 $scope.isLoading.loadimage = false;					 
				 $scope.isLoading.loadimage = false;
				 $scope.rightNavMenu ='';
				 $scope.rightNavMenu = act;
				if(data.hasOwnProperty('error')){
					$scope.announcementsErr = true;	
				}
				else{
					$scope.announcementsObj = data;
					if(scrollTopToYes == 1)
					{
						//angular.element('.announcementsdiv')[0].scrollTop = 0;

					}
						
				}
			}); 	


	};
	 //quick links pop up.
	$scope.showQuickLinksInfo = function(moreflag,scrollTopToYes,act) { 
		$scope.quickLinksErr = false;
		$scope.isLoading.loadimage = true;	
			 mainService.getQuickLinksData(moreflag).then(function(data) {
				 $scope.isLoading.loadimage = false;
				 $scope.rightNavMenu ='';
				 $scope.rightNavMenu = act;
				if(data.hasOwnProperty('error')){
					$scope.quickLinksErr = true;	
				}
				else{
					$scope.quickLinksObj = data;
					if(scrollTopToYes == 1)
					{
						//angular.element('.quickLinksdiv')[0].scrollTop = 0;
					}
						
				}
			}); 
	};
	 //house hold pop up.
	$scope.showHouseHoldInfo = function(moreflag,serviceCallOk,scrollTopToYes) { 
		$scope.isLoading.loadimage = true;	
		$scope.rightNavOverlay = true;			
		$scope.menu = false;
		$scope.rightNavMenu ='';
		angular.element('body').css('overflow-y','hidden');
		$scope.houseHoldFlatTire = false;
		$scope.houseHoldInfo = true;
		$scope.errorMsgToDisplay = '';
		if(moreflag == 'MORE' && serviceCallOk == 1)
			angular.element('#currentplus').html('');
		if(moreflag == 'MORE' && serviceCallOk == 2)
			angular.element('#disposedplus').html('');
		if(serviceCallOk){
			 mainService.getHouseHoldData(moreflag).then(function(data) {
				 $scope.isLoading.loadimage = false;	
				if(data.hasOwnProperty('error')){
					$scope.houseHoldFlatTire = true;	
				}
				else{
					$scope.houseHoldDatas = data;
					
					if(moreflag == 'INITIAL' && data.totalCurrentVeh == 10 && serviceCallOk == 1)
						angular.element('#currentplus').html('+');
					if(moreflag == 'INITIAL' && data.TotalDisposedVeh == 10 && serviceCallOk == 2)
						angular.element('#disposedplus').html('+');
					if(serviceCallOk == 1)
						{
						$scope.currentHouseTab = true;
						}
						
					else{
						$scope.currentHouseTab = false;
					}
					if(scrollTopToYes == 1)
					{
						setTimeout(function(){ if(data.totalCurrentVeh >0 ) angular.element('.currentContainer')[0].scrollTop = 0; }, 0.10);
						if($scope.personDetailsForFeedback.dealerCode == 'N/A' && data.TotalDisposedVeh > 0)
							angular.element('.disposedContainer')[0].scrollTop = 0;
					}
						
				}
			}); 	
		}

	};
     	
	$scope.showTelematicsAccountDetails = function(evt,custId,contractId,telematicsSystem) { 
		angular.element('body').css('overflow-y','hidden');
		$scope.isLoading.loadimage = true;
		$scope.showDiagnostics = false;
		$scope.showRemote = false;
		$scope.teleAccountFlatTire = false;
		$scope.addressDisplay = '';
			mainService.getTelematicsAccoundDetailsData(custId,contractId).then(function(data) {
				$scope.isLoading.loadimage = false;
				if(data.hasOwnProperty('error')){
					$scope.teleAccountFlatTire = true;	
				}
				else {
					$scope.teleAccountFlatTire = false;
					$scope.teleAccoundDetailsData = data;
					if(data.data.showAddrSection){
						var addarr = [];
						if(data.data.custDetailsVO.addressLine1 != 'N/A' && data.data.custDetailsVO.addressLine1 != '')
							addarr.push(data.data.custDetailsVO.addressLine1);
						if(data.data.custDetailsVO.addressLine2 != 'N/A' && data.data.custDetailsVO.addressLine2 != '')
							addarr.push(data.data.custDetailsVO.addressLine2);
						if(data.data.custDetailsVO.addressLine3 != 'N/A' && data.data.custDetailsVO.addressLine3 != '')
							addarr.push(data.data.custDetailsVO.addressLine3);
						$scope.addressDisplay = addarr.join(',');
					}
					$scope.boxTableCount = 1;
					if(!angular.equals({}, data.data.enformDiagnosticDetailsVO)  && (telematicsSystem.indexOf("Safety") != -1))
						{
							$scope.showDiagnostics = true;
							$scope.boxTableCount++;
						}
						
					if(!angular.equals({}, data.data.enformRemoteDetailsVO)  && (telematicsSystem.indexOf("Safety") != -1))
						{
							$scope.showRemote = true;
							$scope.boxTableCount++;
						}
				}
				$scope.telematicsAccountDetails = true;
			});
	};
	$scope.showServiceConnectAlert = function(evt) { 
		$scope.isLoading.loadimage = true;
		$scope.oneviewrestMenu(true);
		$scope.serviceConnectAlertFlatTire = false;	
		$scope.reduceBoxHeight = false;
		angular.element('body').css('overflow-y','hidden');
		mainService.getServiceConnectAlertData().then(function(data) {
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty('error')){
				$scope.serviceConnectAlertFlatTire = true;	
			}
			else {
			$scope.serviceConnectAlertsDatas = data.data;
			$scope.totalEdCount = $scope.serviceConnectAlertsDatas.indicatorCount + $scope.serviceConnectAlertsDatas.warningsCount ;
			$scope.serviceConnectAlerts = true;
			if(!data.data.showWarningList && !data.data.showIndicator)
			$scope.reduceBoxHeight = true;
			}
		});
		angular.element(".vAlertArrow").css("left",evt.clientX+"px");
		//$scope.serviceConnectAlerts = true;       
	};
	/*$scope.showLegal = function(){$scope.footerLegal = true;}*/
        
	$scope.showFeedback = function(){
		 jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
		$scope.footerFeedback = true;
		angular.element('#contactemailfeedback').val($scope.personDetailsForFeedback.emailAddress);
		angular.element('#contacttel').val($scope.personDetailsForFeedback.phoneNumber);
		$scope.showSuggestion = false;
		$scope.showEmailError = false;
		angular.element("body").css("overflow-y","hidden");
	};
	
	$scope.overlayShow = function(flag) {
		angular.element(".customersurveypage .panel-default > .panel-heading").css('display','inline-table');	
				$scope.history = false;
				$scope.vAlert = false;
				$scope.vinIcon = false;
				$scope.dealPopUp = false;
				$scope.subPopUp = false;
				$rootScope.campaignDoc = false;
				$scope.footerLegal = false;
				if(!flag){
					$scope.footerFeedback = false;
					$scope.findsimilar.overlay = false;
					$scope.findsimilar.issuePopup = false;
					}
				$scope.nextServiceApt.overlay = false;$scope.nextServiceApt.issuePopup = false;
				$scope.telematicsAccountDetails = false;
				$scope.houseHoldInfo = false;
				$scope.annoucementsInfo = false;
				$scope.serviceConnectAlerts = false;
				$scope.salvage.showSalvage = false;				
				$scope.userSelection = false;
				$rootScope.lpsAuthCodeObj = null;
				$rootScope.lpsActivePopUp = '';
				$rootScope.authCodeSelection = false;
				$scope.acknowledgement = false;
				$scope.resendErr = false;					
				$scope.authCodeErr = true;
				$scope.rightNavMenu ='';
				$scope.houseHoldDatas = '';
				$scope.showPrintView = false;
				$scope.reprogView = false;
				$scope.campTechnician.show = false;
				$scope.showPrintPreview = false;
				if(window.innerWidth >= 811 && window.innerWidth <= 992)
					angular.element(".adjPortrait").css({'z-index':'8','overflow-y':'auto'});
				else
					angular.element(".adjPortrait").css({'z-index':'8','overflow-y':'hidden'});
				if(flag){
					
					if (windowsCheck){
						var windArrFeed = ["navigatorconfirm","Cancel your feedback?",""];
								window.external.notify(JSON.stringify(windArrFeed));
								
						}
						else{
							if(confirm("Cancel your feedback?"))
							{
								$scope.footerFeedback = false;
							}
							else
							{
								$scope.footerFeedback = true;
								return false;
							}	
						}
					

				}
				angular.element("body").css("overflow-y","auto");					
	};
       	  		
	//$scope.rightNavOverlay = false;
	$scope.showRightNavInfo = function(act){
		var vin = document.getElementById("vinno").value;
	var isValid = $scope.is_valid_vin(vin);	
		//angular.element('#mileageFormtext').val(parseInt($scope.dataMileage.subVal));
		if(act != 'announcements' && act != 'quicklinks'){
		$scope.rightNavMenu ='';
		$scope.rightNavMenu = act;	
		}
		$scope.rightNavOverlay = true;
		if(act == 'custInfoForm'){ 
			$scope.customerInfoErr = false;
			$scope.customerInfoVal = false;
			mainService.getCustomerInfoData().then(function(data){
				if(data.hasOwnProperty('error'))
					$scope.customerInfoErr = true;
				else{
					$scope.custInfoData = data;
					if(data.customerInfo.length){
						for(var j=0;j<data.customerInfo.length;j++){
							if(data.customerInfo[j].selected)
								$scope.ownerDriver = data.customerInfo[j];
						}
					}
					if(data.customerInfo !="N/A")
						$scope.customerInfoVal = true;
				}
			});
		}
		if(act == 'aboutApp'){
			$scope.aboutErr = false;
			mainService.getAboutData().then(function(data) {
				if(data.hasOwnProperty('error')){
					$scope.aboutErr = true;
				}else	
					$scope.aboutObj = data;
			});				
		}
		if(act == 'announcements'){
			$scope.showAnnouncementsInfo("all",1,act);	
		}
		if(act == 'quicklinks'){
			$scope.showQuickLinksInfo("all",1,act);	
		}
		if(act == 'householdinfo'){
		if (isValid){
			 $scope.showHouseHoldInfo("INITIAL",1,0);		
			 }else{
				$scope.showError = true;
				return false
			 }
		}
	};
	$scope.overlayHide = function(){	
		$scope.rightNavOverlay = false;			
		$scope.menu = false;
		$scope.rightNavMenu ='';
		$scope.dataMileage.mileage = $scope.dataMileage.subVal;
		$scope.smData.custDDShow = '';
		$scope.nextServiceApt.custDDShow = '';
		$scope.printObj.custDDShow = false;
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
			var inputvinno234 = document.querySelector('#mileageFormtext');
			inputvinno234.blur();
		}
		$timeout(function(){
			$scope.smData.eyeNoteShow = '';
		}, 100); 
		
	};
	$scope.resetMileage = function(){
				$scope.rightNavOverlay = true;
				$scope.dataMileage.mileage = "";
				angular.element('#mileageFormtext').focus();
			};
	$scope.showRemotehealthData = function(){		
		$scope.$broadcast('bindRemotehealthData');
	}
	$scope.PODapp = function(){		
		if($scope.confirm.name == "auditConfirm"){
			$scope.$broadcast('auditConfirmSucess');
		}
		else if($scope.confirm.name == "deleteConfirm"){
			$scope.$broadcast('issueDeleteCall');
		}
		else if($scope.confirm.name == "cancelConfirm"){
			$scope.$broadcast('issueCancelCall');
		}		
		else if($scope.confirm.name == "tagChange"){
			$scope.$broadcast('tagChangeCall');
		}
		else if($scope.confirm.name == "fieldConfirm"){
			$scope.$broadcast('fieldCancelCall');
		}
		else if($scope.confirm.name == "noIssues"){
			$scope.$broadcast('noIssueCall');
		}
	};
		
	$scope.mileageSubmit = function(mVal){
		if(!$scope.dataMileage.mileage && !$scope.dataMileage.subVal){
			$scope.dataMileage.mileage = "";
			$scope.dataMileage.subVal = 0;
		}
		else{
				$scope.rightNavOverlay = false;
				if( $scope.dataMileage.mileage == '' || $scope.dataMileage.mileage == null){
						$scope.showPlatformAlert("Please enter a valid mileage value");
						$scope.rightNavOverlay = true;
					}
				else{
					$scope.rightNavMenu ='';
					$scope.dataMileage.subVal = $scope.dataMileage.mileage;
					mainService.setMileageFormData($scope.dataMileage.subVal).then(function(data) {
						if($location.path() == '/warranty')
							$scope.$broadcast('bindWarInfo', { isRefresh : true});
						if($location.path() == '/product')
							$scope.$broadcast('bindProductInfo');
						if($location.path() == '/roadside')
							$scope.$broadcast('bindRoadSideAssistance');
					});
				}
		}
	}
	$scope.showHistory = function(val,idx,clr) {		
		$scope.isLoading.loadimage = true;	
		$scope.sortVal = '', $scope.sortByCol = '';
		$scope.showTableError = false;
		
		var hUrl='';
		if(clr == 'sort'){
			hUrl = '/serviceLane/mobile/applySorting?sortByColumn='+val;
		}		
		else
			hUrl = val;
		//$http.get(hUrl).success(function(data, status, headers, config) {	
		mainService.getVinHistory($scope.inputValue, hUrl).then(function(data) {
			$scope.isLoading.loadimage = false;	
			if(data.hasOwnProperty("error")) {
					$rootScope.content = true;
					$rootScope.showInfo = true;
					if($scope.isUserBlocked)
						$scope.vinHthreshold = true; 
					$rootScope.sysError = true;
					$rootScope.defaultMessage = false;
					
			}else{
			
				if( clr != 'clear'){
					$scope.posts = data.VinHistory;
					$scope.vinPos = '';
					$scope.vinHistoryData = [];
					var headerMap = {'VIN':'vinNumber','Model':'modelName','Year':'modelYear','Exterior Color':'exteriorColor','Drive Type':'driveType','Engine Family':'engineFamily','Fuel':'fuelType','Model#':'modelNumber','Source':'source','Time':'lastSearchedTime','Transmission':'transmission'};
					$scope.setting = data.VinHistorySettings.columnVO.sort(function(a,b){
						return a.fieldOrder - b.fieldOrder ;
					});
					for(var x=0;x<$scope.setting.length;x++){						
						$scope.setting[x]["fieldColumn"] = headerMap[$scope.setting[x].fieldName];						
					}
					for(var i=0;i<data.VinHistory.length;i++){
						var sortedVal=[];						
						for(var j in $scope.setting){							
							sortedVal.push(data.VinHistory[i].value[$scope.setting[j].fieldColumn]);
						}
						$scope.vinHistoryData.push(sortedVal);
						
					}
					if($scope.posts.length == 0){
						$scope.showTableError = true;
					}
					else{
						$scope.showTableError = false;
					}				
					$scope.sortValue = data.VinHistorySettings.sortAscending;
					$scope.sortByCol = data.VinHistorySettings.sortByColumn; 
				}	
				if (idx){
					$scope.history = !$scope.history;
					 $scope.vinIcon = !$scope.vinIcon;
				}
			}		
			
				
		});
	
	};  
	$scope.showAlert = function(evt) { 
		$scope.isLoading.loadimage = true;
		$scope.oneviewrestMenu(true);
		angular.element('body').css('overflow-y','hidden');
		angular.element(".vAlertArrow").css("left",evt.clientX+"px");
		mainService.getVehicleAlertData($scope.inputValue).then(function(data) {
			$scope.isLoading.loadimage = false;
			$scope.vAlertData = data.VehicleAlertsJson;
			$scope.vAlert  = !$scope.vAlert;
		});        
    }
    $scope.displayTcuvpopup = function(dealernum) { 
		$scope.dealerCodeTcuv = dealernum;	
		$scope.dealPopUp = true;
		mainService.getDealerCodeData($scope.dealerCodeTcuv).then(function(ddata) {
			$scope.setTcuvFlag = true;
			$scope.dealerD = ddata;

		});        
    }
   	$scope.displaySubcriberPopup = function(subnum) { 		
		$scope.dealPopUp = true;
		//$scope.subPopUp = true;
		mainService.getSubscriberInfo(subnum).then(function(data) {			
			$scope.subscriberObj = data;
			$scope.subscriperErr = false;
			if(data.hasOwnProperty('error'))
				$scope.subscriperErr = true;
			
		});        
	}
	$scope.displayTroubleCodepopup = function(troubeCodeType,troubeValue) { 
		$scope.troubeCodeKey = troubeCodeType;
		$scope.troubeCodeValue = troubeValue;		
		$scope.dealPopUp = true;
		mainService.getTroubleCodeData($scope.troubeCodeKey,$scope.troubeCodeValue).then(function(troubledata) {
			$scope.setTroubleFlag = true;
			$scope.troubleD = troubledata;

		});       
    };
	$scope.validateVin = function(evt,iVin){
		if(evt.which === 13 || !iVin)
			     angular.element("#goBtn").attr("disabled",true);
			else
			     angular.element("#goBtn").attr("disabled",false);
			if(!iVin){
				$scope.showError = false;
		}
		
	}
	$scope.callDMYAndVIN = function(op1,op2){
		$scope.showError = false;
		$scope.DMY.selDMYType = $scope.DMY.selDivi;		
		angular.element("#goBtn").attr("disabled",true);
		$scope.dataMileage = { mileage : '',subVal:''};	
		//console.log("$scope.inputValue "+document.querySelector('#vinno').value);
		if(!op2){
			$scope.inputValue = document.querySelector('#vinno').value;	
		}
		if($scope.DMY.selDMYType == 'VIN') {
			$scope.callMe($scope.inputValue);
		}
		else{
			
			mainService.getIsUserBlocked('',true).then(function(ubdata) {
                $scope.isUserError = ubdata.error;
                $scope.isUserBlocked = ubdata.UserStatus;				
				if ($scope.isUserError || $scope.isUserBlocked == true) {
                    $scope.isLoading.loadimage = false;
					//$scope.isLoader = false;
                    $scope.isUserBlocked = true;
					$rootScope.content = true;
					$rootScope.sysError = false;
                }
                if ($scope.isUserBlocked == false) {
                	mainService.sendDMYData($scope.DMY.selDivi,$scope.DMY.selMN,$scope.DMY.selMY).then(function(ubdata) {
				console.log("successfully send DMY Data");				
				$scope.callMeDMY();
			});
                	}else{
				 $rootScope.showInfo = true;
                 $scope.showMsg = false;
                 $rootScope.showData = false;
                 $scope.showError = false;
                 $scope.genErr = true;
				}
			});
		}
	}		
	$scope.callMeDMY = function(){		
		console.log("$$location.path()",$location.path());		
		$scope.selectedMenu = 'vinInfo';		
		$rootScope.showInfo = true;		
		$scope.smData.noInput = true;
		$scope.kcData.noInput = true;
		$scope.vinHthreshold = false;
		$scope.inputValue ='';
		document.querySelector('#vinno').value='';		;
		$scope.showMsg = true;
		$scope.vehOneLiner={"vehOneLiner": $scope.DMY.selMN+", "+$scope.DMY.selMY};
		$rootScope.content = true;
		$rootScope.isServiceCallMade=false;
		$rootScope.sysError = false;
		$rootScope.defaultMessage=true;
		$scope.showError = false;
		$scope.showVheader = false;	
		$scope.smData.mileageValue = "";
		//clearVehicleDetail();	
		if($scope.selectedLeftTopMenu == 'ASG'){
			$location.path($scope.selectedLeftTopMenu);
			$scope.asgData.bindASGInfo();
		}
		if($scope.selectedLeftTopMenu == 'performance'){
			$location.path($scope.selectedLeftTopMenu);
			bindPerformanceInfo();
		}
		if($scope.selectedLeftTopMenu == 'librarysearch'){
			$location.path($scope.selectedLeftTopMenu);
			$scope.$broadcast('bindLsInfo');
		}
		else if($scope.selectedLeftTopMenu == 'kc'){
			$location.path($scope.selectedLeftTopMenu);
			$scope.$broadcast('bindKCInfo');
		}
		else if($scope.selectedLeftTopMenu == 'sm'){
			$location.path($scope.selectedLeftTopMenu);	
			$scope.smData.isEnableApply = false;			
			$scope.$broadcast('bindSMInfo');				
		}
		if($scope.pageName == 'ACE'){
			$scope.showACE();
		}
		if($scope.pageName == 'TCMC' || $scope.pageName == 'LCMC'){
			if($scope.pageName == 'TCMC'){ $scope.showTCMC(0)}else{$scope.showTCMC(1);}				
		}
		if($scope.pageName == 'TBC Dealer Group'){
			$scope.showTBC();
		}
		//$scope.selMenuRedir();
		$scope.dataMileage = { mileage : '',subVal:''};		
		$scope.leftMenu ={"sscIcon": false,"toyotaCareInfo": false,"vehicleInfo": false,"serviceCampaign": false,"servicehistory": false,"olderservicehistory": false,"showFlag": false};
		$scope.extendLeftMenu = {show: false, data: {}};
		$rootScope.rightMenu = {"CustomerInfo": false};		
		if(($scope.userDivision !=='LEXUS' && $scope.vehOneLiner.division !='LEXUS') || ($scope.userDivision == "TOYOTA" || $scope.userDivision =="SCION")){
			$scope.hideCareTab = false;
		}else{
			$scope.hideCareTab = true;
		}
	}
	$scope.selMenuRedir = function(){
		if($scope.selectedMenu == 'vinInfo'){
			if($location.path() == '/vehicleInfo'){
				$scope.$broadcast('bindVinInfo');
				}
			else{
				$scope.redirectPage("/vehicleInfo");
				}
		}
		if($scope.selectedMenu == 'servicehistory'){	
			if($location.path() == '/servicehistory')
				$scope.$broadcast('bindServiceHistoryInfo');
			else
				$scope.redirectPage("/servicehistory");
		}
		if($scope.selectedMenu == 'customersurvey'){
			if($location.path() == '/customersurvey')
				$scope.$broadcast('bindCustomerSurveyInfo');
			else
				$scope.redirectPage("/customersurvey");
		}
		if($scope.selectedMenu == 'telematics'){
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");									
		}
		if($scope.selectedMenu == 'campaign'){
			if($location.path() == '/campaign')
				$scope.$broadcast('bindCampInfo');
			else
				$scope.redirectPage("/campaign");
		}
		if($scope.selectedMenu == 'care'){
			if($scope.hideCareTab){
				$scope.selectedMenu ="vinInfo";
				$scope.redirectPage("/vehicleInfo");
			}
			else
			{	
				if($location.path() == '/care')
					$scope.$broadcast('bindCareInfo');
				else
					$scope.redirectPage("/care");
			}
		}
		if($scope.selectedMenu == 'warranty'){
			if($location.path() == '/warranty')
				$scope.$broadcast('bindWarInfo', { isRefresh : true});
			else
				$scope.redirectPage("/warranty", { isRefresh : true});	
		}
		if($scope.selectedMenu == 'product'){
			if($location.path() == '/product')
				$scope.$broadcast('bindProductInfo');
			else
				$scope.redirectPage("/product");
		}
		if($scope.selectedMenu == 'vhr'){								
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");
		}
		if($scope.selectedMenu == 'roadside'){
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");
		}
		if($scope.selectedMenu == 'lps'){
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");
		}
		if($scope.selectedMenu == 'vspec'){
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");
		}
		if($scope.selectedMenu == 'dtc'){								
			$scope.selectedMenu ="vinInfo";
			$scope.redirectPage("/vehicleInfo");
		}
		
	};
	
    $scope.callMe = function(vin) {
	console.log("callMe",vin)
		$scope.extendLeftMenu.show = false;
		jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
		angular.element("body").css('overflow','auto');
		//alert(vin + '  from Main CallME Fn');
		if ( angular.element('.tooltipPopUp').length ) {
			angular.element(".tooltipPopUp").css('visibility','hidden');
		}
		$scope.selectedLeftTopMenu = 'vov';
		$scope.pageName = 'VEHICLE ONE-VIEW';
		$scope.tcmcDisclaimer = false;
		$scope.thirdParty.val = false;
		vin = vin.toUpperCase();
		$scope.inputValue = vin;
		$scope.showVheader = false;
		$scope.dealerD = {};
		$scope.setTcuvFlag = false;
		$scope.troubleD = {};
		$scope.setTroubleFlag = false;
		//I4T1BK36B25U036362
        if (vin.substring(0, 1) == "I" || vin.substring(0, 1) == "|") {
            vin = vin.substring(1, vin.length);
        }
        document.getElementById("vinno").value = vin.replace(/\s/g, "");
        vin = document.getElementById("vinno").value;
        //alert();
        var isValid = $scope.is_valid_vin(vin);
		angular.element("#goBtn").attr("disabled",true);
        if (isValid) {
			//$scope.isLoader = true;
			$scope.isLoading.loadimage = true;            
            $scope.showError = false;
            var contextPath=$location.path();
            var isLibrary=false;
            if(contextPath.contains("librarysearch")){
            	isLibrary=true;
            }
            mainService.getIsUserBlocked(vin,isLibrary).then(function(ubdata) {
                $scope.isUserError = ubdata.error;
				$scope.isUserBlocked = ubdata.UserStatus;
				$scope.salvageCheck = ubdata.salvageEnabled;				
				if ($scope.isUserError || $scope.isUserBlocked == true) {
                    $scope.isLoading.loadimage = false;
					//$scope.isLoader = false;
                    $scope.isUserBlocked = true;
					$rootScope.content = true;
					$rootScope.sysError = false;
                }
                if ($scope.isUserBlocked == false) {
					if ($scope.salvageCheck){
						mainService.getIsSalvage(vin).then(function(data) {						
							$scope.salvage.isSalvage = data.isSalvage;
							if(data.hasOwnProperty("error")){
								$scope.isLoading.loadimage = false;
								$scope.salvage.showSalvage = true;
								$scope.salvage.showSalvageError = true;
							}
							else if($scope.salvage.isSalvage){
								$scope.isLoading.loadimage = false;
								$scope.salvage.showSalvage = true;
								$scope.salvage.showSalvageError = false;
								$scope.salvage.data = data;
								$scope.salvage.salvageDeclined = function(){
									$scope.showPlatformAlert("If you do not check \"I Agree\" you will not be allowed to lookup VIN in this system.");
									$scope.salvage.showSalvage = false;
									$scope.salvage.userAgreed = false;
								}
								$scope.salvage.salvageAgreed = function(){
									$scope.salvage.showSalvage = false;
									$scope.isLoading.loadimage = true;
									$scope.salvage.userAgreed = true;
									$scope.lookupme(vin);
								}
							}
							else{
								$scope.salvage.userAgreed = false;							
								$scope.lookupme(vin);
							}
						});	
					}
					else{
						$scope.lookupme(vin);
					}				
				} else {
                    $rootScope.showInfo = true;
                    $scope.showMsg = false;
                    $rootScope.showData = false;
                    $scope.showError = false;
                    $scope.genErr = true;
                }
            });			
        } else {            
        	$scope.showError = true;
			return false;		
        }
	};
	
	$scope.lookupme = function(vin){
		$scope.showConcurrent();
		mainService.getLeftNavData(vin).then(function(ndata) {
			if(ndata.hasOwnProperty("error")){
				$scope.flatTireError = true;
				$scope.hideCareTab = true;
			}
			else{
				$scope.leftMenu = ndata;
				if($scope.leftMenu.sscIcon==true || $scope.leftMenu.toyotaCareIcon==true || $scope.leftMenu.TCUVIndicator == true || $scope.leftMenu.VehicleAlert == true || $scope.leftMenu.edAlertsInfo == true || $scope.leftMenu.showPrintIcon == true){
						$scope.showVheader = true;
					}
			}
		});
		mainService.getOnliner(vin,"",$scope.salvage.userAgreed).then(function(data) {
			//debugger;
			//$scope.isLoader = false;						
			$scope.showMsg = true;
			$scope.showError = false;
			$scope.genErr = false;
			$scope.vehOneLiner = data;
			$scope.tempEngineOil = {};
			$scope.tempTransOil = {};
			$scope.perHmiles = [];
			$scope.dealerCodeOriginal = '';
			$scope.dealerCodeTcuv = '';
			$scope.troubeCodeKey = '';
			$scope.troubeCodeValue = '';
			//displaying the json data
			//debugger
			mainService.getRightNavData(vin).then(function(ndata) {
				$rootScope.rightMenu = ndata;	
				$scope.dataMileage.mileage = parseInt($rootScope.rightMenu.LastKnownMileage);
				$scope.dataMileage.subVal = $scope.dataMileage.mileage;						
			});				
			if ($scope.vehOneLiner != "" && $scope.vehOneLiner != null) { 
				$scope.selectedMenu = (!$scope.selectedMenu) ?  'vinInfo' : $scope.selectedMenu;
				$scope.menu = false;
				if(($scope.vehOneLiner.division =='LEXUS' || $scope.vehOneLiner.division == "") && $scope.userDivision =='LEXUS'){
					$scope.hideCareTab = true;
				}
				if((($scope.vehOneLiner.division =='LEXUS' || $scope.vehOneLiner.division == "") && $scope.userDivision =='TOYOTA') || (($scope.vehOneLiner.division =='LEXUS' || $scope.vehOneLiner.division == "") && $scope.userDivision =='SCION') ){
					$scope.hideCareTab = true;
				}
				if($scope.vehOneLiner.division =='TOYOTA' || $scope.vehOneLiner.division =='SCION' ){
					$scope.hideCareTab = false;
				}
				$rootScope.content = false;
				$scope.selMenuRedir();//selMenuRedir();
			}					
		});
	};
	
    $scope.clearErrorMessage = function(){
		$scope.showSuggestion = false;
		$scope.showEmailError = false;	
    }
	
    $scope.redirectPage = function(path, selectedMenu) {
    	$rootScope.sysError = false;
		if($scope.DMY.selDMYType == 'VIN'){
			var vin = document.getElementById("vinno").value;
			var isValid = $scope.is_valid_vin(vin);	
			$scope.houseHoldInfo = false;
			if(isValid){
				$scope.selectedLeftTopMenu = 'vov';
				$scope.pageName = 'VEHICLE ONE-VIEW';
				$scope.thirdParty.val = false;
				$scope.tcmcDisclaimer = false;
				$scope.menu = false;
				$rootScope.showInfo = false;
				if(!$scope.inputValue){
					$scope.isLoading.loadimage = true;
					$timeout(function(){$scope.isLoading.loadimage = false;}, 500);
					$scope.selectedMenu = selectedMenu;
					return false;
				}
				if($scope.isUserBlocked || !$scope.inputValue || $rootScope.campaign || $rootScope.care || $rootScope.showData || $rootScope.servicehistoryiconflag || $rootScope.warrantySecions || $rootScope.customersurveyiconflag || $rootScope.telematicsIconflag || $rootScope.roadSideIconflag || $rootScope.dtcInfo || $rootScope.vehispec){					
					$rootScope.showInfo = true;
					$rootScope.sysError = false;
					console.log("true");
				}
				else{		
					//$rootScope.showInfo = false;
					//$scope.isLoading.loadimage = false;
					console.log("error");
				}
				if(selectedMenu){
					$scope.selectedMenu = selectedMenu;
				}
				$location.path(path);
			}
			else{
				$scope.showError = true;
				return false
			}
		}
		else {
			$location.path("/");
			if(selectedMenu)
					$scope.selectedMenu = selectedMenu;
			$rootScope.defaultMessage=true;
			/*if($rootScope.sysError == true) {
				$rootScope.defaultMessage=false;
			}
			else {
				$rootScope.defaultMessage=true;
			}*/
		}
		//}
    };
    $scope.is_valid_vin = function(vin) {
		var check_digit = '',
			check_digit_value = 0,
			sum = 0;
		var has_invalid_characters = 0;
		var check_digit_position = 8;
		var letter_values = "0=0,1=1,2=2,3=3,4=4,5=5,6=6,7=7,8=8,9=9,A=1,B=2,C=3,D=4,E=5,F=6,G=7,H=8,J=1,K=2,L=3,M=4,N=5,O=6,P=7,R=9,S=2,T=3,U=4,V=5,W=6,X=7,Y=8,Z=9".split(",");
		var digit_weights = "8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2".split(",");
		if (vin.length != 17) {
			return false;
		}
		for (var i = 0; i <= 16; i++) {
			digit = vin.substring(i, i + 1).toUpperCase();
			if (i == check_digit_position) {
				check_digit = digit;
			} else {
				var digit_value = -1;
				for (var j = 0; j <= letter_values.length - 1; j++) {
					if (letter_values[j].split("=")[0] == digit) {
						digit_value =
							(parseInt(letter_values[j].split("=")[1]) *
								parseInt(digit_weights[i]));
					}
				}
				sum += digit_value;
				if (digit_value == -1) {
					return false;
				}
			}
		}
		if (check_digit == 'X') {
			check_digit_value = 10;
		} else {
			check_digit_value = parseInt(check_digit);
		}
		if ((sum % 11) != check_digit_value) {
			return false;
		}
		return true;
	}
	$scope.resetLeftMenu = function() {			
			$rootScope.showData = false;
			$rootScope.campaign = false;
			$rootScope.servicehistoryiconflag = false;
			$rootScope.customersurveyiconflag = false;
			$rootScope.telematicsIconflag = false;
			$rootScope.roadSideIconflag = false;
			$rootScope.care = false;
			$rootScope.warrantySecions = false;
			$rootScope.showInfo = true;
			$rootScope.product = false;
			$rootScope.dtcInfo = false;
			if($scope.isUserBlocked)
				$rootScope.content = true;
			else
				$rootScope.content = false
	};
	$scope.feedbackSubmit =  function () {

		if(angular.element('#errorsuggestdesc').val().trim()  == '')
		{
			$scope.showSuggestion = true;
			angular.element('#errorsuggestdesc').focus();
		}
		else
		{
			$scope.showSuggestion = false;

		}

		if(angular.element('#contactemailfeedback').val().trim() == '')
		{
			$scope.showEmailError = false;
		}
		else
		{

			if(!validateEmail(angular.element('#contactemailfeedback').val().trim() ))
			{

				$scope.showEmailError = true;
				angular.element('#contactemailfeedback').focus();
			}
			else
			{

				$scope.showEmailError = false;
			}
		}
		if($scope.showEmailError && $scope.showSuggestion)
		{
			angular.element('#errorsuggestdesc').focus();
		}
		if($scope.showEmailError || $scope.showSuggestion)
		{
			return false;
		}
		else
		{
			mainService.feedbackSubmitData(angular.element('#sitearea').val().trim() ,angular.element('#errorsuggestdesc').val().trim() ,angular.element('#additonalcomments').val().trim() ,angular.element('#contactemailfeedback').val().trim() ,angular.element('#contacttel').val().trim() ,$scope.personDetailsForFeedback.firstName,$scope.personDetailsForFeedback.lastName,$scope.personDetailsForFeedback.commonName).then(function(vdata) {
			});
			$scope.overlayShow(false);
		}

	};

	//angular.element("select").css("border","1px solid red");
	angular.element($window).bind('orientationchange', function () {
		angular.element(".tooltipPopUp").css('visibility','hidden');		
		angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
		angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
		angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
		angular.element(".balloonstyle").css('visibility','hidden');
		angular.element(".customeDesc").css('display','none');
		$scope.smData.custDDShow = false;
		$scope.nextServiceApt.custDDShow = '';
		//angular.element("#popUpOverlay").css('display','none');
		angular.element(".customersurveypage .panel-default > .panel-heading").css('display','inline-table');
		if( /Android|webOS|IEMobile/i.test(navigator.userAgent) )  {
			angular.element(".dmyoptblur").blur();
			angular.element("#vhrmailids").blur();
			$( 'select' ).blur();
			
		}
		//$scope.dealPopUp = false;
		$scope.smData.showSMData = false;
		$timeout( function() {			
			if(!$scope.smData.showSMGrid && $scope.selectedLeftTopMenu == 'sm' && $scope.smData.smInfo.scheduledMaintenanceData.sliderData.length  && !$scope.footerFeedback){	
				//alert("true");
				$scope.smData.bindSMInfo();
			}
		},100);		
		
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
		$scope.blurTheVinInputFeedback();
		}
		
	});

	$scope.pageRefresh = function (){
		$location.path("/");
		if(window.top==window) {
			// you're not in a frame so you reload the site
			window.setTimeout(function(){				
				location.reload();
			}, 500); //reloads after 3 seconds
		} 
	};
	 
	$scope.doScan = function () {
		//$scope.oneviewrestMenu(true);
		if (windowsCheck){
			var windArrBar = ["barcodescanner","",""];
					window.external.notify(JSON.stringify(windArrBar));
					
			}
			else{
			window.plugins.VINBarcodeScanner.scan($scope.scannerSuccess, $scope.scannerFailure);	
			}
	}
	$scope.scannerSuccess = function(result) {
		if($scope.selectedLeftTopMenu != 'issueEntry' && $scope.selectedLeftTopMenu != 'editEntry' )
		{
			if(result.VINCode == 'NON RESULT'){
				if(typeof $scope.inputValue == "undefined"){
							$scope.inputValue = '';
							return false;
				}
			}
			else{
				if(!$scope.inputValue || ($scope.inputValue != result.VINCode && result.VINCode != '') )
					$scope.inputValue = result.VINCode;
			} 
			//$scope.inputValue = result.VINCode;
			if(result.VINCode != "NON RESULT" && result.VINCode){
				$scope.oneviewrestMenu(true);
				$scope.DMY.selDivi = 'VIN';
				if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
					document.getElementById("success_sound").play();
				}
				document.getElementById("vinno").value = $scope.inputValue;			
				$scope.$apply(function(){
							$scope.callDMYAndVIN($scope.inputValue);
						});
			}
		}
		else{
				
			if(result.VINCode == 'NON RESULT'){
				if(typeof $scope.auditValue == "undefined"){
					$scope.auditValue = '';
					return false;
				}
			}
			else{
				if(!$scope.auditValue || ($scope.auditValue != result.VINCode && result.VINCode != '') )
					$scope.auditValue = result.VINCode;
			} 			
			if(result.VINCode != "NON RESULT" && result.VINCode){
				if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
					document.getElementById("success_sound").play();
				}
				$scope.$apply(function(){
					$scope.$broadcast('bindIssueEntryInfo',$scope.selectedLeftTopMenu); 	
				});
			}
		}
	}
	$scope.scannerFailure = function(message) {	
		if($scope.selectedLeftTopMenu != 'issueEntry' && $scope.selectedLeftTopMenu != 'editEntry' )
		{
			$scope.showError = true;
			var inputvinnoerrorscan = document.querySelector('#vinno');
			inputvinnoerrorscan.focus();
		}
		else{
			$scope.issueEntry.showError = true;
			var inputvinnoerrorscan = document.querySelector('#auditvin');
			inputvinnoerrorscan.focus();
		}
	}
	$scope.lookupVin =  function (vinReceived,firstIndex,campaignyesorno) {
		if($scope.inputValue == vinReceived)
			{
				return false;
			}
		else{
			if(campaignyesorno){$scope.redirectPage('/campaign', 'campaign');}
			$scope.callMe(vinReceived);
			$scope.overlayShow();
		}
	}
	$scope.hideTooltip = function(){
		angular.element(".tooltipPopUp").css('visibility','hidden');
		angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
		angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
		angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
		//angular.element("#containerWrap").css({'overflow':'hidden',"height": "100%"});	

	}
	$scope.ResetApp = function(){
		console.log("resetapp");
	};
	$scope.scrollTopThePage =  function(flag){
		if(navigator.connection){
		var networkState = navigator.connection.type;
	    var states = {};
	    states[Connection.UNKNOWN]  = 'Unknown connection';
	    states[Connection.ETHERNET] = 'Ethernet connection';
	    states[Connection.WIFI]     = 'You are with WiFi connection';
	    states[Connection.CELL_2G]  = 'Cell 2G connection';
	    states[Connection.CELL_3G]  = 'Cell 3G connection';
	    states[Connection.CELL_4G]  = 'Cell 4G connection';
	    states[Connection.CELL]     = 'Cell generic connection';
	    states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
		if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
		{
		    alert( states[networkState]);
		    
		    return false;
		}
		}
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
			if(flag == 1){
				 jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
				  var inputvinno = document.querySelector('#vinno');
				  inputvinno.focus();				
			}
			if(flag == 2){
				 jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
				  setTimeout(function(){ var inputvinno22 = document.querySelector('.searchinputstyle');
				  inputvinno22.focus();	 }, 500);
			}
			if(flag == 3){
				setTimeout(function(){ var inputvinno23 = document.querySelector('#mileageFormtext');
				  inputvinno23.focus();	 }, 800);
			}
		}
	};


	$scope.scrollTopThePageFeedback =  function(flag){

		if(navigator.connection){
		var networkState = navigator.connection.type;
	    var states = {};
	    states[Connection.UNKNOWN]  = 'Unknown connection';
	    states[Connection.ETHERNET] = 'Ethernet connection';
	    states[Connection.WIFI]     = 'You are with WiFi connection';
	    states[Connection.CELL_2G]  = 'Cell 2G connection';
	    states[Connection.CELL_3G]  = 'Cell 3G connection';
	    states[Connection.CELL_4G]  = 'Cell 4G connection';
	    states[Connection.CELL]     = 'Cell generic connection';
	    states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
		if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
		{
		    alert( states[networkState]);		    
		    return false;
		}
		}
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
			$timeout(function(){
			if(flag == 1){
				 
		 var inputvinno = angular.element('#errorsuggestdesc');
				  inputvinno.focus();				
			}
			if(flag == 2){
				
		var inputvinno = angular.element('#additonalcomments');
				  inputvinno.focus();				
			} 

			if(flag == 3){
		var inputvinno = angular.element('#contactemailfeedback');
				  inputvinno.focus();				
			}
			if(flag == 4){
				
		var inputvinno = angular.element('#contacttel');
				  inputvinno.focus();				
			} 
			},200);
		}
	};
	$scope.scrollTopThePagePrint =  function(flag){

		if(navigator.connection){
		var networkState = navigator.connection.type;
	    var states = {};
	    states[Connection.UNKNOWN]  = 'Unknown connection';
	    states[Connection.ETHERNET] = 'Ethernet connection';
	    states[Connection.WIFI]     = 'You are with WiFi connection';
	    states[Connection.CELL_2G]  = 'Cell 2G connection';
	    states[Connection.CELL_3G]  = 'Cell 3G connection';
	    states[Connection.CELL_4G]  = 'Cell 4G connection';
	    states[Connection.CELL]     = 'Cell generic connection';
	    states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
		if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
		{
		    alert( states[networkState]);		    
		    return false;
		}
		}
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
			$timeout(function(){
			if(flag == 1){ 
				angular.element('#printtoaddr').focus();
			}
			if(flag == 2){				  
				angular.element('#printccaddr').focus();
			}		 
			},200);
		}
	};
$scope.blurPrintPopUp =  function(){
	if(navigator.connection){
		var networkState = navigator.connection.type;
			var states = {};
			states[Connection.UNKNOWN]  = 'Unknown connection';
			states[Connection.ETHERNET] = 'Ethernet connection';
			states[Connection.WIFI]     = 'You are with WiFi connection';
			states[Connection.CELL_2G]  = 'Cell 2G connection';
			states[Connection.CELL_3G]  = 'Cell 3G connection';
			states[Connection.CELL_4G]  = 'Cell 4G connection';
			states[Connection.CELL]     = 'Cell generic connection';
			states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
			if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
			{
				alert( states[networkState]);				
				return false;
			}
			}
				$timeout(function(){
					angular.element('#printtoaddr').blur(); 
					angular.element('#printccaddr').blur();
			}, 200);   
			 
};

	$scope.blurTheVinInputFeedback=  function(){
		if(navigator.connection){
		var networkState = navigator.connection.type;
			var states = {};
			states[Connection.UNKNOWN]  = 'Unknown connection';
			states[Connection.ETHERNET] = 'Ethernet connection';
			states[Connection.WIFI]     = 'You are with WiFi connection';
			states[Connection.CELL_2G]  = 'Cell 2G connection';
			states[Connection.CELL_3G]  = 'Cell 3G connection';
			states[Connection.CELL_4G]  = 'Cell 4G connection';
			states[Connection.CELL]     = 'Cell generic connection';
			states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
			if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
			{
				alert( states[networkState]);
				
				return false;
			}
			}
			//if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
				$timeout(function(){
					angular.element('#errorsuggestdesc').blur();
					angular.element('#additonalcomments').blur();
					angular.element('#contactemailfeedback').blur();
					angular.element('#contacttel').blur();
			}, 200);
				angular.element('#mileageFormtext').blur();
				angular.element('#printtoaddr').blur(); 
				angular.element('#printccaddr').blur(); 
		//}
	};

	$scope.blurTheVinInput=  function(){
		if ((windowsCheck)|| (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) || ((/Android|webOS|IEMobile/i.test(navigator.userAgent)) ) )
		{
		if(navigator.connection){
			var networkState = navigator.connection.type;
			var states = {};
			states[Connection.UNKNOWN]  = 'Unknown connection';
			states[Connection.ETHERNET] = 'Ethernet connection';
			states[Connection.WIFI]     = 'You are with WiFi connection';
			states[Connection.CELL_2G]  = 'Cell 2G connection';
			states[Connection.CELL_3G]  = 'Cell 3G connection';
			states[Connection.CELL_4G]  = 'Cell 4G connection';
			states[Connection.CELL]     = 'Cell generic connection';
			states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
			if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
			{
				alert( states[networkState]);
				
				return false;
			}
		}
		
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
				angular.element(".tooltipPopUp").css('visibility','hidden');
				angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
				angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
				angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
				angular.element(".blackbackground").css('visibility','hidden');
				if(document.querySelector('#mileageFormtext')) {
					  var keysearchinput3 = document.querySelector('#mileageFormtext');
					     keysearchinput3.blur();
				}
		}
		  var inputvinno2 = document.querySelector('#vinno');
		  inputvinno2.blur();
			if(document.querySelector('.searchinputstyle')) {
		  		var keysearchinput2 = document.querySelector('.searchinputstyle');
		 		 keysearchinput2.blur();
			}
		}
	};
	$scope.blurTheVinInputClick=  function(){
		if (windowsCheck){
			var windArrBarnetwork = ["networkcheck","",""];
				window.external.notify(JSON.stringify(windArrBarnetwork));
		}
		if ((/(iPhone|iPod|iPad)/.test(navigator.userAgent)) || ((/Android|webOS|IEMobile/i.test(navigator.userAgent)) ) )
		{
			if(navigator.connection){
				var networkState = navigator.connection.type;
				var states = {};
				states[Connection.UNKNOWN]  = 'Unknown connection';
				states[Connection.ETHERNET] = 'Ethernet connection';
				states[Connection.WIFI]     = 'You are with WiFi connection';
				states[Connection.CELL_2G]  = 'Cell 2G connection';
				states[Connection.CELL_3G]  = 'Cell 3G connection';
				states[Connection.CELL_4G]  = 'Cell 4G connection';
				states[Connection.CELL]     = 'Cell generic connection';
				states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
				if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
				{
					alert( states[networkState]);					
					return false;
				}
			}
		}
			if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
				  var inputvinno2 = document.querySelector('#vinno');
				  inputvinno2.blur();
				  var keysearchinput3 = document.querySelector('#mileageFormtext');
				  keysearchinput3.blur();
			}
			angular.element(".tooltipPopUp").css('visibility','hidden');
			angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
			angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
			angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
			angular.element(".blackbackground").css('visibility','hidden');			
	};
	$scope.resetForm = function(vin,evn) {
		if ((windowsCheck)|| (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) || ((/Android|webOS|IEMobile/i.test(navigator.userAgent)) ) )
		 {	
			if(navigator.connection){
			var networkState = navigator.connection.type;
			var states = {};
			states[Connection.UNKNOWN]  = 'Unknown connection';
			states[Connection.ETHERNET] = 'Ethernet connection';
			states[Connection.WIFI]     = 'You are with WiFi connection';
			states[Connection.CELL_2G]  = 'Cell 2G connection';
			states[Connection.CELL_3G]  = 'Cell 3G connection';
			states[Connection.CELL_4G]  = 'Cell 4G connection';
			states[Connection.CELL]     = 'Cell generic connection';
			states[Connection.NONE]     = 'The network is currently unavailable. Please check the network settings of your device.';
				if(states[networkState] == 'The network is currently unavailable. Please check the network settings of your device.')
				{
					alert( states[networkState]);					
					return false;
				}
			}
		 }
		if ((/(iPhone|iPod|iPad)/.test(navigator.userAgent)) && vin != "auditReset") {
			 jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
			  var inputvinno = document.querySelector('#vinno');
			  inputvinno.focus();
		}		
		$rootScope.showInfo = true;
		$scope.vinHthreshold = false;
		$scope.showMsg = false;
		$rootScope.content = true;
		$rootScope.isServiceCallMade=false;
		$rootScope.sysError = false;
		$rootScope.defaultMessage=true;
		$scope.showError = false;
		$scope.selectedMenu = null;
		$scope.vehOneLiner ='';
		$scope.selectedLeftTopMenu = "vov"
		$scope.DMY.selDivi = 'VIN';
		$scope.DMY.selDMYType = '';
		if(vin != "auditReset"){
			var inputvinval = document.querySelector('#vinno');
			inputvinval.value =  "";
			inputvinval.focus();
		}
		$scope.inputValue = "";
		$scope.showVheader = false;
		clearVehicleDetail();
		$scope.oneviewrestMenu(true);
		angular.element("#goBtn").attr("disabled",true);
		$scope.dataMileage = { mileage : "",subVal:""};
		$scope.leftMenu ={"sscIcon": false,"toyotaCareInfo": false,"vehicleInfo": false,"serviceCampaign": false,"servicehistory": false,"olderservicehistory": false,"showFlag": false};
		$scope.extendLeftMenu = {show: false, data: {}};
		$rootScope.rightMenu = {"CustomerInfo": false};		
		if(($scope.userDivision !=='LEXUS' && $scope.vehOneLiner.division !='LEXUS') || ($scope.userDivision == "TOYOTA" || $scope.userDivision =="SCION")){
			$scope.hideCareTab = false;
		}else{
			$scope.hideCareTab = true;
		}
		$scope.PODVar.auditName = $scope.PODVar.getAudit = '';
		$scope.PODVar.selectAudit = $scope.PODVar.menuIssueEntry = false;
    };
    $scope.dealerD = {};
    $scope.setTcuvFlag = false;
		
	$scope.troubleD = {};
	$scope.setTroubleFlag = false;
		
    $scope.toggleMenu = function($event) {
		$scope.menu = !$scope.menu;
    };
	$scope.hideMenu = function(){
		$scope.menu = false;
	}
	
	$scope.DMY.showDMYType = function(op1,op2,op3){
		angular.element("#goBtn").attr("disabled",false);
		mainService.getDMYData(op1,op2,op3).then(function(udata){
			$scope.DMY.selDivi = udata.defaultDivision;
			$scope.DMY.selMN = udata.defaultModel;
			$scope.DMY.selMY = udata.defaultYear;
			$scope.DMY.data = udata;
			
		});
	};
	$scope.DMY.showDMYType();
	$scope.DMY.selectDMYDivi = function(op){
		$scope.showError = false;
		$scope.DMY.selMN='';$scope.DMY.selMY='';
		angular.element("#goBtn").attr("disabled",false);
		if(op != "VIN"){
			angular.element("#goBtn").attr("disabled",false);
			$scope.DMY.showDMYType($scope.DMY.selDivi,$scope.DMY.selMN,$scope.DMY.selMY);			
		}
		else{
			if(angular.element('#vinno').val() ==''){	
				angular.element("#goBtn").attr("disabled",true);
			}
			//document.querySelector('#vinno').value='';
		}
	}	
	
	mainService.getDivision().then(function(udata) {
			if(udata.hasOwnProperty('error')){
					$scope.hideCareTab = true;
			}else{
				$scope.hideCareTab = false;	
				$scope.userDivision = udata.DIVISION;
				$scope.TCMC_Label = udata.TCMC_Label;
				$scope.tcmcEnabled = udata.tcmcEnabled;
			$scope.userDiv($scope.userDivision);
			$scope.logoutUrl = udata.logoutUrl;
			$scope.announcemnetNewCount = udata.announcemnetNewCount;
			$scope.personDetailsForFeedback = udata.person;
			$scope.CustomerInfoFlag = udata.CustomerInfo; 
			$scope.CustomerInfoEnabled = udata.CustomerInfoEnabled;
			$scope.userDivisionData = udata;
			$scope.summaryEnabled = udata.summaryTab;
			$scope.PODVar ={toggleMenu: false,selectAudit: false,selectedMenu:'',auditChange:false,defAuditName: udata.defaultAuditName,auditName: '', getAudit:'',menuIssueEntry: false , vin:'', issueId:''};
			$scope.PODVar.toggleMenu = udata.defMenuSLP;
			if($scope.userDivisionData.userType == 1 || $scope.userDivisionData.userType == 2 && !$scope.userDivisionData.defMenuSLP )
			{
				$scope.showAuditAssistant('issueList',false);
				$scope.selectedMenu = 'issueList';
			}			
			if(udata.person){
				if($scope.personDetailsForFeedback.phoneNumber == 'N/A')
					$scope.personDetailsForFeedback.phoneNumber = '';
				if($scope.personDetailsForFeedback.emailAddress == 'N/A')
					$scope.personDetailsForFeedback.emailAddress = '';
				
				if($scope.personDetailsForFeedback.commonName == 'N/A')
					$scope.personDetailsForFeedback.commonName = '';
				if($scope.personDetailsForFeedback.lastName == 'N/A')
					$scope.personDetailsForFeedback.lastName = '';
				
				if($scope.personDetailsForFeedback.firstName == 'N/A')
					$scope.personDetailsForFeedback.firstName = '';
			}
			$scope.cookieName = udata.cookieName;
			if ($scope.cookieName != null || $scope.cookieName != "") {
                $scope.createCookieDomain($scope.cookieName, 'DUMMY');
            }
			$scope.showAppMenu = function(event,menu){					
				event.stopPropagation();
				$scope.PODVar.toggleMenu = !menu;	
				}
			}
    });
	
	$scope.createCookieDomain = function(name, value) {
        var domain = "; domain=.toyota.com";
        var ck = name + "=" + value + "; path=/" + domain;
        document.cookie = ck;
	};
	$scope.userDiv = function(div){
		$scope.division = div;
		if($scope.division == 'LEXUS'){
			$scope.hideCareTab=true;
		}
	};
	
	var clearVehicleDetail = function(){
		//if(!$scope.inputValue){ $location.path("/"); return;}
		mainService.clearVehicalData().then(function(data) {
			console.log("cleared");
		});
	}
	
	$scope.showVOV = function(){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$location.path('/');
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.oneviewrestMenu();
		$scope.pageName = 'VEHICLE ONE-VIEW';
		$scope.selectedLeftTopMenu = 'vov';
		$scope.tcmcDisclaimer = false;
		$scope.thirdParty.val = false;			
		/*if($scope.DMY.selDivi != 'VIN')
			$scope.oneviewrestMenu();*/
//$scope.selMenuRedir();		
		/*if($scope.DMY.selDivi == 'VIN'){
			if($scope.inputValue != "" && $scope.inputValue!= null){
				//$scope.callMe($scope.inputValue);				
			}else{
				if($scope.selectedMenu !="" && $scope.selectedMenu !=null){
					$scope.selectedMenu = "";
				}else{
					return false
				}
			}
		}
		else
			$scope.oneviewrestMenu();	*/
	};
	$scope.asgData={data:'',flatTireErr:false,iframeUrl:''};
	$scope.showASG = function(onePath){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = 'ASG';
		$scope.selectedLeftTopMenu = onePath;
		//$location.path(onePath);
		if(!$scope.isUserBlocked){				
			$scope.asgData.bindASGInfo();	
		}		
		$scope.tcmcDisclaimer = false;
	}
	$scope.asgData.bindASGInfo = function(view){			
		$scope.thirdParty.val = true;
		$scope.isLoading.loadimage = true;	
		$scope.asgData.flatTireErr =false;		
		mainService.getASGData(view).then(function(data) {
			$scope.isLoading.loadimage = false;
			$scope.asgData.data =data;			
			if(data.VIN == 'N/A') data.VIN='';
			if(data.mail == 'N/A') data.mail='';
			if(data.hasOwnProperty("error")){
				$scope.asgData.flatTireErr =true;
			}
			else{			
				$scope.asgData.iframeUrl = $sce.trustAsResourceUrl(data.url);	
				angular.element("#asgForm").attr("action", data.url);
				angular.element("#asgForm").submit();
				$timeout(function(){
					angular.element("#asgForm").attr("action", data.url);
				angular.element("#asgForm").submit();				
				}, 300); 
								
				
			}
			
		});
	}; // ASG service call method
	$scope.showPerformance = function(onePath){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = 'Performance';
		$scope.selectedLeftTopMenu = onePath;
		$location.path(onePath);
		if(!$scope.isUserBlocked){	
			bindPerformanceInfo();	
		}		
		$scope.tcmcDisclaimer = false;
	}
	var bindPerformanceInfo = function(){				
		$scope.thirdParty.val = true;
		$scope.isLoading.loadimage = true;	
		$scope.performance ={"data":'',flatTireErr:false,iframeUrl:''}
		mainService.getPerformanceData().then(function(data) {
			$scope.isLoading.loadimage = false;
			$scope.performance.data =data;
			if(data.hasOwnProperty("error")){
				$scope.performance.flatTireErr =true;
			}
			else{
				$scope.performance.iframeUrl = $sce.trustAsResourceUrl(data.performanceUrl);
			}
			
		});
	};
	$scope.showSm = function(onePath){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = 'Scheduled Maintenance';
		$scope.selectedLeftTopMenu = onePath;
		$scope.selectedSMTab = 0;	
		$location.path(onePath);				
		$scope.$broadcast('bindSMInfo');
		$scope.tcmcDisclaimer = false;
		
	};
	$scope.showKc = function(onePath){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = 'Knowledge Center';
		$scope.selectedLeftTopMenu = onePath;
		$location.path(onePath);				
		$scope.$broadcast('bindKCInfo');
		$scope.tcmcDisclaimer = false;
	};
	$scope.showLibrarySearch = function(onePath){
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$location.path(onePath);
		$scope.pageName = 'Library Search';
		$scope.selectedLeftTopMenu = onePath;		
		$scope.$broadcast('bindLsInfo');
		$scope.tcmcDisclaimer = false;
		
	};
	$scope.showTCMC = function(flag){
	/*if($scope.thirdParty.val == true){
			$scope.thirdParty.val = false;
		}*/
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = $scope.TCMC_Label;
			$scope.selectedLeftTopMenu = (flag) ?'lcmc':'tcmc';
		$scope.isLoading.loadimage = true;
		mainService.getTCMC().then(function(data) {
			$scope.isLoading.loadimage = false;	
			$scope.tcmcInfo = data;
			if($scope.tcmcInfo.tcmcFormData != 'N/A'){
				angular.element("#tcmcForm").attr("action", $scope.tcmcInfo.tcmcFormData.tcmcURL);
				angular.element("#tcmcForm").submit();
			}
			$scope.thirdParty.val = true;
			
			$scope.tcmcDisclaimer = true;
		});		
	};
	$scope.showTBC = function(){
	/*if($scope.thirdParty.val == true){
			$scope.thirdParty.val = false;
		}*/
		$scope.pageName = 'TBC Dealer Group';
		$scope.selectedLeftTopMenu = 'tbc';	
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		mainService.getTBC().then(function(data) {
			$scope.tcmcInfo = data;
			//$scope.tcmcInfo.tcmcFormData.tcmcURL = $scope.tcmcInfo.tcmcFormData.tcmcURL+'?'+$scope.tcmcInfo.tcmcFormData.dealerCode;
			angular.element("#tbcForm").attr("action", $scope.tcmcInfo.tcmcFormData.tcmcURL);
			angular.element("#tbcForm").submit();
			$scope.thirdParty.val = true;
			$scope.tcmcDisclaimer = true;
			
		});		
	};
	$scope.showACE = function(){
		/*if($scope.thirdParty.val == true){
			$scope.thirdParty.val = false;
		}*/
		if($scope.tcmcInfo){
			$scope.tcmcInfo = "";
		}
		if(!$scope.userDivisionData.defMenuSLP)
		{
			$scope.resetForm("auditReset");
		}
		$scope.userDivisionData.defMenuSLP = true;
		$scope.pageName = 'ACE';
		$scope.selectedLeftTopMenu = 'ace';
		$scope.isLoading.loadimage = true;		
		mainService.getACE().then(function(data) {
			$scope.aceInfo = data;
			$scope.isLoading.loadimage = false;
			//$scope.aceInfo.aceFormData.ptsURL = 'https://lexus.pts1.com/userguideportal.aspx';
			angular.element("#aceForm").attr("action", $scope.aceInfo.aceFormData.ptsURL);
			angular.element("#aceForm").submit();
			$scope.thirdParty.val = true;
			$scope.tcmcDisclaimer = false;
		});		
	};
	
	/*TEMA screens  */
	$scope.showaudit = function(selOpt)
	{	
		if(selOpt == "Show All" )
		{
			$scope.PODVar.auditChange = false;
			if($scope.PODVar.auditName == "")
			{
				mainService.getDivision(true).then(function(udata) {
					$scope.userDivisionData.auditNames = udata.auditNames;
					$scope.PODVar.getAudit = udata.defaultAuditName;
				});
			}
			else{
				mainService.getDivision(true).then(function(udata) {
					$scope.userDivisionData.auditNames = udata.auditNames;
					$scope.PODVar.getAudit = $scope.PODVar.auditName;
				});				
			}
			
		}
		else if(selOpt == "Show Less" )
		{
			$scope.PODVar.auditChange = false;
			if($scope.PODVar.auditName == "")
			{
				mainService.getDivision(false).then(function(udata) {
					$scope.userDivisionData.auditNames = udata.auditNames;
					$scope.PODVar.getAudit = udata.defaultAuditName;
				});
			}
			else{
				mainService.getDivision(false).then(function(udata) {
					$scope.userDivisionData.auditNames = udata.auditNames;
					for(var i=0;i<=10;i++)
					{
						if($scope.PODVar.auditName == $scope.userDivisionData.auditNames[i] )
						{
							$scope.PODVar.getAudit = $scope.PODVar.auditName;
							break;
						}
						else					
						{
							$scope.PODVar.getAudit = "";						
						}
					}	
				});				
			}			
		}
		else
		{
			$scope.PODVar.auditChange = true;	
		}
	};
	$scope.showAuditActivity = function()
	{
		if($scope.PODVar.menuIssueEntry)
		{
			$scope.showAuditAssistant('issueEntry');			
		}
		else{
			$scope.showAuditAssistant('issueList');
		}
	}
	$scope.showAuditAssistant = function(onePath,goVal,vin,id){
		$scope.showError = false;
		$scope.userDivisionData.defMenuSLP = false;
		if($scope.PODVar.defAuditName !="" && goVal == false){
			mainService.getOnliner('',$scope.PODVar.defAuditName,'').then(function(data) {
				$scope.userDivisionData.vehOneLiner = data;
			});	
			$scope.PODVar.auditName = $scope.PODVar.defAuditName;
			$scope.PODVar.getAudit = $scope.PODVar.defAuditName;
		}
		else if($scope.PODVar.defAuditName !="" && goVal == undefined)
		{
			if($scope.PODVar.auditName == "")
			{
				$scope.PODVar.auditName =  $scope.PODVar.defAuditName;
				$scope.PODVar.getAudit = $scope.PODVar.defAuditName;
			}			
			mainService.getOnliner('',$scope.PODVar.auditName,'').then(function(data) {
				$scope.userDivisionData.vehOneLiner = data;
			});						
		}		
		if(goVal && $scope.PODVar.getAudit !=''){
			$scope.PODVar.selectAudit = true;
			$scope.PODVar.auditChange = false;
			$scope.PODVar.auditName = $scope.PODVar.getAudit;			
			mainService.getOnliner('',$scope.PODVar.getAudit,'').then(function(data) {
				$scope.userDivisionData.vehOneLiner = data;
			});
		}		
		$scope.pageName = onePath;
		$scope.selectedLeftTopMenu = onePath;
		$location.path(onePath);
		$scope.menu = false;
		if(onePath == 'issueEntry')
		{
			$scope.PODVar.menuIssueEntry = true;
			if($scope.PODVar.auditName)
			{	
				$scope.auditValue =  '';
				$scope.$broadcast('bindIssueEntryInfo',onePath); 				
			}
		}
		else if(onePath == 'issueList' || (onePath == 'editEntry' && goVal ))
		{
			$scope.PODVar.menuIssueEntry = false;
			if($scope.PODVar.auditName)
			{
			$scope.$broadcast('bindIssueListInfo',onePath); 				
			}
			if(onePath == 'editEntry' && goVal )
			{
				$location.path('issueList');
				$scope.pageName = $scope.selectedLeftTopMenu = 'issueList';
			}
		}
		else if(onePath == 'auditSetup'){
			$scope.$broadcast('bindAuditSetupInfo');     
		}
		else {
			$location.path('issueEntry');
			if($scope.PODVar.auditName)
			{
				$scope.PODVar.vin = vin;
				$scope.PODVar.issueId = id;
				var obj = {onePath: onePath, vin: vin, id: id};
				$scope.$broadcast('bindEditEntryInfo',obj);	
			}
		}
	};
	
	$scope.showuserselction = function(pgname, subId,emailId){
		$scope.isLoading.loadimage = true;		
		mainService.getUserSelectionPopup(pgname, subId,emailId).then(function(data) {
			$scope.userSelection = true;	
			$scope.isLoading.loadimage = false;
			$scope.selectPagename =pgname;
			if(data.hasOwnProperty('error')){
				$scope.userSelecionErr = true;
			}else{	
				$scope.userSelObj = data;
					if(data.subscriberListMap.length){
						for(var x=0;x<data.subscriberListMap.length;x++){
							if(data.subscriberListMap[x].selected){
								$scope.userSubscriber = {value:data.subscriberListMap[x]};
							}
						}	
				
					}			
			}
		});		
	};	
	
	$scope.printObj.sendMail = function(custID,email){
		$scope.isLoading.loadimage = true;
		$scope.vhrMailError = "";
		mainService.sendVHRMail(custID,email).then(function(data) {
			$scope.showSpinner = false;
			$scope.isLoading.loadimage = false;
			$scope.userSelObj = data;
			if(data.sendMailJson.sendMailStatus){
				$scope.userSelection = false;
			}	
		});		
	};
	
	$scope.authcodeValidation = function(aVal){
		$scope.isLoading.loadimage = true;
		$scope.resendErr = false;
		if(aVal && aVal.length == 6){			
			mainService.getAuthCodeValidationResult(aVal).then(function(data) {
				$scope.isLoading.loadimage = false;
				$scope.lps.CurrentPopup = false;
				$scope.authCodeErr = data.valideAuthCode;				
				if($scope.authCodeErr){
					$scope.acknowledgement = true;
					$rootScope.authCodeSelection = false;
					$scope.lps.lpsUpadte = true;
					if($scope.lps.cbtn && $scope.lps.currentPage == "pending")
					{
						mainService.getCancelPendingSettingData($rootScope.lpsPendingObj.lpsPending.setValuesVO.customizeId,$rootScope.lpsPendingObj.lpsPending.timeStamp).then(function(data) {
							$rootScope.lpsPendingObj = data;
							$scope.lps.selectedDetail = [];
							if(data.hasOwnProperty('error')){
									$scope.lps.flatTireErr = true;	
								}else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
										$scope.lps.lpsPendingErr = true;
								}
								else
									$scope.lps.authCodeAvailable = data.lpsPending.authCodeAvailable;							
						});
					}else{
						if($scope.lps.currentPage == "current"){
							mainService.getUpdateSettingData($rootScope.lpsCurrentObj.lpsCurrent.setValuesVO.customizeId,$rootScope.lpsCurrentObj.lpsCurrent.timeStamp,$scope.lps.currentPage,$scope.lps.selectedDetail).then(function(data) {
								$rootScope.lpsCurrentObj = data;
								
								$scope.lps.selectedDetail = [];
								if(data.hasOwnProperty('error')){
									$scope.lps.flatTireErr = true;
								}else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
										$scope.lps.lpsCurrentErr = true;
								}else
									$scope.lps.authCodeAvailable = data.lpsCurrent.authCodeAvailable;
							});
						}
						if($scope.lps.currentPage == "pending"){
							mainService.getUpdateSettingData($rootScope.lpsPendingObj.lpsPending.setValuesVO.customizeId,$rootScope.lpsPendingObj.lpsPending.timeStamp,$scope.lps.currentPage,$scope.lps.selectedDetail).then(function(data) {
								$rootScope.lpsPendingObj = data;
								
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
					}
				}
				else
					angular.element('.popupContent')[0].scrollTop = 0;
			});
		}
		else{					
			$scope.authCodeErr = false;
			$scope.isLoading.loadimage = false;			
			angular.element('.popupContent')[0].scrollTop = 0;
			
		}		
	}
	$scope.userSelectionYes = function(uCusId){
		$scope.isLoading.loadimage = true;
		$scope.authCodeErr = true;		
		mainService.getUsrSendMailData(uCusId).then(function(data) {
			$scope.isLoading.loadimage = false;
			$rootScope.lpsAuthCodeObj = data;
			if(data.authCodeGenerated && !data.vhrSendMailError){
				$scope.lps.CurrentPopup = true;	
				$scope.userSelection = false;
				$rootScope.authCodeSelection = true;				
			}
			if(!data.authCodeGenerated && data.vhrSendMailError)
				angular.element('.popupContent')[0].scrollTop = 0;
		});
		angular.element('.popupContent')[0].scrollTop = 0;
	}
	$scope.resendAuthCode = function(cusId){
		$scope.isLoading.loadimage = true;
		$scope.authCodeErr = true;
		mainService.resendAuthcodeData(cusId).then(function(data) {
			$scope.lpsAuthCodeObj = data;
			$scope.isLoading.loadimage = false;
			if(data.authCodeGenerated && !data.vhrSendMailError && data.resendCodeStatus){
				$scope.resendErr = true;
				angular.element('.popupContent')[0].scrollTop = 0;
				//angular.element('#lpsHideBox').focus();
			}
		});
	}
	$scope.copyPageText= function(){
		angular.element("copytextid").removeClass("fadeoutcopytext");
		angular.element("copytextid").removeClass("fadeincopytext");
		$scope.startFade = false;
		$scope.stopFade = false;
		var texting = document.getElementById('to_copy').innerText ;
		if (windowsCheck){
			var windArrExport = ["copytoclipboard",texting];
			window.external.notify(JSON.stringify(windArrExport));
			$scope.startFade = true;
			       $timeout(function(){
			         $scope.stopFade = true;
			         // $scope.startFade = false;
			       }, 2000);
		}
		cordova.plugins.clipboard.copy(texting);
		 $scope.startFade = true;
	        $timeout(function(){
	        	$scope.stopFade = true;
	        	// $scope.startFade = false;
	        }, 2000);     
	};
	$scope.cancelAuthCode = function(){
		$scope.lps.CurrentPopup = false;		
		$scope.isLoading.loadimage = true;
		mainService.cancelAuthCodeData().then(function(data) {
			$scope.isLoading.loadimage = false;	
			$scope.lps.authCodeAvailable = false;
			var resendAuthCodeObj= data;
			$rootScope.authCodeSelection = false;
			$scope.resendErr = false;
		});
	}
	
	$scope.selectCustomer = function(cId){
		mainService.selectCustomerInfoData(cId).then(function(data) {			
		});
	}
	clearVehicleDetail();
	$scope.hidePopupAndOverlay = function(val,hide){
		if(hide) $scope.overlayHide();
		else $scope.overlayShow(val);
		return false;
	}
	$scope.oneviewrestMenu = function(val){
			
			$scope.pageName = 'VEHICLE ONE-VIEW';
			if(val){
				$scope.thirdParty.val = false;
			}else{
				$scope.thirdParty.val = true;
			}
			$scope.tcmcDisclaimer = false;
			//$scope.selectedLeftTopMenu = "vov";
		if($scope.selectedLeftTopMenu == 'sm' || $scope.selectedLeftTopMenu == 'kc' || $scope.selectedLeftTopMenu == 'librarysearch'|| $scope.selectedLeftTopMenu == 'ASG'|| $scope.selectedLeftTopMenu == 'performance'){		
        		$scope.selectedLeftTopMenu = 'vov';
			if($scope.selectedMenu == 'vinInfo'){
					$scope.redirectPage("/vehicleInfo");
			}
			if($scope.selectedMenu == 'servicehistory'){
					$scope.redirectPage("/servicehistory");
			}
			if($scope.selectedMenu == 'customersurvey'){
					$scope.redirectPage("/customersurvey");
			}
			if($scope.selectedMenu == 'telematics'){
					$scope.redirectPage("/telematics");
			}
			if($scope.selectedMenu == 'campaign'){
					$scope.redirectPage("/campaign");
			}
			if($scope.selectedMenu == 'care'){
				if($scope.hideCareTab){
					$scope.selectedMenu ="vinInfo";
					$scope.redirectPage("/vehicleInfo");
				}
				else
				{	
					$scope.redirectPage("/care");
				}
			}
			if($scope.selectedMenu == 'warranty'){
				
					$scope.redirectPage("/warranty");	
			}
			if($scope.selectedMenu == 'product'){
				
					$scope.redirectPage("/product");
			}
			if($scope.selectedMenu == 'vhr'){
				
					$scope.redirectPage("/vhr");
			}
			
			if($scope.selectedMenu == 'lps'){
				
					$scope.redirectPage("/telematics");
			}
			if($scope.selectedMenu == 'roadside'){
				$scope.redirectPage("/roadside");
				}
			if($scope.selectedMenu == 'dtc'){
				$scope.redirectPage("/dtc");
				}
			if($scope.selectedMenu == 'vspec'){
				$scope.redirectPage("/vspec");
				}
			
		}
	}			
	$scope.showPrint = function(){
		$scope.isLoading.loadimage = true;
		jQuery("html,body").animate({ scrollTop: 0 }, 0.00000000001);
		$scope.displayPrintError = false;		
		$scope.oneviewrestMenu(true);
		$scope.showPrintView = true;
		$scope.printObj.custDDShow = false;		
		angular.element('body').css('overflow-y','hidden');
		var opGoing = true;
		$scope.printObj.flatTireErr = false;
		$scope.printObj.operatingConditionId = '';
		$scope.printObj.instructionId='';
		 mainService.getPrintData().then(function(data) {
			$scope.isLoading.loadimage = false;
			$scope.printObj.data = data;
			if(data.hasOwnProperty("error"))			
					$scope.printObj.flatTireErr = true;
			else{
				for(var i=0;i<(data.length -1);i++){	
					if(data[i].options[0].moduleDisplayName == "Service History" && data[i].options[0].selected)
						$scope.printObj.serviceHistory = true;
					if(data[i].options[0].hasOwnProperty("showOperatingConditonDropDown")){
						for(var j=0;j< data[i].options[0].operatingCondition.length;j++){
							if(data[i].options[0].operatingCondition[j].selected){
								$scope.printObj.opcondSelect = data[i].options[0].operatingCondition[j].operatingConditionDesc;
								$scope.printObj.operatingConditionId = data[i].options[0].operatingCondition[j].operatingConditionId;
								break;
							}
						}
					}
					if(data[i].options[0].hasOwnProperty("showFuelDropDown")){
						for(var j=0;j< data[i].options[0].fuel.length;j++){
							if(data[i].options[0].fuel[j].selected){
								$scope.printObj.fuelSelect = data[i].options[0].fuel[j].instructionNotes;
								$scope.printObj.instructionId = data[i].options[0].fuel[j].instructionId;
								break;
							}
						}
					}
				}
			}
			
		 });
	}
	$scope.printObj.custDDShowFn = function(txt){
		$scope.printObj.custDDShow = '';
		$scope.printObj.custDDShow = txt;
	}
	$scope.printObj.custDDSelection = function(op,optxt,opNote,id){		
		$scope.printObj.custDDShow = '';
		if( op == 'opCond'){
			$scope.printObj.opcondSelect = opNote;
			$scope.printObj.operatingConditionId = id
		}
		else{
			$scope.printObj.fuelSelect = opNote;
			$scope.printObj.instructionId = id;
		}
	}
	$scope.printObj.selectAll = function(selectVal){
		$scope.printObj.serviceHistory = false;
		angular.forEach($scope.printObj.data, function (item) {
			if(item.hasOwnProperty('selected'))
				item.selected = !selectVal;			
			if(item.options){
				angular.forEach(item.options, function (subItem) {					
					subItem.selected = !selectVal;
					if(subItem.checkOps){
						angular.forEach(subItem.checkOps, function (ssubItem) {
						if(ssubItem.hasOwnProperty("selected"))
								ssubItem.selected = !selectVal;
						});
					}
				});
			}
        });
		
	
	}	
	$scope.printObj.optionToggledChild = function(sh,idx){
		if(sh){
			$scope.printObj.data[0].selected = false;			
		}
		else{
			//$scope.printObj.data[0].selected = false;
			$scope.printObj.serviceHistory = true;
		}			
	}
	$scope.printObj.optionToggled = function(sh,idx){
		if(idx)
			$scope.printObj.serviceHistory = !sh;
		if(!sh){			
			angular.forEach(idx, function (subItem) {	
						$scope.printObj.serviceHistory = !sh;
						if(subItem.selected){subItem.selected = false}
					});
		}
		if(sh){
			$scope.printObj.data[0].selected = false;	
						
		}		
	}
	
	$scope.displayPrintError = false;
	$scope.printObj.printSubmit = function(clkOp,toAddr,ccAddr){
		var selectedBox = [];
		var serviceHisCount = true;
		angular.forEach($scope.printObj.data, function (item, index) {
				if(item.selected){          
					selectedBox.push(item.moduleName);
				}				
				angular.forEach(item.options, function (subItem) {					
					if(subItem.selected){selectedBox.push(subItem.moduleName);
					if(subItem.hasOwnProperty("collapse")){
						if(subItem.moduleDisplayName == 'Service History')
							$scope.printObj.shCollapse = subItem.collapse;
						else if(subItem.moduleDisplayName == 'Scheduled Maintenance')
							$scope.printObj.smCollapse = subItem.collapse;
						else if(subItem.moduleDisplayName == '')
							$scope.printObj.mailCollapse = subItem.collapse;
					}
					angular.forEach(subItem.radioOps, function (rItem) {					
						if(rItem.moduleDisplayName == subItem.enabledForm){ selectedBox.push(rItem.moduleName);
						
						}
					});
					angular.forEach(subItem.checkOps, function (cItem,index) {						
						if(cItem.selected){ selectedBox.push(cItem.moduleName);serviceHisCount = false;
						}
					});
					}						
				});
							
        });
		
		console.log(selectedBox,"**","serviceHisCount ",serviceHisCount," $scope.printObj.serviceHistory",$scope.printObj.serviceHistory)
		if(serviceHisCount && $scope.printObj.serviceHistory){ 
			$scope.showPlatformAlert("Please select at least one source option (NSH, Warranty(Including Goodwill) or Goodwill Only) for Service History. Selecting both NSH and Warranty(Including Goodwill) provides the most information");
			}
		else if(selectedBox.length){	
			if($scope.printObj.instructionId)selectedBox.push({"fuel":$scope.printObj.instructionId});
			if($scope.printObj.operatingConditionId)selectedBox.push({"opCond":$scope.printObj.operatingConditionId});
			selectedBox.push({"shCollapse":$scope.printObj.shCollapse});
			selectedBox.push({"smCollapse":$scope.printObj.smCollapse});
			selectedBox.push({"mailCollapse":$scope.printObj.mailCollapse});
			if(clkOp == 'sendMail'){
				var toSender = toAddr.replace(/\s/g, '');
				var ccSender = ccAddr.replace(/\s/g, '');
				var pattern=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				var suffix = ";";
				console.log(toAddr," ",toSender.length>0);
				$scope.printObj.sendMail = {tostatus: true,ccstatus: true};
				if(toSender.length > 0){
					toSender = toSender.replace(/,/g, ";");
					var tochck = toSender.indexOf(suffix, toSender.length - suffix.length);
					if (tochck == -1) toSender = toSender.concat(";");					
					var tocomma = toSender.split(';');
					if (tocomma.length >= 1) {
						for ( var i = 0; i < tocomma.length - 1; i++) {
							var tocommavar = new String(tocomma[i]);
							if(i==0 && tocommavar==""){
								  $scope.printObj.sendMail.tostatus = false;
							}
							if(tocommavar==""){
								 continue;
							}
							if (!pattern.test(tocommavar)) {
								$scope.printObj.sendMail.tostatus = false;
							}
							
						}
					}
				}
				else
					$scope.printObj.sendMail.tostatus = false;
				if (ccSender.length > 0) {
					ccSender = ccSender.replace(/,/g, ";");
					 var ccchck = ccSender.indexOf(suffix, ccSender.length - suffix.length);
					if (ccchck == -1) ccSender = ccSender.concat(";");
					var cccomma = ccSender.split(';');
					if (cccomma.length >= 1) {
						for ( var i = 0; i < cccomma.length - 1; i++) {
							var cccommavar = new String(cccomma[i]);
								if(i==0 && cccommavar==""){
									$scope.printObj.sendMail.tostatus = false;
								 }
								 if(cccommavar==""){
									continue;
								 }
								 if (!pattern.test(cccommavar)) {
									 $scope.printObj.sendMail.ccstatus = false;
								 }
							}
						}
				}
				if($scope.printObj.sendMail.ccstatus == false ||  $scope.printObj.sendMail.tostatus == false)
				{
					$scope.showPlatformAlert('You have entered invalid email address. You must correct the highlighted error(s) before proceeding');
					$scope.displayPrintError = true;
				}

				if($scope.printObj.sendMail.ccstatus && $scope.printObj.sendMail.tostatus) 
					$scope.printObj.callBackPrint(selectedBox,clkOp,toSender,ccSender);
				else return false;
								
			}else				
				$scope.printObj.callBackPrint(selectedBox,clkOp);
			
		}
		else{
			$scope.showPlatformAlert("Please select at least one item");
			}	
	}
	$scope.showPlatformAlert = function(msg){
		if (windowsCheck){
			var windArrAlert = ["navigatoralert",msg,""];
					window.external.notify(JSON.stringify(windArrAlert));				
			}
			else{
				alert(msg);
			}
	}
	
	$scope.printObj.callBackPrint = function(sBox, clkOp,toSender,ccSender){
		angular.element("#printLoading").show();
		angular.element("#printOverlay").show();
		var opGoing = true;
		mainService.printFormSubmit(sBox,clkOp).then(function(data) {	
				var nocache = new Date().getTime();				
				$scope.$broadcast("refresh");				
				if(clkOp == 'Export'){
						$scope.printObj.exportUrl = "/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf';
							data = encodeURI(data);
						//$scope.showPrintView = false;	
						console.log("https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf&attachmentType=inline');	
						var downloadDate = new Date();
						var exportTime ="";
						var exportTime = downloadDate.getMonth()+1+""+downloadDate.getDate()+""+downloadDate.getFullYear();	
					if (windowsCheck){
						angular.element("#printLoading").hide();
						angular.element("#printOverlay").hide();
						var windArrExport = ["filetransfer","https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf&attachmentType=inline',$scope.inputValue,document.domain,false];
						window.external.notify(JSON.stringify(windArrExport));
					}
					else if(/(iPhone|iPod|iPad)/.test(navigator.userAgent) || /Android|webOS|IEMobile/i.test(navigator.userAgent)){
						var monopdfurl = "https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf&attachmentType=inline';
						var strUrlpdfappend = "https://"+document.domain+"/serviceLane/staticcontent/pdfjs-1.7.225-dist/web/viewer.html?file="+encodeURIComponent(monopdfurl);
						document.addEventListener('deviceready', function(){
						var popup = window.open(strUrlpdfappend, "_blank", "location=yes,hidden=yes");
						popup.addEventListener("loadstop", function() {
						popup.show(); 
						angular.element("#printLoading").hide();
						angular.element("#printOverlay").hide();
						}, false);
						});
					}
					else {
						var monopdfurl = "https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf&attachmentType=inline';
						window.open(monopdfurl, "_blank", "location=yes,toolbar=yes,hidden=yes");
						angular.element("#printLoading").hide();
						angular.element("#printOverlay").hide();
					}
						
				}
				else if(clkOp == 'Print'){
					if (windowsCheck){
						angular.element("#printLoading").hide();
						angular.element("#printOverlay").hide();
						data = encodeURI(data);
						var windArrExport = ["fileprint","https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache,$scope.inputValue];
						window.external.notify(JSON.stringify(windArrExport));
					}
					else{
						data = encodeURI(data);
						$scope.printObj.exportUrl = "/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&RenderOutputType=pdf';
						console.log($scope.printObj.exportUrl);
						document.addEventListener('deviceready',function(){
							cordova.plugins.printer.print("https://"+document.domain+"/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache, 'BB!!!', function () {
							  // alert('printing finished or canceled');
							var scope = angular.element(
							document.
							getElementById("containerWrap")).
							scope();
							scope.$apply(function () {
								scope.showPrintView = false;
								scope.dealPopUp = false;
							});
							});
						}, false);
					}

					}
				else if(clkOp == 'sendMail'){					
					$scope.printObj.sendMail = "/serviceLane/faces/pages/asm/mobile/printview/PrintVehicleOneViewPdf.jsp?preview=yes&"+data+'&cache='+nocache+'&QuickMail=true&RenderOutputType=pdf&toValue='+toSender+'&ccValue='+ccSender;					
					 $http.post($scope.printObj.sendMail, data).success(function(data, status) {
						angular.element("#printLoading").hide();
					angular.element("#printOverlay").hide();
						console.log("send Mail success");
						$scope.showPrintView = false;
						$scope.dealPopUp = false;
					});
				}			
				else{
					$scope.printObj.previewUrl = "/serviceLane/faces/pages/asm/mobile/printview/printVehicleOneView.jsp?preview=yes&"+data+'&cache='+nocache;
					$scope.showPrintPreview = true;					
				}
			});		
	}
	$scope.printObj.printDiv = function(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;        
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}	
	$scope.printObj.backToPreview = function(){
		$scope.showPrintPreview = false;
	}
	$scope.showReprogramming = function(){
		$scope.reprogObj = {data:''};
		$scope.isLoading.loadimage = true;
		mainService.getReprogrammingData().then(function(data) {
		$scope.reprogObj.data = data;
			if(data.hasOwnProperty("error")){
				$scope.reprogView = true;
				$scope.isLoading.loadimage = false;
				$scope.reprogObj.flatTireErr = true;
			}
			else if($scope.reprogObj.data.hasOwnProperty('errorMsg') && $scope.reprogObj.data.errorMsg != 'N/A'){
					$scope.reprogObj.data.reprogErr = true;
				}
			else{
				console.log("calling");
				$scope.reprogView = true;
				$scope.isLoading.loadimage = false;
			}	
		 });
	}
	$scope.extendedMenu = function(){
		$scope.extendLeftMenu.show = true;
		if($scope.DMY.selDMYType == 'VIN' && $scope.inputValue){
			mainService.getExtendedLeftNavData($scope.inputValue).then(function(ndata) {
				$scope.extendLeftMenu.data = ndata;
			});
		}			  
	}
	$scope.dynamicLeftScroll = function(val){
			$scope.extendLeftMenu.scroll = val;
			console.log($scope.extendLeftMenu.scroll);
		 
	};	
	if (windowsCheck){
		window.addEventListener("resize", function () {
			//alert("windows");
	//$scope.showPlatformAlert(window.innerWidth +"    "+window.innerHeight);
	$( 'select' ).blur();
	angular.element(".customeDesc").css('display','none');	
	$scope.smData.custDDShow = false;
	$scope.nextServiceApt.custDDShow = '';
	if(window.innerWidth == 800 || window.innerWidth == 1280) {

				angular.element(".tooltipPopUp").css('visibility','hidden');		
				angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
				angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
				angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
				angular.element(".balloonstyle").css('visibility','hidden');
				
				//angular.element("#popUpOverlay").css('display','none');
				//$scope.dealPopUp = false;
				$scope.smData.showSMData = false;
				$timeout( function() {			
					if(!$scope.smData.showSMGrid && $scope.smData.smInfo.scheduledMaintenanceData.sliderData.length && $scope.selectedLeftTopMenu == 'sm' && !$scope.footerFeedback){	
						//alert("true");
						$scope.smData.bindSMInfo();
					}
				},100);		
				
				if (/(iPhone|iPod|iPad)/.test(navigator.userAgent)) {
				$scope.blurTheVinInputFeedback();
				}
			 }
		});
	}
});