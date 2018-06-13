// create angular factory to get Vehicle OneLiner
asmServices.factory('mainService', ['$q', '$http', 
    function($q, $http) {

        var isUserBlockedData = {};
        var onelinerData = {};
        var leftNavData = {};
        return {
            /*getConcurrent*/
            getConcurrent: function() {				
                var requestURL = '/t3Portal/termsOfUseServlet';
               //var requestURL = '/serviceLane/pages/asm/mobile/json/user.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(udata, status, headers, config) {
                    concData = udata;
					deferred.resolve(concData);
                }).
                error(function(udata, status, headers, config) {
                    //servicename.get("errorName",data)
                    deferred.reject(udata);
                });
                return deferred.promise;
            },
            /*getDivision*/
            getDivision: function(showVal) {
				if( !showVal) { showVal = false;}
                var requestURL = '/serviceLane/mobile/getUserDivision?ShowAll='+showVal;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/user.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(udata, status, headers, config) {
                    userDivisionData = udata;
					deferred.resolve(userDivisionData);
                }).
                error(function(udata, status, headers, config) {
                    //servicename.get("errorName",data)

                    deferred.reject(udata);
                });
                return deferred.promise;
            },
           getSM: function(fuelId,drivingCond,mile,eng,trans,dri){
			 var requestURL = '/serviceLane/mobile/getScheduledMaintenance?fuelId='+fuelId+'&drivingConditionId='+drivingCond+'&mileage='+mile+"&engine="+eng+"&drive="+dri+"&trans="+trans;
			 //var requestURL = '/serviceLane/pages/asm/mobile/json/sm.json';
			   var deferred = $q.defer();
					$http({
						method: 'GET',
						url: requestURL
					}).
					success(function(bdata, status, headers, config) {
						isthirdPartyData = bdata;
						deferred.resolve(isthirdPartyData);
						
					}).
					error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
					return deferred.promise;		   
		   },
		   
		   getIssueListData:function(auditName){
			   		var encodedAuditname = encodeURIComponent(auditName);
                    var requestURL ='/serviceLane/mobile/getIssueList?auditName='+encodedAuditname;
                    //var requestURL='/serviceLane/pages/asm/mobile/json/issuelist.json';                                                
					var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                        success(function(bdata, status, headers, config) {
                          	issueListData = bdata;
                            deferred.resolve(issueListData);
						}).
						error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
						return deferred.promise; 
                },	
			getEditIssueEntryData:function(auditName,vin,id){
				var encodedAuditname = encodeURIComponent(auditName);
				var requestURL = '/serviceLane/mobile/getDetailedIssue?auditName='+encodedAuditname+'&vin='+vin+'&issueId='+id;
				//var requestURL = '/serviceLane/pages/asm/mobile/json/issueentry.json';
					var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                        success(function(bdata, status, headers, config) {
                          	editEntryData = bdata;
                            deferred.resolve(editEntryData);
						}).
						error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
				return deferred.promise;
			},
            getNewIssueEntryData:function(auditName,vin,tag){
					if( !vin ){ vin= '';}
					if( !tag )	{ tag= '';}		
					var encodedAuditname = encodeURIComponent(auditName);
					var requestURL = '/serviceLane/mobile/getIssueEntryMenu?auditName='+encodedAuditname+'&vin='+vin+'&tag='+tag;
					//var requestURL = '/serviceLane/pages/asm/mobile/json/issueentry.json';
					var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                        success(function(bdata, status, headers, config) {
                          	issueListData = bdata;
                            deferred.resolve(issueListData);
						}).
						error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
						return deferred.promise;
                },	
			getNewIssueDetailData:function(rating,type,servCat,section,subComp,cond){
					if(!rating){ rating = '';}
					if(!type){type = '';}
					if(!servCat){ servCat = '';} 
					if(!section){section= '';}
					if(!subComp){subComp= '';}
					if(!cond){cond = '';}
					var requestURL = '/serviceLane/mobile/getDetailedIssueList?rating='+rating+'&issueType='+type+'&servCat='+servCat+'&section='+section+'&subComp='+subComp+'&cond='+cond;
					//var requestURL = '/serviceLane/pages/asm/mobile/json/issdet.json';
					var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                        success(function(bdata, status, headers, config) {
                          	issueDetailData = bdata;
                            deferred.resolve(issueDetailData);
						}).
						error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
						return deferred.promise;
                },			
			getSimilarIssueData:function(auditName,svCtg,sec,subComp,Cond,id){
				if(!svCtg){ svCtg = 'All';} 
				if(!sec){sec= 'All';}
				if(!subComp){subComp= 'All';}
				if(!Cond){Cond='All';}
				if(!id) { id = '';}
				var encodedAuditname = encodeURIComponent(auditName);
				var requestURL = '/serviceLane/mobile/findSimilar?auditName='+encodedAuditname+'&servCat='+svCtg+'&section='+sec+'&subComp='+subComp+'&cond='+Cond+'&issueId='+id;
				//var requestURL = '/serviceLane/pages/asm/mobile/json/similar.json';
				var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                    success(function(bdata, status, headers, config) {
                          	similarData = bdata;
                            deferred.resolve(similarData);
						}).
					error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
				return deferred.promise;
			},
			getDeleteIssue : function(del){
			//var requestURL = '/serviceLane/pages/asm/mobile/json/delete.json';
			var requestURL='/serviceLane/mobile/deleteIssue'
				var deferred = $q.defer();
					$http({
						method: 'POST',
						url: requestURL,
						data: del
					}).
					success(function(bdata, status, headers, config) {
                       	deleteData = bdata;
                        deferred.resolve(deleteData);
                    }).
                    error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
                  return deferred.promise;
			},		   
			getIssueEntryData:function(fields,files){				
					var fd = new FormData();
					for(var key in files){
						//console.log(files[key])
						 fd.append(key, files[key]);
					}
				   fd.append('extra',JSON.stringify(fields));	
					//console.log("service",fd);
					var requestURL = '/serviceLane/mobile/getIssueEntry'; 
					//var requestURL = '/serviceLane/pages/asm/mobile/json/issueentry.json';
					var deferred = $q.defer();
						$http({
								method: 'POST',
								url: requestURL,
								data: fd,
								headers: {'Content-Type': undefined},
								transformRequest: angular.identity
							}).
                        success(function(bdata, status, headers, config) {
								issueEntryData= bdata;
								deferred.resolve(issueEntryData);
                            }).
							error(function(bdata, status, headers, config) {
                            	deferred.reject(bdata);
							});
                             return deferred.promise;
                },
			getAuditSetupData:function(){
				var requestURL = '/serviceLane/mobile/newAuditSetup';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/audit.json';
				var deferred = $q.defer();
					$http({
						method: 'GET',
                        url: requestURL
                        }).
                    success(function(bdata, status, headers, config) {
                          	similarData = bdata;
                            deferred.resolve(similarData);
						}).
					error(function(bdata, status, headers, config) {
							deferred.reject(bdata);
						});
				return deferred.promise;
			},	
			
		   getAuditSetup: function(auditSetup){
			//var requestURL = '/serviceLane/pages/asm/mobile/json/auditsetup.json';
			var requestURL='/serviceLane/mobile/updateAuditDetails'
				var deferred = $q.defer();
					$http({
						method: 'POST',
						url: requestURL,
						data: auditSetup
					}).
					success(function(bdata, status, headers, config) {
                       	auditData= bdata;
                        deferred.resolve(auditData);
                    }).
                    error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
                  return deferred.promise;
			},
		   
           getLS: function(moreflag,searchWord,language,doctype,summaryResults){
        	   var encodedSearchWord = "";
        	  encodedSearchWord = encodeURIComponent(searchWord);
        	     var summaryTab = "";
        	   if(summaryResults != "" && typeof summaryResults != "undefined"){
        		   summaryTab = summaryResults;
        	   }
        	   else{
        		   summaryTab = "&lstab=others";
        	   }	
        	  var doctypeQuery = '';

        	   if(Array.isArray(doctype)){
        		   for(i=0;i<doctype.length;i++){
        			   doctypeQuery +=  "&doctypes="+doctype[i];
        		   }
        	   }
        	   else{
        		   doctypeQuery = "&doctypes="+doctype;
        	   }        	  
        	
  			 var requestURL = '/serviceLane/mobile/getLsResponse?param='+moreflag+doctypeQuery+'&lang='+language+'&keyword='+encodedSearchWord+summaryTab;  			 
  			   var deferred = $q.defer();
  					$http({
  						method: 'GET',
  						url: requestURL
  					}).
  					success(function(lsdata, status, headers, config) {
  						lsdataCollection = lsdata;
  						deferred.resolve(lsdataCollection);
  						
  					}).
  					error(function(lsdata, status, headers, config) {
  						deferred.reject(lsdata);
  					});
  					return deferred.promise;
  		   
  		   },
		   getsmGridInfo: function() {
                var requestURL = '/serviceLane/mobile/getScheduledMaintenanceGrid';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/smgrid.json';             
				var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    smgridInfoData = ddata;
                    deferred.resolve(smgridInfoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
           getTCMC: function(){
			 var requestURL = '/serviceLane/mobile/getTCMCFormData';
			   var deferred = $q.defer();
					$http({
						method: 'GET',
						url: requestURL
					}).
					success(function(bdata, status, headers, config) {
						isthirdPartyData = bdata;
						deferred.resolve(isthirdPartyData);
						
					}).
					error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
					return deferred.promise;
		   
		   },
		   getTBC: function(){
			 var requestURL = '/serviceLane/mobile/getTCMCFormData';
			 //var requestURL = '/serviceLane/pages/asm/mobile/json/tk.json';
			   var deferred = $q.defer();
					$http({
						method: 'GET',
						url: requestURL
					}).
					success(function(bdata, status, headers, config) {
						isthirdPartyData = bdata;
						deferred.resolve(isthirdPartyData);
						
					}).
					error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
					return deferred.promise;
		   
		   },
		   getACE: function(){
			 var requestURL = '/serviceLane/mobile/getACEFormData';
			   var deferred = $q.defer();
					$http({
						method: 'GET',
						url: requestURL
					}).
					success(function(bdata, status, headers, config) {
						isthirdPartyData = bdata;
						deferred.resolve(isthirdPartyData);
						
					}).
					error(function(bdata, status, headers, config) {
						deferred.reject(bdata);
					});
					return deferred.promise;
		   
		   },
            //getIsUserBlocked
            getIsUserBlocked: function(vinnumber,isLibrary) {
            	
                var requestURL = '/serviceLane/mobile/getLoginUserBlockStatus';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/blockUser.json';
                
                if(isLibrary){
                	requestURL='/serviceLane/mobile/getLoginUserBlockStatus?librarySearch=true';
                }

                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(bdata, status, headers, config) {
                    isUserBlockedData = bdata;
                    deferred.resolve(isUserBlockedData);
                }).
                error(function(bdata, status, headers, config) {
                    deferred.reject(bdata);
                });
                return deferred.promise;
            },
			//getIsSalvage
            getIsSalvage: function(vinnumber) {            	
            	var requestURL = '/serviceLane/mobile/getSalvageDetails?vehicleId='+vinnumber;
				//var requestURL = '/serviceLane/pages/asm/mobile/json/salvage.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(data, status, headers, config) {
                    isSalvageData = data;
                    deferred.resolve(isSalvageData);
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);
                });
                return deferred.promise;
            },
            //getOnliner
            getOnliner: function(vinnumber,auditName,userAgreed) {
                //4T1BD1FK7CU010951	
                var encodedAuditname = encodeURIComponent(auditName);			
                var requestURL = '/serviceLane/mobile/getVehicleData?vehicleId='+vinnumber+'&audit='+encodedAuditname+'&salvageAgreed='+userAgreed;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/oneliner.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(data, status, headers, config) {
                    onelinerData = data;
                    deferred.resolve(onelinerData);
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);
                });
                return deferred.promise;
            },

            //leftNavData
            getLeftNavData: function(vinnumber) {			
               var requestURL = '/serviceLane/mobile/getNavigationDetails?vehicleId='+vinnumber;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/leftMenu.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ldata, status, headers, config) {
                    leftNavData = ldata;
                    deferred.resolve(leftNavData);
                }).
                error(function(ldata, status, headers, config) {
                    deferred.reject(ldata);
                });
                return deferred.promise;
            },//Simple leftNavData
			getExtendedLeftNavData: function(vinnumber) {			
               var requestURL = '/serviceLane/mobile/getNavigationDetailsPlus?vehicleId='+vinnumber;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/LeftExtendedMenu.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ldata, status, headers, config) {
                    leftExtendedNavData = ldata;
                    deferred.resolve(leftExtendedNavData);
                }).
                error(function(ldata, status, headers, config) {
                    deferred.reject(ldata);
                });
                return deferred.promise;
            },//Extended leftNavData
            getRightNavData: function(vinnumber) {	
			   var requestURL = '/serviceLane/mobile/getRightNavigationDetails?vehicleId=' + vinnumber;			   
               //var requestURL = '/serviceLane/pages/asm/mobile/json/rightMenu.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(rdata, status, headers, config) {
                    rightNavData = rdata;
                    deferred.resolve(rightNavData);
                }).
                error(function(rdata, status, headers, config) {
                    deferred.reject(rdata);
                });
                return deferred.promise;
            },
            //getVehicleInfo	
            getVehicleInfoData: function(vinnumber) {
				var requestURL = '/serviceLane/mobile/getVehicleInformation?vehicleId=' + vinnumber;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/getVehicleInfo.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    vehicleInfoData = vdata;
                    deferred.resolve(vehicleInfoData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
			getNextServiceApt: function(vinnumber,splIns,opCond) {
                   if(!splIns){ splIns = ''; }
                  if(!opCond){ opCond = ''; }
             var requestURL = '/serviceLane/mobile/getNextServiceApt?vehicleId='+vinnumber+'&splInsId='+splIns+'&opCondId='+opCond;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/nextser.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    nextServiceApt = vdata;
                    deferred.resolve(nextServiceApt);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            getRecalculatedDate: function(fields) {
                var requestURL = '/serviceLane/mobile/getRecalculatedDate';
               //var requestURL = '/serviceLane/pages/asm/mobile/json/recalc.json';
                var deferred = $q.defer();
                $http({
                    method: 'POST',
                    url: requestURL,
                                  data: fields
                }).
                success(function(vdata, status, headers, config) {
                    afterRecalc = vdata;
                    deferred.resolve(afterRecalc);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //after feedback submit	
            feedbackSubmitData: function(siteArea,errorSuggDesc,additionalComments,contactEmail,contactTel,firstName,lastName,commonName) {
            	var formJson={
            			"siteArea":siteArea,
            			"errorDesc":errorSuggDesc,
            			"additionalComments":additionalComments,
            			"email":contactEmail,
            			"phoneNumber":contactTel            			
            	};
				var requestURL = '/serviceLane/mobile/addFeedBack';
               
                var deferred = $q.defer();
              
                $.ajax({
                    type: "POST",
                    url:requestURL,       
                    //dataType: 'json',
                    data:{feedBackData:JSON.stringify(formJson)},
              
                
             success: function(obj){
             
             }});
                
                return deferred.promise;

            },
            //getservicehistory	
            getServiceHistoryData: function(vinnumber,flag) {
                if(flag){
     				var requestURL = '/serviceLane/mobile/viewOlderServiceHistoryData';
                	// var requestURL = '/serviceLane/pages/asm/mobile/json/olderserviceHistory.json';
                }
                 else{
                	var requestURL = '/serviceLane/mobile/findServiceHistory';
                  	// var requestURL = '/serviceLane/pages/asm/mobile/json/serviceHistory.json';
                }
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    serviceHistoryData = vdata;
                    deferred.resolve(serviceHistoryData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //getoldservicehistory	
            getOlderServiceHistoryData: function(vinnumber) {
				var requestURL = '/serviceLane/mobile/viewOlderServiceHistoryData';
               // var requestURL = '/serviceLane/pages/asm/mobile/json/serviceHistory.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    serviceHistoryData = vdata;
                    deferred.resolve(serviceHistoryData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
			//getCampInfoData	
            getCampInfoData: function(vinnumber) {
				var requestURL = '/serviceLane/mobile/findServiceCampaigning?vehicleId='+ vinnumber;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/campaign.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL/*,
					headers: {
					   "Accept": "application/json; charset=utf-8",
					   "Accept-Charset": "charset=utf-8",
				   },
				   dataType: "json"*/
                }).
                success(function(vdata, status, headers, config) {
                    campaignInfoData = vdata;
                    deferred.resolve(campaignInfoData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            
            //getcustomersurvey	
            getCustomerSurveyData: function() {
				var requestURL = '/serviceLane/mobile/findCustomerSurvey';
                //var requestURL = '/serviceLane/pages/asm/mobile/json/customersurvey.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    customerSurveyData = vdata;
                    deferred.resolve(customerSurveyData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
			//getCareInfoData	
            getCareInfoData: function(vinnumber) {
				var requestURL = '/serviceLane/mobile/getToyotaCare?vehicleId='+ vinnumber;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/care.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    careInfoData = vdata;
                    deferred.resolve(careInfoData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //get Mirai Swap	
            getMiraiSwapData: function() {
            	var requestURL = '/serviceLane/mobile/getMiraiDetail';
               // var requestURL = '/serviceLane/pages/asm/mobile/json/miraiswap.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                    miraiSwapData = vdata;
                    deferred.resolve(miraiSwapData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            getDealerCodeData: function(dealercode) {			
                var requestURL = '/serviceLane/mobile/getDealerDetails?dealerCode=' + dealercode;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/dealercode.json';

                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    dealercodeData = ddata;
                    deferred.resolve(dealercodeData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
            getTechData: function(techname,lastDate,assId,exp,cert) {
				var millisecond = new Date().getTime();
                var requestURL = '/serviceLane/mobile/findTechnicianDetails?associateId='+assId+'&name='+techname+'&experience='+exp+'&certificate='+cert+'&date='+lastDate+'&'+millisecond;				
                //var requestURL = '/serviceLane/pages/asm/mobile/json/technician.json';
                //var requestURL = '/serviceLane/pages/asm/mobile/json/flat.json';

                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    techData = ddata;
                    deferred.resolve(techData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			
			getTroubleCodeData: function(troubeCodeKey,troubeCodeValue) {			
				var requestURL = '/serviceLane/mobile/getTroubleCodeDesc?troubleType='+troubeCodeKey+'&troubleCode='+troubeCodeValue;
               // var requestURL = '/serviceLane/pages/asm/mobile/json/troublecode.json';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/campaign.json';

                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(troubledata, status, headers, config) {
                    troublecodeData = troubledata;
                    deferred.resolve(troublecodeData);
                }).
                error(function(troubledata, status, headers, config) {
                    deferred.reject(troubledata);
                });
                return deferred.promise;
            },
			getVinHistory: function(dealercode, url) {

                var requestURL = url;
                               var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vinHistoryData = ddata;
                    deferred.resolve(vinHistoryData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getPreOwnedWarrantyData: function(vinnumber) {
				var requestURL = '/serviceLane/mobile/getCertifiedWarrantyDetails';                
                //var requestURL ='/serviceLane/pages/asm/mobile/json/PreOwnedWarranty.json';                
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    preOwnedData = ddata;
                    deferred.resolve(preOwnedData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getVehicleWarrantyData: function(val,idx) {
				var requestURL = '/serviceLane/mobile/getStandardWarrantyDetails';                
				if(idx)
					var requestURL = '/serviceLane/mobile/selectStdWarrantyState?userState='+val;  
				//var requestURL ='/serviceLane/pages/asm/mobile/json/standardwarranty.json';  					
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vehicalWarrantyData = ddata;
                    deferred.resolve(vehicalWarrantyData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getCspData: function() {
                var requestURL = '/serviceLane/mobile/getCSP';                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/csp.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    cspData = ddata;
                    deferred.resolve(cspData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			setMileageFormData: function(mval) {
                //var requestURL = '/serviceLane/pages/asm/mobile/json/PreOwnedWarranty.json';                
				var requestURL = '/serviceLane/mobile/setMileage?miles='+mval;                
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    console.log("mileage service succuess");
					mileageFormData = ddata;
                    deferred.resolve(mileageFormData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			resetMileageFormData: function(iVal) {
                //var requestURL = '/serviceLane/pages/asm/mobile/json/PreOwnedWarranty.json';                
				var requestURL = '/serviceLane/mobile/ResetMileage?vehicleId='+iVal;                
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
					resetmileageFormData = ddata;
                    deferred.resolve(resetmileageFormData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			clearVehicalData: function() {                               
				var requestURL = '/serviceLane/mobile/clearVehicleData';                
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
					clearVehicalData = ddata;
                    deferred.resolve(clearVehicalData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getVehicleAlertData: function(ival) {                               
				var requestURL = '/serviceLane/mobile/getVehicleAlerts?vehicleId='+ival;     
				//var requestURL = '/serviceLane/pages/asm/mobile/json/vehicleAlert.json';     				
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
					vehicalAlertData = ddata;
                    deferred.resolve(vehicalAlertData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getfsProductsData: function() {
                var requestURL = '/serviceLane/mobile/getFsProducts';                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/fsProdJsonwithData.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    productData = ddata;
                    deferred.resolve(productData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },getCustomerInfoData: function() {
                var requestURL = '/serviceLane/mobile/getCustomerInfo';                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/customerInfo.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    custmerInfoData = ddata;
                    deferred.resolve(custmerInfoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },  
            selectCustomerInfoData: function(custID) {
                var requestURL = '/serviceLane/mobile/selectCustomerId?customerID='+custID;                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/customerInfo.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                  
                    deferred.resolve();
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getDiagnosticInfo: function() {
                var requestURL = '/serviceLane/mobile/getDiagnosticReports';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/diagnostic.json';             
				var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    drInfoData = ddata;
                    deferred.resolve(drInfoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getVhrInfo: function(selType, isFilter) {
			
                var requestURL = '/serviceLane/mobile/getVHRList?vhrType='+selType+'&isFiltered='+isFilter;
				//var requestURL = '/serviceLane/pages/asm/mobile/json/vhr.json';             
				var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vhrInfoData = ddata;
                    deferred.resolve(vhrInfoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getVhrRepo: function() {
                var requestURL = '/serviceLane/mobile/generateVehicleReport';
				//var requestURL = '/serviceLane/pages/asm/mobile/json/generaterepo.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vhrRepoData = ddata;
                    deferred.resolve(vhrRepoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			sendVHRMail: function(custID,email) {
                var requestURL = '/serviceLane/mobile/sendVHRMail?customerId='+custID+'&emailId='+email;
				//var requestURL = '/serviceLane/pages/asm/mobile/json/userselection.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vhrRepoData = ddata;
                    deferred.resolve(vhrRepoData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getUserSelectionPopup: function(pgname,subscriberId,emailId) {
				if(subscriberId){
					var requestURL = '/serviceLane/mobile/getUserSelection?page='+pgname+'&selectedSubscriberId='+subscriberId+'&emailId='+emailId ;
				}else{
					var requestURL = '/serviceLane/mobile/getUserSelection?page='+pgname+'&selectedSubscriberId=&emailId=';
				}
				//var requestURL = '/serviceLane/pages/asm/mobile/json/userselection.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    vhrselusrData = ddata;
                    deferred.resolve(vhrselusrData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },
			getLpsCurrentData: function() {
                var requestURL = '/serviceLane/mobile/getLPSettings?selectedTab=Current';                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/lpsCurrentJSON.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    lpsCurrentData = ddata;
                    deferred.resolve(lpsCurrentData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },getLpsPendingData: function() {
                var requestURL = '/serviceLane/mobile/getLPSettings?selectedTab=Pending';                
				//var requestURL = '/serviceLane/pages/asm/mobile/json/lpsPendingJSON.json';             
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(ddata, status, headers, config) {
                    lpsPendingData = ddata;
                    deferred.resolve(lpsPendingData);
                }).
                error(function(ddata, status, headers, config) {
                    deferred.reject(ddata);
                });
                return deferred.promise;
            },getLpsHistoryData: function(cusId) {
				 var deferred = $q.defer();
				if(cusId)
					{
					var requestURL = '/serviceLane/mobile/getLPSHistoryContent';
		            var res = $http.post(requestURL, cusId);
					res.success(function(ddata, status, headers, config) {
						 lpsHistoryData = ddata;
		                    deferred.resolve(lpsHistoryData);
					});
					res.error(function(ddata, status, headers, config) {
						deferred.reject(ddata);
					});
					  return deferred.promise;
					}					 
				else
					{
					var requestURL = '/serviceLane/mobile/getLPSettings?selectedTab=History';
					//var requestURL = '/serviceLane/pages/asm/mobile/json/LpsHistortyContentJSON.json';             
	              
	                $http({
	                    method: 'GET',
	                    url: requestURL
	                }).
	                success(function(ddata, status, headers, config) {
	                    lpsHistoryData = ddata;
	                    deferred.resolve(lpsHistoryData);
	                }).
	                error(function(ddata, status, headers, config) {
	                    deferred.reject(ddata);
	                });
	                return deferred.promise;
					}
            },
            //get sevice connnect alert pop up 	
            getServiceConnectAlertData: function() {
				var requestURL = '/serviceLane/mobile/getEDAlerts';
                //var requestURL = '/serviceLane/pages/asm/mobile/json/edalerts.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	serviceConnectAlertData = vdata;
                    deferred.resolve(serviceConnectAlertData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },  
            //gettelematics Accound details pop up	
            getTelematicsAccoundDetailsData: function(custId,contractId) {
				var requestURL = '/serviceLane/mobile/getTeleMaticAccountDetails?selectedCustId='+custId+'&contarctId='+contractId;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/telematicsAccount.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	telematicsAccoundDetailsData = vdata;
                    deferred.resolve(telematicsAccoundDetailsData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //get house hold info	
            getHouseHoldData: function(moreflag) {
            	 var requestURL = '/serviceLane/mobile/getHouseHoldInfo?custId&type='+moreflag;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/houseHold.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	houseHoldTabtData = vdata;
                    deferred.resolve(houseHoldTabtData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //get road side assistance	
            getRoadSideAssistance: function() {
               var requestURL = '/serviceLane/mobile/getRoadSideAssistance';
               //var requestURL = '/serviceLane/pages/asm/mobile/json/roadSide.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	roadSideAssistData = vdata;
                    deferred.resolve(roadSideAssistData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },
            //gettelematics	
            getTelematicsData: function() {
				var requestURL = '/serviceLane/mobile/getTeleMaticSubscription';
                //var requestURL = '/serviceLane/pages/asm/mobile/json/telematics.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	telematicsData = vdata;
                    deferred.resolve(telematicsData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },getSubscriberInfo: function(subno) {
				console.log("getSubscriberInfo",subno);
				var requestURL = '/serviceLane/mobile/getOwnerAddressDetails?customerID='+subno;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/OwnerAccountDetails.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	subscriberData = vdata;
                    deferred.resolve(subscriberData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },getAuthCodeData: function(subno) {
				var requestURL = '/serviceLane/mobile/openAuthCodePopUpData';
                //var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	authCodeData = vdata;
                    deferred.resolve(authCodeData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },getAuthCodeValidationResult: function(authCd) {
				var requestURL = '/serviceLane/mobile/validateAuthCodeOnSubmit?enteredAuthCode='+authCd;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/authoCodeResult.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
				
                	authCodeResultData = vdata;
                    deferred.resolve(authCodeResultData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },getUsrSendMailData: function(uCusId) {
				var requestURL = '/serviceLane/mobile/generateAuthCodeAndMail?custId='+uCusId;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	sendMailData = vdata;
                    deferred.resolve(sendMailData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;
            },getUpdateSettingData: function(customizeId,tStamp,sTab,changeList) {				
            	var requestURL = '/serviceLane/mobile/updateLPSettings?customizeId='+customizeId+'&timeStamp='+tStamp+'&selectedTab='+sTab;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
				//var changeList ={"value": selectedList};
                var deferred = $q.defer();
                var res = $http.post(requestURL, changeList);
					res.success(function(ddata, status, headers, config) {
						 updateSettingData = ddata;
		                    deferred.resolve(updateSettingData);
					});
					res.error(function(ddata, status, headers, config) {
						deferred.reject(ddata);
					});
				
                return deferred.promise;
            },resendAuthcodeData: function(cusId) {				
            	var requestURL = '/serviceLane/mobile/resendCode?custId='+cusId;
               //var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	resendData = vdata;
                    deferred.resolve(resendData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;         
            
			},cancelAuthCodeData: function() {				
            	var requestURL = '/serviceLane/mobile/cancelCode';
               // var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	cancelCd = vdata;
                    deferred.resolve(cancelCd);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;         
            
			},getCancelPendingSettingData: function(cusId,timeStamp) {				
            	var requestURL = '/serviceLane/mobile/cancelPendingSettings?customizeId='+cusId+'&timeStamp='+timeStamp;
               // var requestURL = '/serviceLane/pages/asm/mobile/json/authoCode.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	CpsData = vdata;
                    deferred.resolve(CpsData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;         
            
			},getAboutData: function(cusId,timeStamp) {				
            	var requestURL = '/serviceLane/mobile/getAboutProductData';
               //var requestURL = '/serviceLane/pages/asm/mobile/json/about.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	aboutData = vdata;
                    deferred.resolve(aboutData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;         
            
			},
			getAnnouncementsData: function(flag) {
				
				var requestURL = '/serviceLane/mobile/getAnnouncements?type=all';
	           // var requestURL = '/serviceLane/pages/asm/mobile/json/announcement.json';
				var deferred = $q.defer();
				$http({
					 method: 'GET',
		             url: requestURL
			       }).
		           success(function(ddata, status, headers, config) {
		        	   announcementData = ddata;
		        	   deferred.resolve(announcementData);
				 }).error(function(ddata, status, headers, config) {
				             deferred.reject(ddata);
				 });
				return deferred.promise;
		 },
		 getQuickLinksData: function(flag) {
				
				var requestURL = '/serviceLane/mobile/getQuickLinks';
	           //var requestURL = '/serviceLane/pages/asm/mobile/json/quicklinks.json';
				var deferred = $q.defer();
				$http({
					 method: 'GET',
		             url: requestURL
			       }).
		           success(function(ddata, status, headers, config) {
		        	   getQuickLinkData = ddata;
		        	   deferred.resolve(getQuickLinkData);
				 }).error(function(ddata, status, headers, config) {
				             deferred.reject(ddata);
				 });
				return deferred.promise;
		 },getPrintData: function() {				
            	var requestURL = '/serviceLane/mobile/getPrintModuleList';
               //var requestURL = '/serviceLane/pages/asm/mobile/json/print1.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function(vdata, status, headers, config) {
                	printData = vdata;
                    deferred.resolve(printData);
                }).
                error(function(vdata, status, headers, config) {
                    deferred.reject(vdata);
                });
                return deferred.promise;         
            
			},printFormSubmit: function($data,mdl) {
				console.log("mdl",mdl);				
            	var requestURL = '/serviceLane/mobile/getPrintURL?module='+mdl;				
               //var requestURL = '/serviceLane/pages/asm/mobile/json/print1.json';
                var deferred = $q.defer();
                $http({
                    method: 'POST',
                    url: requestURL,
					data: $data,
					//cache: false
					
                }).
                success(function($data, status, headers, config) {
                	printSetData = $data;
                    deferred.resolve(printSetData);
                }).
                error(function($data, status, headers, config) {
                    deferred.reject($data);
                });
				//return mainService;
                return deferred.promise;         
            
			},getDtcInfoData: function($data,typ,land,sIdx,eIdx,lRwTech,lRwSer,next,prev,last,rwCunt,techCunt,sCount) {
				 if(typ == 'Techstream' || typ =='Service Connect'){
					  typ = typ;
				  }else{typ = 'ALL';}
				land = land ? !land : true;
				sIdx = sIdx ? sIdx : 0;
				eIdx = eIdx ? eIdx : 0;
				lRwTech = lRwTech ? lRwTech : 0;
				lRwSer = lRwSer ? lRwSer : 0;
				rwCunt = rwCunt ? rwCunt : 0;
				techCunt = techCunt ? techCunt : 0;
				sCount = sCount ? sCount : 0;
				next = next ? next : false;
				prev = prev ? prev : false;
				last = last ? last : false;
				var requestURL = '/serviceLane/mobile/getDTCHistory?type='+typ+'&startIndex='+sIdx+'&endIndex='+eIdx+'&lastRowTech='+lRwTech+'&lastRowService='+lRwSer+'&next='+next+'&previous='+prev+'&rowCount='+rwCunt+'&last='+last+'&serviceCount='+sCount+'&techCount='+techCunt+'&landing='+land;				
             //var requestURL = '/serviceLane/pages/asm/mobile/json/dtc.json';
			  var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL,
					data: $data,
				}).
                success(function($data, status, headers, config) {
                	dtcData = $data;
                    deferred.resolve(dtcData);
                }).
                error(function($data, status, headers, config) {
                    deferred.reject($data);
                });
				//return mainService;
                return deferred.promise;         
            
			},getRemoteHealthData: function(id) { 
				var param = '';
				if(id == 'healthCheck')
				{
					param = 'ALL_DIAG';	
				}
				else
				{
					param = 'DATA_PULL';	
				}
				  var requestURL = '/serviceLane/mobile/getRemoteHealthData?reqType='+param;				
	              //var requestURL = '/serviceLane/pages/asm/mobile/json/rmcheck.json';
				  var deferred = $q.defer();
	                $http({
	                    method: 'GET',
	                    url: requestURL,
					}).
	                success(function($data, status, headers, config) {
	                	remoteHealthData = $data;
	                    deferred.resolve(remoteHealthData);
	                }).
	                error(function($data, status, headers, config) {
	                    deferred.reject($data);
	                });
					//return mainService;
	                return deferred.promise;         
	            
			},getRemoteReqLog: function($data,type, status,oldData) {
				var encStatus = '';
				if(!type || type == 'All Request Types'){type ='ALL';}		
				if(!status || status  == 'All Statuses'){encStatus = 'ALL';}
				else{encStatus = encodeURIComponent(status);}
				if (!oldData){oldData= false;}
			  var requestURL = '/serviceLane/mobile/getRemoteReqLog?status='+encStatus+'&requestType='+type+'&showolder='+oldData;			  
              //var requestURL = '/serviceLane/pages/asm/mobile/json/rmLog.json';
			  var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL,
					data: $data,
				}).
                success(function($data, status, headers, config) {
                	dtcRmLogData = $data;
                    deferred.resolve(dtcRmLogData);
                }).
                error(function($data, status, headers, config) {
                    deferred.reject($data);
                });
				//return mainService;
                return deferred.promise;         
            
			},getReprogrammingData: function($data) {
			 var requestURL = '/serviceLane/mobile/getReprogrammingHistory';				
             //var requestURL = '/serviceLane/pages/asm/mobile/json/reprogramming.json';
			  var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL,
					data: $data,
				}).
                success(function($data, status, headers, config) {
                	reprogData = $data;
                    deferred.resolve(reprogData);
                }).
                error(function($data, status, headers, config) {
                    deferred.reject($data);
                });
				//return mainService;
                return deferred.promise;         
			},getVehiSpecData: function(vinnumber, $data) {
				var requestURL = '/serviceLane/mobile/getVehicleSpecification?vehicleId=' + vinnumber;
                //var requestURL = '/serviceLane/pages/asm/mobile/json/vehispec.json';
                var deferred = $q.defer();
                $http({
                    method: 'GET',
                    url: requestURL
                }).
                success(function($data, status, headers, config) {
                    vehicleSpecData = $data;
                    deferred.resolve(vehicleSpecData);
                }).
                error(function($data, status, headers, config) {
                    deferred.reject($data);
                });
                return deferred.promise;
            },
 		   getKcCarInfo: function(flag){
 	  			 var requestURL = '/serviceLane/mobile/getKcCarInfo?param='+flag;
 				 /*  if(flag == "initial")
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kccarinfo.json';
 				   else
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kccarinfomore.json'; */
 				   //var requestURL = '/serviceLane/pages/asm/mobile/json/flattire.json';
 				  // var requestURL = '/serviceLane/pages/asm/mobile/json/errorMessage.json';
 	  			   var deferred = $q.defer();
 	  					$http({
 	  						method: 'GET',
 	  						url: requestURL
 	  					}).
 	  					success(function(bdata, status, headers, config) {
 	  						isthirdPartyData = bdata;
 	  						deferred.resolve(isthirdPartyData);
 	  						
 	  					}).
 	  					error(function(bdata, status, headers, config) {
 	  						deferred.reject(bdata);
 	  					});
 	  					return deferred.promise;
 	  		   
 	  		   },
 	  		 getKcInterviewInfo: function(flag){
 	  			 	 var requestURL = '/serviceLane/mobile/getKcInterviewInfo?param='+flag;
 				   /*if(flag == "initial")
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kcinterview.json';
 				   else
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kcinterviewmore.json';*/
 				  // var requestURL = '/serviceLane/pages/asm/mobile/json/flattire.json';
 				 //  var requestURL = '/serviceLane/pages/asm/mobile/json/errorMessage.json';
 	     			   var deferred = $q.defer();
 	     					$http({
 	     						method: 'GET',
 	     						url: requestURL
 	     					}).
 	     					success(function(bdata, status, headers, config) {
 	     						isthirdPartyData = bdata;
 	     						deferred.resolve(isthirdPartyData);
 	     						
 	     					}).
 	     					error(function(bdata, status, headers, config) {
 	     						deferred.reject(bdata);
 	     					});
 	     					return deferred.promise;
 	     		   
 	     		   },
 	     		  getKcProdEduInfo: function(flag){
 	     			 var requestURL = '/serviceLane/mobile/getKcProdEduInfo?param='+flag;
 	  			   /*if(flag == "initial")
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kc.json';
 				   else
 					   var requestURL = '/serviceLane/pages/asm/mobile/json/kcmore.json';*/
 	  			// var requestURL = '/serviceLane/pages/asm/mobile/json/flattire.json';
 	  			 //var requestURL = '/serviceLane/pages/asm/mobile/json/errorMessage.json';
 	         			   var deferred = $q.defer();
 	         					$http({
 	         						method: 'GET',
 	         						url: requestURL
 	         					}).
 	         					success(function(bdata, status, headers, config) {
 	         						isthirdPartyData = bdata;
 	         						deferred.resolve(isthirdPartyData);
 	         						
 	         					}).
 	         					error(function(bdata, status, headers, config) {
 	         						deferred.reject(bdata);
 	         					});
 	         					return deferred.promise;
 	         		   
 	         		   },getDMYData: function(divi,model,year){					   
					   if(!divi)divi = '';if(!model)model = '';if(!year)year = '';
					   //console.log("isUndefined",angular.isUndefinedOrNull(divi),angular.isUndefined(model),angular.isUndefined(year));
 	     			 var requestURL = '/serviceLane/mobile/getDmyResponse?division='+divi+'&model='+model+'&year='+year; 	 			   
					//var requestURL = '/serviceLane/pages/asm/mobile/json/dmyDivision.json';
 	         			   var deferred = $q.defer();
 	         					$http({
 	         						method: 'GET',
 	         						url: requestURL
 	         					}).
 	         					success(function(bdata, status, headers, config) {
 	         						isthirdPartyData = bdata;
 	         						deferred.resolve(isthirdPartyData);
 	         						
 	         					}).
 	         					error(function(bdata, status, headers, config) {
 	         						deferred.reject(bdata);
 	         					});
 	         					return deferred.promise;
 	         		   
 	         		   },sendDMYData: function(divi,model,year){
						if(!divi)divi = '';if(!model)model = '';if(!year)year = '';
 	     			 var requestURL = '/serviceLane/mobile/sendDmyData?division='+divi+'&model='+model+'&year='+year; 		  			   
					//var requestURL = '/serviceLane/pages/asm/mobile/json/DMYModelName.json';
 	         			   var deferred = $q.defer();
 	         					$http({
 	         						method: 'GET',
 	         						url: requestURL
 	         					}).
 	         					success(function(bdata, status, headers, config) {
 	         						isthirdPartyData = bdata;
 	         						deferred.resolve(isthirdPartyData);
 	         						
 	         					}).
 	         					error(function(bdata, status, headers, config) {
 	         						deferred.reject(bdata);
 	         					});
 	         					return deferred.promise;
 	         		   
 	         		   },getASGData: function(view){
						if(!view) view = '';						
 	     			 var requestURL = '/serviceLane/mobile/getAsgIntegrationDetails?viewSelected='+view; 		  			   
					//var requestURL = '/serviceLane/pages/asm/mobile/json/asg.json';
 	         			   var deferred = $q.defer();
 	         					$http({
 	         						method: 'GET',
 	         						url: requestURL
 	         					}).
 	         					success(function(bdata, status, headers, config) {
 	         						isthirdPartyData = bdata;
 	         						deferred.resolve(isthirdPartyData);
 	         						
 	         					}).
 	         					error(function(bdata, status, headers, config) {
 	         						deferred.reject(bdata);
 	         					});
 	         					return deferred.promise;
 	         		   
 	         		   },getPerformanceData: function(){												
 	     			 var requestURL = '/serviceLane/mobile/getPerformanceDetails'; 		  			   
					//var requestURL = '/serviceLane/pages/asm/mobile/json/performance.json';
 	         			   var deferred = $q.defer();
 	         					$http({
 	         						method: 'GET',
 	         						url: requestURL
 	         					}).
 	         					success(function(bdata, status, headers, config) {
 	         						isthirdPartyData = bdata;
 	         						deferred.resolve(isthirdPartyData);
 	         						
 	         					}).
 	         					error(function(bdata, status, headers, config) {
 	         						deferred.reject(bdata);
 	         					});
 	         					return deferred.promise;
 	         		   
 	         		   }
        }
    }
]);
