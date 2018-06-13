asmControllers.controller('vehInfoController', function($scope, mainService, $filter, $location,$rootScope){
       $rootScope.isServiceCallMade = false;  
       var bindVinInfo = function(){
              if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
              else{
                  $scope.showConcurrent();
                     mainService.getVehicleInfoData($scope.inputValue).then(function(data) {
                           $scope.resetLeftMenu();          
                           $scope.isLoading.loadimage = false;           
                           $rootScope.showData = true;
                           $scope.vehicleInfo = data;
                           if(data.hasOwnProperty('error')){
                                  $rootScope.sysError = true;
                                  $rootScope.content = true;
                                  $rootScope.showData = false;
                                  $rootScope.defaultMessage = false;
                                  $rootScope.showInfo = true;
                                  $scope.leftMenu.vehicleInfo = false;
                                  $scope.leftMenu.serviceCampaign = false;
                           } else {
                                  $scope.campaign = false;
                                  $rootScope.sysError = false;
                                  $rootScope.showInfo = false;
                           if(data.engineOil != 'N/A'){
                                  $scope.tempEngineOil = (data.engineOil).split(',');
                           }
                           else {
                                  $scope.tempEngineOil = 'N/A';
                           }
                           if($scope.vehicleInfo.prefferedDealer != 'N/A'){
                                  var splitVal = $scope.vehicleInfo.prefferedDealer.split('(');
                                  $scope.vehicleInfo.preDealerN = splitVal[0].replace(/[\s]/g, '');
                                  $scope.vehicleInfo.preDealerC = splitVal[1].replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '');
                           }
                                  if($scope.hideCareTab){
                                         $rootScope.showData = false;
                                         $scope.selectedMenu = 'vinInfo';                                   
                                  }
                           }

                           $scope.dealerCode = data.originalSellingDealerCode;                      
                           /*if(data.engineOilType){
                                  $scope.tempEngineOil = (data.engineOilType).split(',');
                           }*/                        
                     });    
              }
       }
       var nextServiceDate = function(splIns,opCond){
              $scope.isLoading.loadimage = true;
              $scope.nextServiceApt.submitted = false;
              mainService.getNextServiceApt($scope.inputValue,splIns,opCond).then(function(data) {
                     $scope.isLoading.loadimage = false;
                     $scope.nextServiceApt.overlay = true;
                     $scope.nextServiceApt.issuePopup = true;
                     if(data.hasOwnProperty("error")){                           
                           $scope.nextServiceApt.flatTireErr =true;
                     }
                     else{
                           $scope.nextServiceApt.flatTireErr =false;
                           $scope.nextServiceApt.custDDShow = '';
                           $scope.nextServiceApt.data = data;
						    $scope.nextServiceApt.showMessage=false;
							if($scope.nextServiceApt.data.lastService != "")
							{
								$scope.nextServiceApt.data.lastService = $filter('date')(new Date($scope.nextServiceApt.data.lastService),"MM/dd/yyyy ");
							}                           						  
                           for(var x=0;x<data.splIns.length;x++){
                                  if(data.splIns[x].selected){     
                                         $scope.nextServiceApt.splInsSelected = data.splIns[x];                                               
                                  }
                           }
                           for(var x=0;x<data.operatingCondition.length;x++){
                                  if(data.operatingCondition[x].selected){      
                                         $scope.nextServiceApt.opCondSelected = data.operatingCondition[x];                                           
                                  }
                           }
                     }                   
              });                 
       };     
       
       $scope.nextServiceAptCal = function(){
              nextServiceDate();  
       };
       $scope.nextServiceApt.custDDShowFn = function(txt){
              $scope.nextServiceApt.custDDShow = '';
              $scope.nextServiceApt.custDDShow = txt;       
       };
       $scope.nextServiceApt.custDDSelection = function(op,id){          
             $scope.nextServiceApt.custDDShow = '';        
             if(op == 'splIns'){
                    $scope.isLoading.loadimage = true;
					$scope.nextServiceApt.submitted = false;
					mainService.getNextServiceApt($scope.inputValue,id,$scope.nextServiceApt.opCondSelected.operatingConditionId).then(function(data) {
                     $scope.isLoading.loadimage = false;
                     //$scope.nextServiceApt.overlay = true;
                     //$scope.nextServiceApt.issuePopup = true;
                     if(data.hasOwnProperty("error")){                           
                           $scope.nextServiceApt.flatTireErr =true;
                     }
                     else{
                           $scope.nextServiceApt.flatTireErr =false;
                           //$scope.nextServiceApt.custDDShow = '';
                           $scope.nextServiceApt.data.recommendedService = data.recommendedService;
						   $scope.nextServiceApt.showMessage=false;   
                           for(var x=0;x<data.splIns.length;x++){
                                  if(data.splIns[x].selected){     
                                         $scope.nextServiceApt.splInsSelected = data.splIns[x];                                               
                                  }
                           }
                           for(var x=0;x<data.operatingCondition.length;x++){
                                  if(data.operatingCondition[x].selected){      
                                         $scope.nextServiceApt.opCondSelected = data.operatingCondition[x];                                           
                                  }
                           }
                     }                   
				});    
              }
			  if( op == 'opCond'){
					$scope.isLoading.loadimage = true;
					$scope.nextServiceApt.submitted = false;
					mainService.getNextServiceApt($scope.inputValue,$scope.nextServiceApt.splInsSelected.splInsId,id).then(function(data) {
                     $scope.isLoading.loadimage = false;                   
                     if(data.hasOwnProperty("error")){                           
                           $scope.nextServiceApt.flatTireErr =true;
                     }
                     else{
                           $scope.nextServiceApt.flatTireErr =false;
                           //$scope.nextServiceApt.custDDShow = '';
                           $scope.nextServiceApt.data.recommendedService = data.recommendedService;
						   $scope.nextServiceApt.showMessage=false;   
                           for(var x=0;x<data.splIns.length;x++){
                                  if(data.splIns[x].selected){     
                                         $scope.nextServiceApt.splInsSelected = data.splIns[x];                                               
                                  }
                           }
                           for(var x=0;x<data.operatingCondition.length;x++){
                                  if(data.operatingCondition[x].selected){      
                                         $scope.nextServiceApt.opCondSelected = data.operatingCondition[x];                                           
                                  }
                           }
                     }                   
				});    
            }
       };
       $scope.nextServiceApt.vinInfo = function()
       {
		    $scope.isLoading.loadimage = true;
            bindVinInfo();
       }
       $scope.nextServiceApt.reCalc = function(){           
              if($scope.nextServiceApt.data.lastService == '' || $scope.nextServiceApt.data.currentMileage == null || $scope.nextServiceApt.data.currentMileage == '' )
              {      
                     $scope.nextServiceApt.submitted = true;
                     $scope.nextServiceApt.showMessage=true;              
              }
              else{               
                   var fieldvalues = { vin: $scope.inputValue,dofu : $scope.nextServiceApt.data.dofu,
				   lastService:$scope.nextServiceApt.data.lastService,miles: $scope.nextServiceApt.data.currentMileage,
				   splInsId: $scope.nextServiceApt.splInsSelected.splInsId,opINsId: $scope.nextServiceApt.opCondSelected.operatingConditionId,recommendService: $scope.nextServiceApt.data.recommendedService
                               };
                     $scope.nextServiceApt.submitted = false;
                     calculateServiceDate(fieldvalues);
                     $scope.nextServiceApt.showMessage = false;
              }      
       };     
       var calculateServiceDate = function(fields){
              mainService.getRecalculatedDate(fields).then(function(data) {     
                     if(data.hasOwnProperty("error")){
                           $scope.nextServiceApt.flatTireErr =true;
                     }                    
                     else{
                           $scope.nextServiceAptCal();                    
                     }        
              });
		};
       var bindVehiSpec = function(){
            $scope.showConcurrent();
              if(!$scope.inputValue){ $rootScope.defaultMessage = true; return;}
              else{
                     mainService.getVehiSpecData($scope.inputValue).then(function(data) {
                           $scope.resetLeftMenu();          
                           $scope.isLoading.loadimage = false;           
                           $rootScope.showData = true;
                           $scope.vehicleSpecInfo = data;
                           
                           
                           if(data.hasOwnProperty('error')){
                                  $rootScope.sysError = true;
                                  $rootScope.content = true;
                                  $rootScope.showData = false;
                                  $rootScope.defaultMessage = false;
                                  $rootScope.showInfo = true;
                                  $scope.leftMenu.vehicleSpecInfo = false;
                                  $scope.leftMenu.serviceCampaign = false;      
                           }
                           else{
                                  $scope.campaign = false;
                                  $rootScope.sysError = false;
                                  $rootScope.showInfo = false;
                           }                          
                           if(data.transOil != 'N/A'){
                                  $scope.tempTransOil = (data.transOil.split(','));
                           }
                                  
                     });    
              }
       }
       
    $scope.checkDiv = function(e) {
              $("#" + $scope.currentElm).trigger("click");
        $("#overlayDealer").toggleClass("hide");
    };
       //console.log("$scope.isUserBlocked",$scope.isUserBlocked);
       if(!$scope.isUserBlocked){
              if($scope.selectedMenu == 'vspec'){
                     bindVehiSpec();
              }else{
                     bindVinInfo();
              }
              $scope.isLoading.loadimage = true;
       }
       
       
       
       
       
       $scope.$on('bindVinInfo', function() { bindVinInfo(); });
});
