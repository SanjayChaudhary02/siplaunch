asmControllers.controller('kcController', function($scope, mainService, $location,$rootScope,$anchorScroll,$timeout){
	$scope.kcData.bindKcInfo = function(){
		$scope.thirdParty.val = true;
		$scope.kcData.noInput = false;
		
		//if(!$scope.inputValue){ $scope.kcData.noInput = true}
		if(!$scope.DMY.selDMYType){ $scope.kcData.noInput = true}
		else{
			//$scope.isLoading.loadimage = true;	
			$scope.kcData.loadimageCarInfo = true;
			$scope.kcData.loadimageInterview = true;	
			$scope.kcData.loadimageProdEdu = true;
		$scope.kcData.bindKcCarInfo("initial");		
		$scope.kcData.bindKcInterviewInfo("initial");	
		$scope.kcData.bindKcProdEduInfo("initial");	

		}
	};
	
	
	$scope.kcData.bindKcCarInfo = function(flag){
	 if(flag == "more"){$scope.isLoading.loadimage = true;}
		$scope.kcData.CarInfoFlatTireErr = false;
		$scope.kcData.kcCarInfoErr = false;
			$scope.showConcurrent(); 	
			mainService.getKcCarInfo(flag).then(function(data) {
				$scope.kcData.loadimageCarInfo = false;		
				 if(flag == "more"){$scope.isLoading.loadimage = false;}
				if(data.hasOwnProperty('error')){
					$scope.kcData.CarInfoFlatTireErr = true;	
				}else{
					
					$scope.kcData.kcCarInfo = data;
					console.log($scope.kcData.kcCarInfo);
					if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
						$scope.kcData.kcCarInfoErr = true;	
				}
			});

	};

	
	$scope.kcData.bindKcInterviewInfo = function(flag){
		 if(flag == "more"){$scope.isLoading.loadimage = true;}
		$scope.kcData.interviewFlatTireErr = false;
		$scope.kcData.kcInterviewErr = false;
		
		//alert("bindSMInfo");

			mainService.getKcInterviewInfo(flag).then(function(data) {
				 if(flag == "more"){$scope.isLoading.loadimage = false;}
				$scope.kcData.loadimageInterview = false;				
				if(data.hasOwnProperty('error')){
					$scope.kcData.interviewFlatTireErr = true;	
				}else{
					
					$scope.kcData.kcInterviewInfo = data;
					if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
						$scope.kcData.kcInterviewErr = true;	
				}
			});

	};
	
	$scope.kcData.bindKcProdEduInfo = function(flag){
		 if(flag == "more"){$scope.isLoading.loadimage = true;}
		$scope.kcData.prodEduFlatTireErr = false;
		$scope.kcData.prodEdukcErr = false;
		
	
			mainService.getKcProdEduInfo(flag).then(function(data) {
				 if(flag == "more"){$scope.isLoading.loadimage = false;}
				$scope.kcData.loadimageProdEdu = false;	
				if(flag == "initial"){
					
					/*$timeout(function(){
						if(!$scope.kcData.loadimageCarInfo && !$scope.kcData.loadimageInterview && !$scope.kcData.loadimageProdEdu){
							$scope.isLoading.loadimage = false;	
						}
			        }, 1000); */

			}
				
				if(data.hasOwnProperty('error')){
					$scope.kcData.prodEduFlatTireErr = true;	
				}else{
					
					$scope.kcData.kcProdEduInfo = data;
					if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
						$scope.kcData.prodEdukcErr = true;	
				}
			});

	};
	 
	if(!$scope.isUserBlocked){		
		$scope.kcData.bindKcInfo();		
	}
	$scope.$on('bindKCInfo', function() { 
		$scope.kcData.bindKcInfo();		
	});
	
});