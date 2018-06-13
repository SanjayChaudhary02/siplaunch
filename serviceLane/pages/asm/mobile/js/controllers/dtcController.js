asmControllers.controller('dtcController', function($scope, mainService, $location, $rootScope, Pagination) {
  var DtcListLen = 0;
  $scope.DTCRmLog = {show: false,data: "",flattire: false,displayRows:[5, 10, 25], rowPerPage: 10};
  $scope.dtcObj = {data: '',flattire: false,displayRows:[5, 10, 25],pageSize: 10, currentPage: 0,pages:[],prev:false,next:false,first:false,last:false,disabledHealthErrMsg:false,disabledDataReqErrMsg:false,selRmOp:''};
  var bindDtcInfo = function(type,land,sIdx,eIdx,lRwTech,lRwSer,next,prev,last,rwCunt,techCunt,sCount) {
    if (!$scope.inputValue) {
      $rootScope.defaultMessage = true;
      return;
    } else {
			$scope.showConcurrent();
      mainService.getDtcInfoData($scope.inputValue,type, land,sIdx,eIdx,lRwTech,lRwSer,next,prev,last,rwCunt,techCunt,sCount).then(function(data) {
		$scope.dtcObj.disabledHealthErrMsg = false;
		$scope.dtcObj.disabledDataReqErrMsg = false;
		$scope.dtcObj.rmtReportShow = false;
        $scope.resetLeftMenu();
        $scope.isLoading.loadimage = false;
        $scope.dtcObj.data = data;
        $scope.dtcObj.flattire = false;
        $scope.dtcObj.paginationCtrl = false;
        if (data.hasOwnProperty('error')) {
          $scope.dtcObj.flattire = true;
        }else {          
          //$scope.dtcObj.pages = [];		  
		  if(!data.hasOwnProperty("isRmDataReqNotApp")){
			  $scope.dtcObj.data.isRmDataReqNotApp = true
		  }
		  if(!data.hasOwnProperty("isRmHealthchkNotApp")){
			  $scope.dtcObj.data.isRmHealthchkNotApp = true
		  }
          var rows = "";  
			if($scope.dtcObj.data.totalCount < $scope.dtcObj.data.endIndex){
				$scope.dtcObj.data.endIndex = $scope.dtcObj.data.totalCount;
			}		  
          $scope.milliseconds = new Date().getTime();		  
          DtcListLen = $scope.dtcObj.data.totalCount;
          if (DtcListLen > 10)
            $scope.dtcObj.paginationCtrl = true;
           } 
      });
    }
  };
  $scope.paging = function(rows,navObj) {
            for (var i = 0; i < DtcListLen; i++) {
              $scope.dtcObj.pages.push(navObj);
            }
            if (!rows || rows == undefined) {
              console.log("rows ==> ", rows);
              rows = 10;
            } else {
              rows = parseInt(rows);
              $scope.dtcObj.pageSize = rows;
            }
            $scope.dtcObj.rowsPerPage = $scope.dtcObj.pageSize;
          };
	$scope.numberOfPages = function() {
          $scope.dtcObj.nOfPages = Math.ceil(DtcListLen / $scope.dtcObj.pageSize);
          return $scope.dtcObj.nOfPages;
        };
        $scope.currentPG = function() {
          $scope.dtcObj.lastPage = Math.ceil(DtcListLen / $scope.dtcObj.pageSize);

          return $scope.dtcObj.currentPage + 1;
        };
        $scope.gotoFirstPage = function() {
          $scope.dtcObj.currentPage = 0;
          return parseInt($scope.dtcObj.currentPage);
        };
        $scope.gotoPreviousPage = function() {
          $scope.dtcObj.currentPage = parseInt($scope.dtcObj.currentPage) - 1;
          return parseInt($scope.dtcObj.currentPage);
        };
        $scope.gotoNextPage = function() {
          $scope.dtcObj.currentPage = parseInt($scope.dtcObj.currentPage) + 1;
          return parseInt($scope.dtcObj.currentPage);
        };

        $scope.gotoLastPage = function() {
          $scope.dtcObj.lastPage = Math.ceil(DtcListLen / $scope.dtcObj.pageSize) - 1;
          $scope.dtcObj.currentPage = Math.ceil(DtcListLen / $scope.dtcObj.pageSize) - 1;

          return $scope.dtcObj.lastPage;
        };
        $scope.resultsFound = function() {
          DtcListLen;
          return DtcListLen;
        };

        $scope.fromRow = function() {
          return ($scope.dtcObj.currentPage * $scope.dtcObj.pageSize) + 1;
        };
        $scope.toRow = function() {
          //console.log(parseInt($scope.dtcObj.currentPage+1)+"=="+Math.ceil(DtcListLen/$scope.dtcObj.pageSize));
          if (DtcListLen < $scope.dtcObj.pageSize || $scope.dtcObj.currentPage == ($scope.dtcObj.lastPage - 1)) {

            return DtcListLen;
          } else {
            return parseInt($scope.dtcObj.currentPage * $scope.dtcObj.pageSize) + parseInt($scope.dtcObj.pageSize);
          }

        };
  $scope.changedValue = function(type,rows,status) {
	  if(type == 'dtcsource'){		  
		  $scope.dtcObj.pagnCtrl("first");
		  
	  }
	 else if(type == 'logDisplay1'){
			$scope.isLoading.loadimage = true;
			$scope.DTCRmLog.oldData=!$scope.DTCRmLog.oldData;
			bindDtcRmLogInfo(rows,status,$scope.DTCRmLog.oldData); 
			$scope.DTCRmLog.oldData=!$scope.DTCRmLog.oldData;
	 } 
	 else{
		if(type == 'logRow'){
			$scope.paging(parseInt(rows),$scope.DTCRmLog.data.RemoteLog);
			$scope.dtcObj.rowsPerPage = rows;
			$scope.dtcObj.currentPage = 0;
			$scope.dtcObj.pageSize = parseInt(rows);
			if ($scope.dtcObj.pageSize < DtcListLen){$scope.dtcObj.paginationCtrl = true;};	
			}
		else{
			//$scope.isLoading.loadimage = true;
			$scope.dtcObj.rowsPerPage = rows;
			$scope.dtcObj.pageSize = rows;
			$scope.numberOfPages();
			$scope.dtcObj.pagnCtrl("first");
			}
		 
		
				
	 }
  };
  if (!$scope.isUserBlocked) {
	  $scope.dtcObj.rowsPerPage = $scope.dtcObj.displayRows[1];
	  $scope.dtcObj.currentPage = 0;
    bindDtcInfo();
    $scope.isLoading.loadimage = true;
  }
  $scope.dtcObj.toggleDtcAccordion = function(val) {
    for (var z = 0; z < DtcListLen; z++) {
      if (val == true) {
        $scope.dtcObj.data.DtcList[z].collapse = true;
      } else {
        $scope.dtcObj.data.DtcList[z].collapse = false;
      }
    }
  };
  $scope.remReqChk = function(id){
	 $scope.dtcObj.disabledHealthErrMsg = false;
	 $scope.dtcObj.disabledDataReqErrMsg = false;
	 $scope.dtcObj.selRmOp = id;
	 var ConfMsg='';	 
		 
	if(id == 'healthCheck'){
		if($scope.dtcObj.data.isRmHealthchkNotApp){$scope.dtcObj.disabledHealthErrMsg = true;}
		else{ConfMsg = "Warning! You are about to invoke a live data pull from the vehicle. You should be in contact with/receive approval from the driver before proceeding with Remote Operations.\n\nHave you received approval from the driver and are you sure you want to proceed?";}		 
	}
	 if(id == 'dataRequest'){
		if($scope.dtcObj.data.isRmDataReqNotApp){$scope.dtcObj.disabledDataReqErrMsg = true;}
		else{ConfMsg = "Warning! You are about to invoke a live data pull that requires the driver to accept or decline on the vehicle's head unit. You should be in contact with/receive approval from the driver before proceeding with Remote Operations.\n\nHave you received approval from the driver and are you sure you want to proceed?";}			
	}
		
	if (ConfMsg && windowsCheck){		
		var windArrDTC = ["navigatorconfirm",ConfMsg,"DTC"];
		window.external.notify(JSON.stringify(windArrDTC));
			
	}
	else{
		if(ConfMsg && confirm(ConfMsg))
		{
			
			getRemoteHealthData(id);
		}
		return false;		
	} 
	 
 };
  var getRemoteHealthData = function(op){
	$scope.dtcObj.rmtReportShow = true; 
	$scope.isLoading.loadimage = true;	
	  mainService.getRemoteHealthData(op).then(function(data) {		
		  $scope.isLoading.loadimage = false;
		  if (data.hasOwnProperty('error')) {
			  $scope.dtcObj.flattire = true;
		  }else{
			$scope.dtcObj.rmtReportData = data;
			}
		});
  }
  $scope.showRmDataLog = function() {
    $scope.DTCRmLog.show = true;
    $scope.isLoading.loadimage = true;
	$scope.dtcObj.rowsPerPage = $scope.dtcObj.displayRows[1];
	$scope.dtcObj.currentPage = 0;	
	$scope.dtcObj.pageSize = 10;
	$scope.DTCRmLog.oldData = true;
	    bindDtcRmLogInfo();	
	
  };
  var bindDtcRmLogInfo = function(status, type,oldData) {
		$scope.showConcurrent();
    mainService.getRemoteReqLog ($scope.inputValue,status,type,oldData).then(function(data) {
		var RmLogListLen = 0;
		var rows = ""; 		 
      $scope.dtcObj.currentPage = 0;
      $scope.isLoading.loadimage = false;     
      $scope.DTCRmLog.flattire = false;	
      if(data.hasOwnProperty('error')) {
        $scope.DTCRmLog.flattire = true;
      }
      else{
	       $scope.DTCRmLog.data = data;
		   if($scope.DTCRmLog.data.RemoteLog){
			DtcListLen = $scope.DTCRmLog.data.RemoteLog.length;	
			if (DtcListLen > 10)
			$scope.dtcObj.paginationCtrl = true;
             }
      }

    });
  }; 
  $scope.showOlder = function(op1, op2) {
	  $scope.isLoading.loadimage = true; 
	  bindDtcRmLogInfo(op1,op2,$scope.DTCRmLog.oldData);
	  $scope.DTCRmLog.oldData = !$scope.DTCRmLog.oldData;
	 };
  $scope.back2Dtc = function() {
    $scope.DTCRmLog.show = false;
    $scope.isLoading.loadimage = true;
	$scope.dtcObj.rowsPerPage = $scope.dtcObj.displayRows[1];
	$scope.dtcObj.pageSize = 10;
	$scope.dtcObj.currentPage = 0;
    bindDtcInfo();
  };
  $scope.$on('bindDtcInfo', function(event, mass) {
	$scope.dtcObj.rowsPerPage = $scope.dtcObj.displayRows[1];
	$scope.dtcObj.currentPage = 0;
    bindDtcInfo();
  });
  $scope.$on('bindRemotehealthData', function(event, mass) {
	getRemoteHealthData($scope.dtcObj.selRmOp);
  });
  $scope.dtcObj.pagnCtrl = function(para){
	$scope.dtcObj.prev = false;  
	$scope.dtcObj.next = false;  
	$scope.dtcObj.first = false;  
	$scope.dtcObj.last = false;  
	var flag = true;
	$scope.isLoading.loadimage = true;
	if(para == 'first'){
		$scope.dtcObj.first = true; 
		$scope.dtcObj.data.startIndex = 1;
		$scope.dtcObj.data.endIndex = $scope.dtcObj.rowsPerPage;
		$scope.dtcObj.data.rowCount = $scope.dtcObj.rowsPerPage;
		$scope.dtcObj.data.lastRowService = 0;
		$scope.dtcObj.data.lastRowTech = 0;
		$scope.gotoFirstPage();
	}
	if(para == 'prev'){
		$scope.dtcObj.prev = true; 
		$scope.dtcObj.data.startIndex -= parseInt($scope.dtcObj.rowsPerPage);
		if($scope.dtcObj.data.startIndex <=1){
			$scope.dtcObj.data.startIndex =1;
			$scope.dtcObj.data.endIndex = $scope.dtcObj.rowsPerPage;
			flag = false;
			$scope.dtcObj.prev = false; 
		}
		if(flag){$scope.dtcObj.data.endIndex = (parseInt($scope.dtcObj.data.startIndex) + parseInt($scope.dtcObj.rowsPerPage)) -1;}
		$scope.gotoPreviousPage();
	}
	if(para == 'next'){
		$scope.dtcObj.next = true; 
		$scope.dtcObj.data.startIndex += parseInt($scope.dtcObj.rowsPerPage);
		if($scope.dtcObj.data.startIndex <=1){
			$scope.dtcObj.data.startIndex = 1;
			$scope.dtcObj.data.endIndex = $scope.dtcObj.rowsPerPage;
			flag = false;
			$scope.dtcObj.next = false; 
		}
		if(flag){
			$scope.dtcObj.data.endIndex = (parseInt($scope.dtcObj.data.startIndex) + parseInt($scope.dtcObj.rowsPerPage)) - 1;
			if($scope.dtcObj.data.totalCount < $scope.dtcObj.data.endIndex){
				$scope.dtcObj.data.endIndex = $scope.dtcObj.data.totalCount;
			}
			
		}
		$scope.gotoNextPage();
	}
	if(para == 'last'){
		$scope.dtcObj.last = true; 
		$scope.dtcObj.data.startIndex += parseInt($scope.dtcObj.rowsPerPage);
		if($scope.dtcObj.data.startIndex <=1){
			$scope.dtcObj.data.startIndex = 1;
			$scope.dtcObj.data.endIndex = $scope.dtcObj.rowsPerPage;
			flag = false;
			$scope.dtcObj.last = false; 
		}
		if(flag){
			$scope.dtcObj.data.endIndex = (parseInt($scope.dtcObj.data.startIndex) + parseInt($scope.dtcObj.rowsPerPage)) - 1;
			if($scope.dtcObj.data.totalCount < $scope.dtcObj.data.endIndex){
				$scope.dtcObj.data.endIndex = $scope.dtcObj.data.totalCount;
			}
		}
		$scope.gotoLastPage();
	}	
	bindDtcInfo($scope.dtcObj.data.defDisplayOp,true,$scope.dtcObj.data.startIndex,$scope.dtcObj.data.endIndex,$scope.dtcObj.data.lastRowTech,$scope.dtcObj.data.lastRowService,$scope.dtcObj.next,$scope.dtcObj.prev,$scope.dtcObj.last, $scope.dtcObj.data.rowCount,$scope.dtcObj.data.techCount,$scope.dtcObj.data.serviceCount);	
	
  };
});