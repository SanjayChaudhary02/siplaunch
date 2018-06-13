asmControllers.controller('smController', function($scope, mainService, $location,$rootScope,$anchorScroll){	
	var fuel ='initial';
	var drivingCond ='initial';	
	var mileage ='initial';
	var etdEng='',etdTrans='',etdDriv='';
	var u,v,fuelDef='',s,opDef='';
	
	$scope.smData.bindSMInfo = function(){
		$scope.thirdParty.val = true;
		$scope.smData.noInput = false;
		$scope.smData.flatTireErr = false;
		$scope.smData.smErr = false;		
		$scope.smData.showSMGrid = false;
		$scope.smData.showSMData = false;
		$scope.smData.smDatashow = false;
		
		if(!$scope.DMY.selDMYType){ $scope.smData.noInput = true}
		else{
			$scope.isLoading.loadimage = true;
			$scope.showConcurrent();		
			mainService.getSM(fuel,drivingCond,mileage, etdEng, etdTrans,etdDriv).then(function(data) {
				$scope.isLoading.loadimage = false;				
				if(data.hasOwnProperty('error')){
					$scope.smData.flatTireErr = true;	
				}else{
					$scope.smData.smDatashow = true;
					$scope.smData.smInfo = data;					
					if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
						$scope.smData.smErr = true;	
					}
					$scope.smData.custEtdSelectedOp = data.scheduledMaintenanceData.showEtdDefOp;
					if($scope.smData.smInfo.scheduledMaintenanceData.showEtdDropDown && !$scope.smData.custEtdSelectedOp){
						$scope.smData.custDDShow = 'etd';
					}
					for(var x=0;x<data.scheduledMaintenanceData.fuel.length;x++){
						if(data.scheduledMaintenanceData.fuel[x].selected){	
							$scope.smData.custFuelSelectedOp = data.scheduledMaintenanceData.fuel[x].instructionDesc;
							if($scope.DMY.selDMYType != 'VIN'){
								fuelDef = data.scheduledMaintenanceData.fuel[x].instructionId;
							}
						}
					}
					for(var y=0;y<data.scheduledMaintenanceData.operatingCondition.length;y++){
						if(data.scheduledMaintenanceData.operatingCondition[x].selected){	
							$scope.smData.custDDFuelSelectedOp = data.scheduledMaintenanceData.operatingCondition[x].operatingConditionNotes;
							if($scope.DMY.selDMYType != 'VIN'){
								opDef = data.scheduledMaintenanceData.operatingCondition[x].operatingConditionId;
							}
						}
					}				
					if(data.scheduledMaintenanceData.sliderData){	
												
						for(var i=0;i<data.scheduledMaintenanceData.sliderData.length;i++){
							if(data.scheduledMaintenanceData.sliderData[i].isCurrent){							
								$scope.smData.selectedSMTab = parseInt(i);
								//mileage = data.scheduledMaintenanceData.sliderData[i].intervalMileage;
								if(window.innerWidth >= 840){
									if($scope.smData.selectedSMTab > 2)
										$scope.smData.CurrentItem = parseInt($scope.smData.selectedSMTab - 2);	
									else
										$scope.smData.CurrentItem = 0;
									break;
								}else{
									if($scope.smData.selectedSMTab > 1)
										$scope.smData.CurrentItem = parseInt($scope.smData.selectedSMTab - 1);	
									else
										$scope.smData.CurrentItem = 0;
									break;
								}
							}
							else{
							$scope.smData.CurrentItem = parseInt(data.scheduledMaintenanceData.sliderData.length -3);	
							$scope.smData.selectedSMTab = -1;	
							$scope.smData.disableRightArrow = 1;							
							}
						}
						
						$scope.smData.left = -92 * $scope.smData.CurrentItem;
					}
					if($scope.DMY.selDMYType !='VIN')
					{
						$scope.smData.isEnableApply = true;
						if($scope.smData.smInfo.scheduledMaintenanceData.showEtdDropDown && $scope.smData.smInfo.scheduledMaintenanceData.showEtdDefOp == "")
						{
							$scope.smData.mileageValue = "";
						}
					}
				}
			});

		}
	}

	$scope.smData.smTab = function(item,miles,mlgBoxVal){	
		mileage = miles;
		angular.element(".barVal a").removeClass("active");
		$scope.smData.selectedSMTab = item;
		$scope.smData.bindSMInfo();
		$scope.smData.mileageValue = mlgBoxVal;
	}
	$scope.smData.backToSM = function(mlgBoxVal){			
		$scope.smData.showSMGrid = false
		$scope.smData.flatTireErr = false;
		$scope.smData.bindSMInfo();
		$scope.smData.mileageValue = mlgBoxVal ;		
	}
	$scope.smData.smGridTab = function(sItem){
		if(s != sItem){
			s = sItem
			$scope.smData.selectedSMGridTab = sItem;
		}
		else{
			s = '';
			$scope.smData.selectedSMGridTab = '';	
		}			
		window.location.hash='   invalidid';return false;
	}
	
	$scope.smData.leftrightArrow = function(arrow) {
		console.log("leftrightArrow",arrow, $scope.smData.CurrentItem,$scope.smData.selectedSMTab);
		if(arrow == 'left'){
			if(window.innerWidth >= 840){
				//if($scope.smData.CurrentItem > 3)
					$scope.smData.CurrentItem = $scope.smData.CurrentItem - 4;
				//else $scope.smData.CurrentItem = $scope.smData.CurrentItem - $scope.smData.CurrentItem;				
			}else{
				if($scope.smData.CurrentItem > 1)
					$scope.smData.CurrentItem = $scope.smData.CurrentItem - 2;
				else $scope.smData.CurrentItem = $scope.smData.CurrentItem - $scope.smData.CurrentItem;
			}
		}
		if(arrow == 'right'){	
				if(window.innerWidth >= 840){
					$scope.smData.CurrentItem = $scope.smData.CurrentItem + 4;	
					$scope.smData.disableRightArrow = 3;
				}else{
				$scope.smData.CurrentItem = $scope.smData.CurrentItem + 2;	
					$scope.smData.disableRightArrow = 1;
				}
		}
		if($scope.smData.CurrentItem >-4 && $scope.smData.CurrentItem < 0){			
			$scope.smData.left = -92 * (4 + $scope.smData.CurrentItem);
		}
		else
			$scope.smData.left = -92 * $scope.smData.CurrentItem;
		console.log("leftrightArrow1",arrow, $scope.smData.CurrentItem,$scope.smData.left);	
	};
	
	$scope.smData.custDDShowFn = function(txt){
		$scope.smData.custDDShow = '';
		$scope.smData.custDDShow = txt;		
	}
	$scope.smData.applySM = function(mlg){
			drivingCond = u ? u : "initial";
			fuel = v ? v : "initial";			
			if($scope.DMY.selDMYType !='VIN' && !$scope.smData.custEtdSelectedOp)
			{
				$scope.showPlatformAlert("Please select an Engine Trans Drive combination to view the maintenance schedule");
			}
			else if($scope.DMY.selDMYType !='VIN' && $scope.smData.custEtdSelectedOp) 
			{
				if(typeof(mlg) == "string" || mlg == null)
				{
					$scope.showPlatformAlert("Please enter a  valid mileage value");
				}
				else if(typeof(mlg) == "number"){
					fuel = v ? v : fuelDef;	
					if($scope.dataMileage.mileage ==''){
						$scope.dataMileage = { mileage : 0,subVal:0};
						}
					mileage	= mlg;
					mainService.setMileageFormData(mlg).then(function(data) {
						$scope.smData.bindSMInfo();
						$scope.smData.mileageValue = mileage;
					});
				}
			}
			else if($scope.DMY.selDMYType =='VIN')
			{		
				mileage	= $scope.dataMileage.mileage;		
				$scope.smData.bindSMInfo();					
				$scope.smData.isEnableApply = false;
			}
	}
	$scope.smData.eyeNote = function(icon){
			$scope.smData.eyeNoteShow = icon;
	};
	$scope.smData.childEyeNote = function(p,c){
			$scope.smData.eyeNoteShow = 'smSpecialTask_'+p+'_'+c;
	};
	$scope.smData.isActiveChildEyeNote = function(pp,cc){
			var CE = 'smSpecialTask_'+pp+'_'+cc;
			return $scope.smData.eyeNoteShow === CE;
	};

	$scope.smData.removeHashinginpage =  function(){
		if (/(iPhone|iPod|iPad)/.test(navigator.userAgent) || /Android|webOS|IEMobile/i.test(navigator.userAgent)) {
				window.location.hash='   invalidid';return false;
				}

	};
	$scope.smData.custDDSelection = function(op,optxt,id,trans,drive,getMileage){		
		$scope.smData.custDDShow = '';
		fuel='initial';
		fuelDef='initial';
		opDef='initial';
		drivingCond='initial';
		$scope.smData.isEnableApply = true;
		if( op == 'opCond'){
			u = id;
			$scope.smData.custDDFuelSelectedOp = optxt;
		}
		if(op == 'fuel'){
			v = id;
			$scope.smData.custFuelSelectedOp = optxt;
		}
		if(op == 'etd'){
			etdEng = id ? id : "";
			etdTrans =trans ? trans : "";
			etdDriv =drive ? drive : "";
			mileage = getMileage ? getMileage : "";
			if($scope.smData.smInfo.scheduledMaintenanceData.showEtdDefOp == "" || 
				!$scope.smData.smInfo.scheduledMaintenanceData.miles && typeof(getMileage) == "number" )
			{
				mileage = "";
				$scope.smData.mileageValue = "";
			}
			else if($scope.smData.smInfo.scheduledMaintenanceData.miles){
				$scope.smData.mileageValue = parseInt($scope.smData.smInfo.scheduledMaintenanceData.miles);
			}
			$scope.smData.custEtdSelectedOp = id+", "+trans+", "+drive;
			$scope.smData.bindSMInfo();
			
		}
		
	}
	
	$scope.smData.showGrid = function(){
		$scope.smData.showSMData = false;
		$scope.isLoading.loadimage = true;	
		$scope.smData.showSMGrid = true;
		$scope.smData.flatTireErr = false;
		$scope.smData.selectedSMGridTab = '';
		$scope.showConcurrent();
		mainService.getsmGridInfo().then(function(data) {
			$scope.isLoading.loadimage = false;
			$scope.smData.smgridObj = data;
			if(data.hasOwnProperty('error')){
					$scope.smData.flatTireErr = true;	
				}
		});
	}
	if(!$scope.isUserBlocked){		
		$scope.smData.bindSMInfo();		
	}
	$scope.$on('bindSMInfo', function(event, mass) { 
		fuel ='initial';
		drivingCond ='initial';	
		mileage ='initial';
		etdEng='',etdTrans='',etdDriv='';
		$scope.smData.isEnableApply = false;		
		$scope.smData.bindSMInfo(); 
	
	});
	
});