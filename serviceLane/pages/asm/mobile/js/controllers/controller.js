// create angular controller to get Vehicle OneLiner
validationApp.controller('mainController', ['mainService', '$scope', '$http',
 function (mainService, $scope, $http){
	//show hide sections variable
	$scope.showMsg = false;
	//Show error message variable
	$scope.showError = false;
	//thresholdLimit Variable
	$scope.isThresholdReached=false;
	$scope.hideDiv = function(value){
		var vin = $scope.inputValue;
		vin = vin.toUpperCase();
		var isValid = is_valid_vin(vin);
		if(!angular.isDefined(value) || value == '' || !isValid){
 			$scope.showMsg = false;
 			$scope.showError = true;
 		}
	};
 	// function to submit the form after all validation has occurred			
		$scope.callMe = function() {
		console.log('22');
		var vin = $scope.inputValue;
	vin = vin.toUpperCase();
	var isValid = is_valid_vin(vin);
		if(isValid){
			mainService.getJsonData(vin).then(function (data) {
			$scope.vehicleInfo = {};
				$scope.showMsg = true;
				$scope.showError = false;
				$scope.vehOneLiner = data.vehOneLiner;//displaying the json data
				if($scope.vehOneLiner !="" && $scope.vehOneLiner!=null){
										mainService.getVehicleInfoData(vin).then(function (vdata) {
												$scope.vehicleInfo.dofu = vdata.dofu;
												$scope.dofu = vdata.dofu;
												$scope.tcuvDofu = vdata.tcuvDofu;
												$scope.tcuvRetailedDealer = vdata.tcuvRetailedDealer;
												$scope.tcuvDealerName = vdata.tcuvDealerName;
												$scope.originalSellingDealerCode = vdata.originalSellingDealerCode;
												$scope.originalSellingDealerName = vdata.originalSellingDealerName;
												$scope.engineOil = vdata.engineOil;
												$scope.transOil = vdata.transOil;
												$scope.xmStatus = vdata.xmStatus;
												$scope.towingCapacity = vdata.towingCapacity;
												$scope.towingCapacityUnit = vdata.towingCapacityUnit;
												$scope.telematicSystemStatusMap = vdata.telematicSystemStatusMap;
												$scope.fuelTypeHybrid = vdata.fuelTypeHybrid;
												
										});
				}
				
			});
		}
		else{
		
			$scope.showError = false;
		}
	};
	
	
	$scope.resetForm = function(){
		$scope.showMsg = false;
		$scope.showError = false;
	};
	
	
}]);
























































function is_valid_vin(vin) {
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
	