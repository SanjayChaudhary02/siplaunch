
asmControllers.controller('fsproductController', function($scope, $sce,mainService, $location,$rootScope){ 
		$scope.productObj = {data: ''}
	$rootScope.isServiceCallMade = false;
	//$scope.$emit('showErrorMsg', {content :true, showMsgBox : true, msg : "", msgType : "Error", msgSubType : "" });
	var bindProductInfo = function(){
		if(!$scope.inputValue){ $rootScope.defaultMessage = true;	 return;}
		else{
			$scope.showConcurrent();
			mainService.getfsProductsData($scope.inputValue).then(function(data) {
				console.log("getProductData",data);
				$scope.resetLeftMenu();		
				$scope.isLoading.loadimage = false;
				$rootScope.product = true;
				$scope.productErr = false;
				$scope.productObj.data = data;
				if(data.hasOwnProperty('error')){
					$rootScope.content = true;
					$rootScope.showInfo = true;
					$rootScope.defaultMessage = false;		
					$rootScope.sysError = true;	
				}
				else if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A'){
					$scope.productErr = true;
				}else{
					console.log("calling");
				}
				
			});	
		}
	};	
	$scope.productObj.trustAsHtml = function(string) {
    return $sce.trustAsHtml(string);
};
	if(!$scope.isUserBlocked){
		bindProductInfo();
		$scope.isLoading.loadimage = true;
	}
	$scope.productObj.toggleFsAccordion = function(val){
		console.log("togg",$scope.productObj.data.FsProduct.TfsProductsList.length,val);
		for( var z=0; z< $scope.productObj.data.FsProduct.TfsProductsList.length;z++){
			$scope.productObj.data.FsProduct.TfsProductsList[z].collapse = val;
		}
	}
	$scope.$on('bindProductInfo', function(event, mass) { bindProductInfo();});
   
});