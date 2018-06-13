asmControllers.controller('librarySearchController', function($scope, mainService, $location,$rootScope,$anchorScroll,$timeout){
	$scope.lsData.windowsChecking = false;
	var bindLsInfo = function(searchFlag,morePortlet){
		$scope.lsData.suggestedWord = "";
		$scope.lsData.languages = [
		               {name:'English', lid:'en'},
		               {name:'French', lid:'fr'},
		               {name:'Spanish', lid:'es'} 
		           ];
		if(!$scope.lsData.tabName)
			$scope.lsData.tabName = 'summary';
		if(!$scope.lsData.searchWord && !$scope.lsData.mysearchword){
			$scope.lsData.searchWord = "";
			$scope.lsData.mysearchword = '';
		}
		else{
			if(searchFlag){
				$scope.lsData.mysearchword = $scope.lsData.searchWord;
			}
			else{
				if($scope.lsData.mysearchword)
					$scope.lsData.searchWord = $scope.lsData.mysearchword;
				else	
					$scope.lsData.searchWord = "";
			}
		}
		
		if(!$scope.lsData.language && !$scope.lsData.mylanguage){
			$scope.lsData.language = $scope.lsData.languages[0].lid;
			$scope.lsData.mylanguage = $scope.lsData.languages[0].lid;
		}
		else{
			if(searchFlag){
				$scope.lsData.mylanguage = $scope.lsData.language;
			}
			else{
				if($scope.lsData.mylanguage)
					$scope.lsData.language = $scope.lsData.mylanguage;
				else{
					$scope.lsData.language = $scope.lsData.languages[0].lid;
				}	
					
			}
		}
		$scope.thirdParty.val = true;
		$scope.lsData.noInput = false;
		$scope.showConcurrent(); 	
		
		if(!$scope.DMY.selDMYType){ $scope.lsData.noInput = true}
		else{
			if($scope.lsData.tabName == 'summary'){
				$scope.lsData.loadimageLsCampPub = true;
				$scope.lsData.loadimageLsSb = true;
				$scope.lsData.loadimageLsTt = true;
				$scope.lsData.bindLsCampPub("initial");		
				$scope.lsData.bindLsserviceBulletin("initial");	
				$scope.lsData.bindLsTechnicialTip("initial");
				
			}
		else if($scope.lsData.tabName == 'sc'){
			$scope.lsData.loadimageLsCampPub = true;
			morePortlet == "sc" ? $scope.lsData.bindLsCampPub("more") : $scope.lsData.bindLsCampPub("initial");		
			
		}
		else if($scope.lsData.tabName == 'ttsb'){

			if(morePortlet == "tt"){
				$scope.lsData.bindLsTechnicialTip("more");
				$scope.lsData.loadimageLsSb = true;
				$scope.lsData.bindLsserviceBulletin("initial");	
			} 
			else if(morePortlet == "sb"){
				$scope.lsData.bindLsserviceBulletin("more");
				$scope.lsData.loadimageLsTt = true;
				$scope.lsData.bindLsTechnicialTip("initial");
			}
			else {
				//alert("please god");
				$scope.lsData.loadimageLsSb = true;
				$scope.lsData.loadimageLsTt = true;
				$scope.lsData.bindLsserviceBulletin("initial");	
				$scope.lsData.bindLsTechnicialTip("initial");
			}
			
		}
		else if($scope.lsData.tabName == 'servlane'){
			$scope.lsData.loadimageLsAsm = true;
			$scope.lsData.loadimageLsCar = true;
					$scope.lsData.loadimageLsCif = true;
			$scope.lsData.loadimageLsPedPev = true;
			$scope.lsData.bindLsAsm("initial");
			$scope.lsData.bindLsCar("initial");
			$scope.lsData.bindLsCif("initial");
			$scope.lsData.bindLsPedPev("initial");
			
		}
		else if($scope.lsData.tabName == 'ncf'){
			$scope.lsData.bindLsNcfData("initial");
			
		}
		else if($scope.lsData.tabName == 'pantspoc'){
			$scope.lsData.loadimageLsPant = true;
			$scope.lsData.loadimageLsSpoc = true;
			$scope.lsData.bindLsPantData("initial");
			$scope.lsData.bindLsSpocData("initial");
			
		}
		else if($scope.lsData.tabName == 'servpt'){
			$scope.lsData.bindLsServPtData("initial");
			
		}
		else if($scope.lsData.tabName == 'warrcp'){
			$scope.lsData.bindLsWarrantyData("initial");
			
		}
		else if($scope.lsData.tabName == 'om'){
			$scope.lsData.loadimageLsOm = true;
			$scope.lsData.loadimageLsAccessoryAudio = true;
			$scope.lsData.loadimageLsGulfStates = true;
			$scope.lsData.loadimageLsSoutheast = true;
			$scope.lsData.loadimageLsMaintenance = true;
			$scope.lsData.bindLsOm("initial");
			$scope.lsData.bindLsAccessoryAudio("initial");
			$scope.lsData.bindLsGulfStates("initial");
			$scope.lsData.bindLsSoutheastToyota("initial");
			$scope.lsData.bindLsMaintenanceSchedule("initial");
			
		}
		else if($scope.lsData.tabName == 'training'){
			$scope.lsData.loadimageLsTtc = true;
			$scope.lsData.loadimageLsQtg = true;
			$scope.lsData.loadimageLsTtm = true;
			$scope.lsData.loadimageLsTva = true;
			$scope.lsData.bindLsTtcData("initial");
			$scope.lsData.bindLsQtgData("initial");
			$scope.lsData.bindLsTtmData("initial");
			$scope.lsData.bindLsTvaData("initial");
			
		}

		}
	};

	$scope.lsData.bindLsCampPub = function(flag){
		 if(flag == "more"){$scope.isLoading.loadimage = true;}
			$scope.lsData.lsCampPubFlatTireErr = false;
			$scope.lsData.lsCampPubErr = false;
				var summaryResults = "";
 
			
			if($scope.lsData.tabName == 'summary'){
				summaryResults = "&lstab=summary";		
				}

				mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"cp",summaryResults).then(function(data) {
					$scope.lsData.loadimageLsCampPub = false;		
					 if(flag == "more"){$scope.isLoading.loadimage = false;}
					if(data.hasOwnProperty('error')){
						$scope.lsData.lsCampPubFlatTireErr = true;	
					}else{
						
						$scope.lsData.lsCampPubInfo = data;
						if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
							$scope.lsData.suggestedWord = data.spellingSuggestion;
						}
						
						if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
							$scope.lsData.lsCampPubErr = true;	
					}
				});

		};
		
		$scope.lsData.bindLsServPtData = function(flag){
			$scope.isLoading.loadimage = true;
				$scope.lsData.lsServPtFlatTireErr = false;
				$scope.lsData.lsServPtErr = false;
					mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"spog").then(function(data) {
							$scope.isLoading.loadimage = false;
						if(data.hasOwnProperty('error')){
							$scope.lsData.lsServPtFlatTireErr = true;	
						}else{
							
							$scope.lsData.lsServPtInfo = data;
							if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
								$scope.lsData.suggestedWord = data.spellingSuggestion;
							}
							if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
								$scope.lsData.lsServPtErr = true;	
						}
					});

			};
			$scope.lsData.bindLsNcfData = function(flag){
				 
				 $scope.isLoading.loadimage = true;
					$scope.lsData.lsNcfFlatTireErr = false;
					$scope.lsData.lsNcfErr = false;
						mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"ncf").then(function(data) {
								$scope.isLoading.loadimage = false;
							if(data.hasOwnProperty('error')){
								$scope.lsData.lsNcfFlatTireErr = true;	
							}else{
								 
								$scope.lsData.lsNcfInfo = data;
								if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
									$scope.lsData.suggestedWord = data.spellingSuggestion;
								}
								if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
									$scope.lsData.lsNcfErr = true;	
							}
						});

				};
				
				$scope.lsData.bindLsWarrantyData = function(flag){
					 $scope.isLoading.loadimage = true;
						$scope.lsData.lsWarrantyFlatTireErr = false;
						$scope.lsData.lsWarrantyErr = false;
							mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"wb").then(function(data) {
									$scope.isLoading.loadimage = false;
								if(data.hasOwnProperty('error')){
									$scope.lsData.lsWarrantyFlatTireErr = true;	
								}else{
									
									$scope.lsData.lsWarrantyInfo = data;
									if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
										$scope.lsData.suggestedWord = data.spellingSuggestion;
									}									
									if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
										$scope.lsData.lsWarrantyErr = true;	
								}
							});

					};
		$scope.lsData.bindLsserviceBulletin = function(flag){
			 if(flag == "more"){$scope.isLoading.loadimage = true;}
				$scope.lsData.lsserviceBulletinFlatTireErr = false;
				$scope.lsData.lsserviceBulletinErr = false;
				 var summaryResults = "";
				if($scope.lsData.tabName == 'summary'){
					summaryResults = "&lstab=summary";		
					}
					mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"sb",summaryResults).then(function(data) {
						$scope.lsData.loadimageLsSb = false;		
						 if(flag == "more"){$scope.isLoading.loadimage = false;}
						if(data.hasOwnProperty('error')){
							$scope.lsData.lsserviceBulletinFlatTireErr = true;	
						}else{
							
							$scope.lsData.lsserviceBulletinInfo = data;
							if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
								$scope.lsData.suggestedWord = data.spellingSuggestion;
							}
							if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
								$scope.lsData.lsserviceBulletinErr = true;	
						}
					});

			};
			$scope.lsData.bindLsTechnicialTip = function(flag){
				 if(flag == "more"){$scope.isLoading.loadimage = true;}
					$scope.lsData.lsTechnicialTipFlatTireErr = false;
					$scope.lsData.lsTechnicialTipErr = false;
					 var summaryResults = "";
					if($scope.lsData.tabName == 'summary'){
						summaryResults = "&lstab=summary";		
						}
					mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"tt",summaryResults).then(function(data) {
							 if(flag == "more"){$scope.isLoading.loadimage = false;}
							 $scope.lsData.loadimageLsTt = false;	
							if(data.hasOwnProperty('error')){
								$scope.lsData.lsTechnicialTipFlatTireErr = true;	
							}else{
								//alert(data);
								$scope.lsData.lsTechnicialTipInfo = data;
								if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
									$scope.lsData.suggestedWord = data.spellingSuggestion;
								}
								if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
									$scope.lsData.lsTechnicialTipErr = true;	
							}
						});

				};
				
				
				
				
				$scope.lsData.bindLsPantData = function(flag){
					 if(flag == "more"){$scope.isLoading.loadimage = true;}
						$scope.lsData.lsPantDataFlatTireErr = false;
						$scope.lsData.lsPantDataErr = false;
								
							mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"pant").then(function(data) {
								$scope.lsData.loadimageLsPant = false;		
								 if(flag == "more"){$scope.isLoading.loadimage = false;}
								if(data.hasOwnProperty('error')){
									$scope.lsData.lsPantDataFlatTireErr = true;	
								}else{
									
									$scope.lsData.lsPantDataInfo = data;
									if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
										$scope.lsData.suggestedWord = data.spellingSuggestion;
									}
									if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
										$scope.lsData.lsPantDataErr = true;	
								}
							});

					};
					$scope.lsData.bindLsSpocData = function(flag){
						 if(flag == "more"){$scope.isLoading.loadimage = true;}
							$scope.lsData.lsSpocDataFlatTireErr = false;
							$scope.lsData.lsSpocDataErr = false;
							
						
							mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"spoc").then(function(data) {
									 if(flag == "more"){$scope.isLoading.loadimage = false;}
									 $scope.lsData.loadimageLsSpoc = false;	
									if(data.hasOwnProperty('error')){
										$scope.lsData.lsSpocDataFlatTireErr = true;	
									}else{
										
										$scope.lsData.lsSpocDataInfo = data;
										if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
											$scope.lsData.suggestedWord = data.spellingSuggestion;
										}
										if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
											$scope.lsData.lsSpocDataErr = true;	
									}
								});

						};
						
						$scope.lsData.bindLsAsm = function(flag){
							 if(flag == "more"){$scope.isLoading.loadimage = true;}
								$scope.lsData.lsAsmFlatTireErr = false;
								$scope.lsData.lsAsmErr = false;
										
									mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"asm").then(function(data) {
										$scope.lsData.loadimageLsAsm = false;		
										 if(flag == "more"){$scope.isLoading.loadimage = false;}
										if(data.hasOwnProperty('error')){
											$scope.lsData.lsAsmFlatTireErr = true;	
										}else{
											
											$scope.lsData.lsAsmInfo = data;
											if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
												$scope.lsData.suggestedWord = data.spellingSuggestion;
											}
											if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
												$scope.lsData.lsAsmErr = true;	
										}
									});

							};
						
						$scope.lsData.bindLsCar = function(flag){
							 if(flag == "more"){$scope.isLoading.loadimage = true;}
								$scope.lsData.lsCarFlatTireErr = false;
								$scope.lsData.lsCarErr = false;
										
									mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"car").then(function(data) {
										$scope.lsData.loadimageLsCar = false;		
										 if(flag == "more"){$scope.isLoading.loadimage = false;}
										if(data.hasOwnProperty('error')){
											$scope.lsData.lsCarFlatTireErr = true;	
										}else{
											
											$scope.lsData.lsCarInfo = data;
											if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
												$scope.lsData.suggestedWord = data.spellingSuggestion;
											}
											if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
												$scope.lsData.lsCarErr = true;	
										}
									});

							};
						
						
						
						
						$scope.lsData.bindLsCif = function(flag){
							 if(flag == "more"){$scope.isLoading.loadimage = true;}
								$scope.lsData.lsCifFlatTireErr = false;
								$scope.lsData.lsCifErr = false;
										
									mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"cif").then(function(data) {
										$scope.lsData.loadimageLsCif = false;		
										 if(flag == "more"){$scope.isLoading.loadimage = false;}
										if(data.hasOwnProperty('error')){
											$scope.lsData.lsCifFlatTireErr = true;	
										}else{
											
											$scope.lsData.lsCifInfo = data;
											if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
												$scope.lsData.suggestedWord = data.spellingSuggestion;
											}
											if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
												$scope.lsData.lsCifErr = true;	
										}
									});

							};
							$scope.lsData.bindLsPedPev = function(flag){
								 if(flag == "more"){$scope.isLoading.loadimage = true;}
									$scope.lsData.lsPedPevFlatTireErr = false;
									$scope.lsData.lsPedPevErr = false;
									
								
									mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,["ped", "pev"]).then(function(data) {
											 if(flag == "more"){$scope.isLoading.loadimage = false;}
											 $scope.lsData.loadimageLsPedPev = false;	
											if(data.hasOwnProperty('error')){
												$scope.lsData.lsPedPevFlatTireErr = true;	
											}else{
												
												$scope.lsData.lsPedPevInfo = data;
												if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
													$scope.lsData.suggestedWord = data.spellingSuggestion;
												}
												if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
													$scope.lsData.lsPedPevErr = true;	
											}
										});

								}
							
							
							$scope.lsData.bindLsTtcData = function(flag){
								 if(flag == "more"){$scope.isLoading.loadimage = true;}
									$scope.lsData.lsTtcFlatTireErr = false;
									$scope.lsData.lsTtcErr = false;
											
										mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"ttc").then(function(data) {
											$scope.lsData.loadimageLsTtc = false;		
											 if(flag == "more"){$scope.isLoading.loadimage = false;}
											if(data.hasOwnProperty('error')){
												$scope.lsData.lsTtcFlatTireErr = true;	
											}else{
												
												$scope.lsData.lsTtcInfo = data;
												if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
													$scope.lsData.suggestedWord = data.spellingSuggestion;
												}
												if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
													$scope.lsData.lsTtcErr = true;	
											}
										});

								};
							
							$scope.lsData.bindLsQtgData = function(flag){
								 if(flag == "more"){$scope.isLoading.loadimage = true;}
									$scope.lsData.lsQtgFlatTireErr = false;
									$scope.lsData.lsQtgErr = false;
											
										mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"qtg").then(function(data) {
											$scope.lsData.loadimageLsQtg = false;		
											 if(flag == "more"){$scope.isLoading.loadimage = false;}
											if(data.hasOwnProperty('error')){
												$scope.lsData.lsQtgFlatTireErr = true;	
											}else{
												
												$scope.lsData.lsQtgInfo = data;
												if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
													$scope.lsData.suggestedWord = data.spellingSuggestion;
												}
												if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
													$scope.lsData.lsQtgErr = true;	
											}
										});

								};
							
							
							
							
							$scope.lsData.bindLsTtmData = function(flag){
								 if(flag == "more"){$scope.isLoading.loadimage = true;}
									$scope.lsData.lsTtmFlatTireErr = false;
									$scope.lsData.lsTtmErr = false;
											
										mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"ttm").then(function(data) {
											$scope.lsData.loadimageLsTtm = false;		
											 if(flag == "more"){$scope.isLoading.loadimage = false;}
											if(data.hasOwnProperty('error')){
												$scope.lsData.lsTtmFlatTireErr = true;	
											}else{
												
												$scope.lsData.lsTtmInfo = data;
												if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
													$scope.lsData.suggestedWord = data.spellingSuggestion;
												}
												if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
													$scope.lsData.lsTtmErr = true;	
											}
										});

								};
								$scope.lsData.bindLsTvaData = function(flag){
									 if(flag == "more"){$scope.isLoading.loadimage = true;}
										$scope.lsData.lsTvaFlatTireErr = false;
										$scope.lsData.lsTvaErr = false;
										
									
										mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"tva").then(function(data) {
												 if(flag == "more"){$scope.isLoading.loadimage = false;}
												 $scope.lsData.loadimageLsTva = false;	
												if(data.hasOwnProperty('error')){
													$scope.lsData.lsTvaFlatTireErr = true;	
												}else{
													
													$scope.lsData.lsTvaInfo = data;
													if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
														$scope.lsData.suggestedWord = data.spellingSuggestion;
													}
													if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
														$scope.lsData.lsTvaErr = true;	
												}
											});

									}
								
								$scope.lsData.bindLsOm = function(flag){
									 if(flag == "more"){$scope.isLoading.loadimage = true;}
										$scope.lsData.lsOmFlatTireErr = false;
										$scope.lsData.lsOmErr = false;
												
											mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,["om-s", "om"]).then(function(data) {
												$scope.lsData.loadimageLsOm = false;		
												 if(flag == "more"){$scope.isLoading.loadimage = false;}
												if(data.hasOwnProperty('error')){
													$scope.lsData.lsOmFlatTireErr = true;	
												}else{
													
													$scope.lsData.lsOmInfo = data;
													if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
														$scope.lsData.suggestedWord = data.spellingSuggestion;
													}
													if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
														$scope.lsData.lsOmErr = true;	
												}
											});

									};
								
								$scope.lsData.bindLsAccessoryAudio = function(flag){
									 if(flag == "more"){$scope.isLoading.loadimage = true;}
										$scope.lsData.lsAccessoryAudioFlatTireErr = false;
										$scope.lsData.lsAccessoryAudioErr = false;
												
											mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,["omnav-s", "omnav"]).then(function(data) {
												$scope.lsData.loadimageLsAccessoryAudio = false;		
												 if(flag == "more"){$scope.isLoading.loadimage = false;}
												if(data.hasOwnProperty('error')){
													$scope.lsData.lsAccessoryAudioFlatTireErr = true;	
												}else{
													
													$scope.lsData.lsAccessoryAudioInfo = data;
													if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
														$scope.lsData.suggestedWord = data.spellingSuggestion;
													}
													if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
														$scope.lsData.lsAccessoryAudioErr = true;	
												}
											});

									};
								
								
								
								
								$scope.lsData.bindLsGulfStates = function(flag){
									 if(flag == "more"){$scope.isLoading.loadimage = true;}
										$scope.lsData.lsGulfStatesFlatTireErr = false;
										$scope.lsData.lsGulfStatesErr = false;
												
											mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"omnav-gst").then(function(data) {
												$scope.lsData.loadimageLsGulfStates = false;		
												 if(flag == "more"){$scope.isLoading.loadimage = false;}
												if(data.hasOwnProperty('error')){
													$scope.lsData.lsGulfStatesFlatTireErr = true;	
												}else{
													
													$scope.lsData.lsGulfStatesInfo = data;
													if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
														$scope.lsData.suggestedWord = data.spellingSuggestion;
													}
													if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
														$scope.lsData.lsGulfStatesErr = true;	
												}
											});

									};
									
									
									$scope.lsData.bindLsSoutheastToyota = function(flag){
										 if(flag == "more"){$scope.isLoading.loadimage = true;}
											$scope.lsData.lsSoutheastToyotaFlatTireErr = false;
											$scope.lsData.lsSoutheastToyotaErr = false;
													
												mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,"omnav-set").then(function(data) {
													$scope.lsData.loadimageLsSoutheast = false;		
													 if(flag == "more"){$scope.isLoading.loadimage = false;}
													if(data.hasOwnProperty('error')){
														$scope.lsData.lsSoutheastToyotaFlatTireErr = true;	
													}else{
														
														$scope.lsData.lsSoutheastToyotaInfo = data;
														if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
															$scope.lsData.suggestedWord = data.spellingSuggestion;
														}
														if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
															$scope.lsData.lsSoutheastToyotaErr = true;	
													}
												});

										};
									$scope.lsData.bindLsMaintenanceSchedule = function(flag){
										 if(flag == "more"){$scope.isLoading.loadimage = true;}
											$scope.lsData.lsMaintenanceScheduleFlatTireErr = false;
											$scope.lsData.lsMaintenanceScheduleErr = false;
											
										
											mainService.getLS(flag,$scope.lsData.mysearchword,$scope.lsData.mylanguage,["omms-s", "omms"]).then(function(data) {
													 if(flag == "more"){$scope.isLoading.loadimage = false;}
													 $scope.lsData.loadimageLsMaintenance = false;	
													if(data.hasOwnProperty('error')){
														$scope.lsData.lsMaintenanceScheduleFlatTireErr = true;	
													}else{
														
														$scope.lsData.lsTvaInfo = data;
														if(data.hasOwnProperty('spellingSuggestion') && data.spellingSuggestion != 'N/A'){
															$scope.lsData.suggestedWord = data.spellingSuggestion;
														}
														if(data.hasOwnProperty('errorMsg') && data.errorMsg != 'N/A')
															$scope.lsData.lsMaintenanceScheduleErr = true;	
													}
												});

										}
						
						
	$scope.lsData.bindLsTabChange = function(tabid,portletid){
		$scope.lsData.tabName = tabid;
		bindLsInfo(false,portletid);
		}
	
	$scope.lsData.appendSearchData = function(){
		bindLsInfo(true);
		}
	$scope.lsData.searchSuggestedData = function(){
		$scope.lsData.searchWord = $scope.lsData.suggestedWord;
		bindLsInfo(true);
		}
	
	$scope.lsData.resetInputBox = function(){
		$scope.lsData.searchWord = '';
		}
	if(!$scope.isUserBlocked){

		bindLsInfo(true);		
	}
	$scope.$on('bindLsInfo', function() { 
		//alert("save me god");
		bindLsInfo(true);	
		
	});
	
});