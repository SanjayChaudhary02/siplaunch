asmControllers.controller('warrantyController', function($scope, mainService, $location, $http,$rootScope, $timeout){  	
    if(!$scope.inputValue){ $location.path("/"); return;}
	$scope.selectedItem = {};
	var bindWarInfo = function(){ 
		$scope.cspCount = $scope.leftMenu.cspCount;
		$scope.resetLeftMenu();
		$rootScope.warrantySecions = true;
		$scope.preOwnedContent();
		$scope.graphConfig = function(desc){			
				
			
		}		
	}	
	$scope.selectOption = function(sVal) {
		$scope.selectedItem.selVal = sVal;
		$scope.getVehicleContent();
	};	
	$scope.preOwnedContent = function(d){ 
		$scope.showConcurrent();
		//if($scope.leftMenu.TCUVIndicator){
			mainService.getPreOwnedWarrantyData($scope.inputValue).then(function(data) {
				$scope.TcuvRetailedDealerErrorMsg = false;
				$scope.isLoading.loadimage = false;
				$scope.preOwnErr = false;
				$scope.TcuvDofuErrorMsg = false;
				if(data.hasOwnProperty('error')){
					$scope.preOwnErr = true;
				}				
				else if(data.PreOwnedWarrantyJSON.hasOwnProperty('ownerName')){	
					
					if(data.TcuvRetailedDealer== 'N/A')
						$scope.TcuvRetailedDealerErrorMsg = true;
					if(data.TcuvDofu== 'N/A')
						$scope.TcuvDofuErrorMsg = true;
					$scope.preownedInfo = data.PreOwnedWarrantyJSON;
					$scope.data = $scope.preownedInfo.graph;
					$scope.pHeight = ($scope.data[0].totalRowCount) * 27.875 + 72;
					$scope.mileage = $scope.preownedInfo.lastKnownMileage;				
					//$scope.graphConfig('preowned');
					$scope.options = {
					chart: {
						type: 'multiBarHorizontalChart',
						showControls: false,
						useInteractiveGuideline: true,
						showValues: true,
						margin : {
							top: 20,
							right: 75,
							bottom: 50,
							left: 10
						},
						x: function(d, i){return i;},
						y: function(d){return d[1];},
						valueFormat: function(d){						
								return d3.format(',d')(d);
						},
						transitionDuration: 250,
						xAxis: {
							showMaxMin: false,					
							staggerLabels: false,
							tickValues: 0
						},
						yAxis:{
							axisLabel: "Mileage",
							showMaxMin: false,
							tickFormat: function(d){
								return d3.format(',s')(d); 
							},
							tickPadding: 17
						},
						tooltips: false,
						showLegend: false,
						stacked: false,
						interactive:true
						
					}
				};
				
					if(d && d.isRefresh)
						$scope.$broadcast('refreshMileageLine', { data:$scope.preownedInfo.graph, mileage : $scope.preownedInfo.lastKnownMileage});
				}
			});
		//}
	}

	$scope.vehicleSec = true;
    $scope.getVehicleContent = function(d){
		$scope.isLoading.loadimage = true;	
		var idx = 0;
		$scope.showConcurrent(); 
		if($scope.selectedItem.selVal)
			idx = 1;			
    	mainService.getVehicleWarrantyData($scope.selectedItem.selVal||$scope.inputValue, idx).then(function(data) {	
			$scope.vehicleErrorMsg = false;
			$scope.isLoading.loadimage = false;
			$scope.vehicleSec = false;
			if(data.hasOwnProperty('error'))
				$scope.vehicleErrorMsg = true;
			else{
					$scope.mileageData = data;
					$scope.mileageData.salvage = {data: '' , error: false, isSalvage : false}
					if ($scope.salvageCheck){	
						mainService.getIsSalvage($scope.inputValue).then(function(data) {						
							$scope.mileageData.salvage.isSalvage = data.isSalvage;
							if(data.hasOwnProperty("error")){					
								$scope.mileageData.salvage.error = true;
							}
							else {				
								$scope.mileageData.salvage.error = false;
								$scope.mileageData.salvage.data = data;						
							}
						});
					}
					$scope.data1 = !data.standardWarrantyObjectEmpty ? $scope.mileageData.graph :null;	
					$scope.vHeight = (data.graph[0].totalRowCount) * 27.875 + 72;
					$scope.mileage = $scope.mileageData.lastKnownMileage;								
					$scope.selectedItem.selVal = $scope.mileageData.usrState;
					$scope.options1 = {
				chart: {
					type: 'multiBarHorizontalChart',
					showControls: false,
					useInteractiveGuideline: true,
					showValues: true,
					margin : {
						top: 20,
						right: 75,
						bottom: 50,
						left: 10
					},
					x: function(d, i){return i;},
					y: function(d){return d[1];},
					valueFormat: function(d){						
							return d3.format(',s')(d);
					},
					transitionDuration: 250,
					xAxis: {
						showMaxMin: false,					
						staggerLabels: false,
						tickValues: 0
					},
					yAxis:{
						axisLabel: "Mileage",
						showMaxMin: false,
						tickFormat: function(d){
							return d3.format(',s')(d); 
						},
						tickPadding: 17
					},
					tooltips: false,
					showLegend: false,
					stacked: false,
					interactive:true
					
				}
			};
					if(d && d.isRefresh)
						$scope.$broadcast('refreshMileageLine2', { data:$scope.mileageData.graph, mileage : $scope.mileageData.lastKnownMileage});				
					
				}
			
		});	
    }
	$scope.cspContent = function(){ 
	$scope.isLoading.loadimage = true;
		$scope.cspCount = $scope.leftMenu.cspCount;
		
		mainService.getCspData($scope.inputValue).then(function(data) {
			$scope.cspErrorMsg = false;
			$scope.isLoading.loadimage = false;
			if(data.hasOwnProperty('error') || data.hasOwnProperty('errorMsg')){
				$scope.cspErrorMsg = true;
				if(data.hasOwnProperty('errorMsg'))
					$scope.errorNull = true
			}
			else{
				$scope.cspObj = data.serviceCampaigns;
				if($scope.cspObj.length > 0)
					{
						for(i in $scope.cspObj)
						{
						if($scope.cspObj[i].detailMemo.length > 235)
							{
							$scope.cspObj[i].temptooltipclass = 'tooltipPopUpCSPBottomline';
							}
						else
							
							{
							$scope.cspObj[i].temptooltipclass = 'tooltipPopUp';
							}
						}
					}

			}
		});
	}	
	$scope.campDocList = function(id,$event){	
		$rootScope.campaignDoc = true;			
		$scope.listCunt = 3;
		var idx = id.split("_");
		$scope.documentObj = $scope.cspObj[idx[1]].t3DocumentList;
		var evtobj = window.event ? window.event : e
		displayballoontip($event.target, evtobj,1);	
		
	};	
	$scope.showMore = function(op){
		if(op == "more")
			$scope.listCunt = $scope.documentObj.length;			
		if(op == "less")
			$scope.listCunt = 3;
	};
	$scope.isopen = {
        first: true,
        second: false,
		third: false
      }	 
	$scope.icon = {
        "false": 'icon-plus-sign',
        "true": 'icon-minus-sign'
      }
	if(!$scope.isUserBlocked){
		$rootScope.content = false;		
		bindWarInfo();	
		$scope.isLoading.loadimage = true;		
		
	}
	$scope.$on('bindWarInfo', function(event, passedData) {
		$scope.selectedItem.selVal  = '';
		$scope.isopen.third = false;
		if(!$scope.leftMenu.TCUVIndicator){			
			$scope.isopen.first = false;
			$scope.isopen.second = true;			
		}else{
			$scope.isopen.first = true;
			$scope.isopen.second = false;
		}		

		if($scope.isopen.first) $scope.preOwnedContent(passedData);
		if($scope.isopen.second)$scope.getVehicleContent(passedData);
		if($scope.isopen.third) $scope.cspContent(); 
		
	});
	$scope.$watch('isopen', function(event, passedData) {	
		if(!$scope.leftMenu.TCUVIndicator && $scope.vehicleSec){
			$scope.isopen.second = true;
		}	
		if($scope.isopen.first) $scope.preOwnedContent(passedData);
		if($scope.isopen.second)$scope.getVehicleContent(passedData);
		if($scope.isopen.third)$scope.cspContent(); 
	},true);
	
	
});
	