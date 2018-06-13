var asmApp = angular.module('asmApp', ['ngRoute', 'ui.bootstrap', 
	'ngAnimate', 'ngTouch','ng.deviceDetector', 'angularjs-datetime-picker', 'asmApp.asmServices', 'asmApp.asmControllers','nvd3','ngSanitize', 'simplePagination']);
String.prototype.getPageName = function() {
    var val = this.ltrimSlash();
    if (val.indexOf("/") >= 0) {
        return val.substring(0, (val.indexOf("/")));
    } else {
        return val;
    }
};

String.prototype.ltrimSlash = function() {
    return this.replace(/^[\/]+/, "");
};
String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
asmApp.directive('multiBarHorizontalChart', function() {
  return {
    restrict: 'C',
    template: '<div class="sparkline"></div>'
  }
});
asmApp.directive('myMaxlength', function() {
  return {
    require: 'ngModel',
    link: function (scope, element, attrs, ngModelCtrl) {
      var maxlength = Number(attrs.myMaxlength);
      function fromUser(text) {
          if (text.length > maxlength) {
            var transformedInput = text.substring(0, maxlength);
            ngModelCtrl.$setViewValue(transformedInput);
            ngModelCtrl.$render();
            return transformedInput;
          } 
          return text;
      }
      ngModelCtrl.$parsers.push(fromUser);
    }
  }; 
});
/*asmApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){					
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);*/

asmApp.directive('uploadVideo', ['$parse', function($parse) {
    return {
        template: '<img ng-src="{{filepreview}}"  class="col-xs-6 col-sm-9 col-md-9 col-lg-9 adjPanel" width="100px" height="100px" ng-show="filepreview"/><input  type="file" accept="video/*"/><span ng-if="!filepreview" class="col-xs-6 col-sm-9 col-md-9 col-lg-9 uploadImage uploadVideo" ng-click="selectFile()" ></span><a class="close_btn col-lg-3 col-md-3 col-sm-3" ng-if="filepreview" ng-click="removeFile()">&nbsp;</a>',
        restrict: 'A',
        scope: { fileValue: '=uploadVideo',filepreview: '=filepreview' },
        link: function(scope, element, attrs) {
            var inputBox = element.find('input');
			scope.$watch('fileValue', function(value) {
                if (value == undefined || value == null) {
                    inputBox.val(null);
					scope.filepreview = null;
                }
            })
            element.bind('change', function() {				
                scope.$apply(function() {
                    scope.fileValue = inputBox[0].files[0];	
					scope.filepreview = "/serviceLane/pages/asm/mobile/images/Tablet/VideoPlay_icon.png";
                });		
            });
            scope.selectFile = function() {
                setTimeout(function(){inputBox.trigger('click')},10);
            }
            scope.removeFile = function() {
                inputBox.val(null);
                scope.fileValue = inputBox[0].files[0];
                scope.filepreview = null;
            }
        }
    };
}]);


asmApp.directive('fileModel', ['$parse', function($parse) {
    return {
       templateUrl: '/serviceLane/pages/asm/mobile/views/imageUpload.html',
        restrict: 'A',
        scope: { fileValue: '=fileModel', type: '=fileType', filepreview: '=filepreview', onOpen: "&", device: '=deviceType' },
        link: function(scope, element, attrs) {
            var inputBox = element.find('input');
			if (scope.type == undefined || scope.type == 'image') {
                scope.acceptType = "image/*";
            } else {
                scope.acceptType = "video/*";
            }
            scope.$watch('fileValue', function(value) {
                if (value == undefined || value == null) {
                    inputBox.val(null);
					scope.filepreview = null;
                }
            })			
            element.bind('change', function() {				
                scope.$apply(function() {
                    scope.fileValue = inputBox[0].files[0];	
					if(scope.type == 'video')
					{
						scope.filepreview = "/serviceLane/pages/asm/mobile/images/Tablet/VideoPlay_icon.png";
					}						
                });
				if(scope.type == 'image' && scope.device != 'windows')
				{
					var reader = new FileReader();
					reader.onload = function(loadEvent) {
						scope.$apply(function() {
							scope.filepreview = loadEvent.target.result;							
						});
					}
					reader.readAsDataURL(inputBox[0].files[0]);
				}
				else if(scope.type == 'image' && scope.device == 'windows'){
					scope.$apply(function() {
						scope.filepreview = "/serviceLane/pages/asm/mobile/images/Tablet/image_preview.png";									
					});
					
				}
            });
            scope.selectFile = function() {				
                setTimeout(function(){inputBox.trigger('click')},10);
            }
            scope.removeFile = function() {
                inputBox.val(null);
                scope.fileValue = inputBox[0].files[0];
                scope.filepreview = null;
            }
			
			scope.openCam  = function() {
				 setTimeout(function(){
							scope.onOpen();
						},10);  
				
			}
			
				
        }
    };
}]);

asmApp.directive('fileModelLive', ['$parse', function($parse) {
    return {
        template: '<img ng-src="{{filepreview}}"  class="col-xs-6 col-sm-9 col-md-9 col-lg-9 adjPanel" width="100px" height="100px" ng-show="filepreview"/><input  type="file" accept="image/*"/><span   ng-if="!filepreview" class="col-xs-6 col-sm-9 col-md-9 col-lg-9 uploadImage uploadImagelive" ng-click="selectFile()" ></span><a id="preview2" class="close_btn col-lg-3 col-md-3 col-sm-3" ng-if="filepreview" ng-click="removeFile()">&nbsp;</a>',
        restrict: 'A',
        scope: { fileValue: '=fileModelLive', filepreview: '=filepreview' },
        link: function(scope, element, attrs) {
            var inputBox = element.find('input');          
            scope.$watch('fileValue', function(value) {
                if (value == undefined || value == null) {
                    inputBox.val(null);
					scope.filepreview = null;
                }
            })
            element.bind('change', function() {				
                scope.$apply(function() {
                    scope.fileValue = inputBox[0].files[0];					
                });
                var reader = new FileReader();
                reader.onload = function(loadEvent) {
                    scope.$apply(function() {
                        scope.filepreview = loadEvent.target.result;						
                    });
                }
                reader.readAsDataURL(inputBox[0].files[0]);
            });
            scope.selectFile = function() {
                setTimeout(function(){inputBox.trigger('click')},10);
            }
            scope.removeFile = function() {
                inputBox.val(null);
                scope.fileValue = inputBox[0].files[0];
                scope.filepreview = null;
            }
        }
    };
}]);

asmApp.directive("clickToEdit", function () {   
	
    return {
        restrict: "A",
        templateUrl: '/serviceLane/pages/asm/mobile/views/editPopup.html',
        scope: {
            value: "=clickToEdit",
            inputLabel: "=editorLabel",
            options:"=editorOptions",
			pattern:"=editorPattern",
			onSave: "&",
			validateFn:"&"
        },
        link: function (scope, element, attrs) {			
            scope.view = {
                editableValue: scope.value,
                editorEnabled: false,
                label:scope.inputLabel,
                error:'',
                hasError:false
            };
            scope.enableEditor = function () {
                scope.view.editorEnabled = true;
                scope.view.editableValue = scope.value;
				setTimeout(function () {
                    element.find('input')[0].focus();
                });
            };

            scope.disableEditor = function () {
                scope.view.editorEnabled = false;
                scope.view.hasError = false;
                scope.view.error = '';
            };

            scope.save = function () {				
                if(scope.view.editableValue == '' || scope.view.editableValue == undefined){
                  scope.view.hasError = true;
                  scope.view.error = "Please enter the input value"
                  return;
                }
				if(scope.view.label != 'Last Build Date ' && scope.view.editableValue.toUpperCase() == scope.value.toUpperCase())
				{					
                  scope.view.hasError = true;
                  scope.view.error = "Value already exists"
                  return;
                }
				if(scope.pattern != undefined){
					var regex = new RegExp(scope.pattern)
					if(!regex.test(scope.view.editableValue)){
					  scope.view.hasError = true;
					  scope.view.error = "Please enter a valid "+scope.view.label;
					  return;
					}
				}
				if(scope.view.label == 'VIN ' && !scope.validateFn({vin:scope.view.editableValue}))
				{
					scope.view.hasError = true;
					scope.view.error = "Please enter a valid VIN";
					return;
				}				
                if(scope.options){
					if(scope.options.indexOf(scope.view.editableValue) != -1){
                      scope.view.hasError = true;
                      scope.view.error = "Value already exists";
                      return;
                    }
                  for(var i=0;i<scope.options.length;i++){
                    if(scope.options[i] == scope.value){
                      scope.options[i]=scope.view.editableValue;
                      scope.value = scope.options[i];
					  setTimeout(function(){
							scope.onSave();
						},10);                      
                      break;
                    }
                  }
                  if(scope.value == undefined || scope.value ==''){
					  scope.value = scope.view.editableValue;
					  scope.options.push(scope.value);
					  setTimeout(function(){
							scope.onSave();
					},10);
				  }				  
                }
                else{
					if(scope.view.label == 'Plant '){						
					    scope.value = scope.view.editableValue.toUpperCase();	
						setTimeout(function(){
							scope.onSave();
						});
					}
					else{
						scope.value = scope.view.editableValue;  
					}                 
                }
                scope.disableEditor();
            };

        }
    };
});
asmApp.directive('starRating', function() {
      return {
        restrict: 'A',
        template: '<ul class="rating">' +
          '<li ng-repeat="star in stars" ng-class="star">' +
          '&#10029' +
          '</li>' +
          '</ul>',
        scope: {
          ratingValue: '=',
          max: '='
        },
        link: function(scope, elem, attrs) {
          scope.stars = [];
          for (var i = 0; i < scope.max; i++) {
            scope.stars.push({
              filled: i < scope.ratingValue
            });
          }
        }
      }
    })
asmApp.directive('stopEvent', function () {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            element.bind('click', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
        }
    };
 });
asmApp.directive('stopEventprop', function () {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            element.bind('click', function (e) {
                e.stopPropagation();
            });
        }
    };
 });
asmApp.directive('myTouchstart', [function() {
	return function(scope, element, attr) {
		element.on('touchstart', function(event) {

				event.stopPropagation();
				if(attr.type != "text" && element.prop('nodeName') != "TEXTAREA" && attr.type != "tel" && attr.type != "number") {
					event.preventDefault();
				}

			scope.$apply(function() {
				scope.$eval(attr.myTouchstart);
			});
		});
	};
}]);
asmApp.directive('noTouchstart', [function() {
    return function(scope, element, attr) {

        element.on('touchstart', function(event) {
            scope.$apply(function() { 
                scope.$eval(attr.noTouchstart); 
            });
        });
    };
}]);
//Prevent touch move on body to make web app pop up background and pop up not moving.
asmApp.directive("stopScreenMove", function() {
        return {
        	restrict: 'A',
        	scope: true,
        	link: function (scope, element, attrs) {
 		//if (/(iPhone|iPod|iPad)/.test(navigator.userAgent) ) {
	            element.on("touchmove", function (event) {
	            	event.preventDefault();
	            });
		//}
        	}
        };
});

asmApp.directive('compile', ['$compile', function ($compile) {
    return function(scope, element, attrs) {
      scope.$watch(
        function(scope) {
          // watch the 'compile' expression for changes
          return scope.$eval(attrs.compile);
        },
        function(value) {
          // when the 'compile' expression changes
          // assign it into the current DOM
          element.html(value);

          // compile the new DOM and link it to the current
          // scope.
          // NOTE: we only compile .childNodes so that
          // we don't get into infinite loop compiling ourselves
          $compile(element.contents())(scope);
        }
    );
  };
}]);
 asmApp.directive('openDocument', function () {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            element.bind('click', function (e) {
				var docURL = element.attr('data-url');
				var openPopup = element.attr('dtc-popup');
				if (windowsCheck){
					if (docURL.toLowerCase().indexOf("pdf") !== -1){
						//element.css("font-weight","bold");  
						element.css("color","#673ab7");
						if (docURL.toLowerCase().indexOf("https") !== -1){
							var windArrExport = ["filetransfer",docURL,"testtt",document.domain,true];
							window.external.notify(JSON.stringify(windArrExport));							
						}
						else{
							var windArrExport = ["filetransfer","https://"+document.domain+docURL,"testtt",document.domain,false];
							window.external.notify(JSON.stringify(windArrExport));							
						}

					}
					else{

						if (docURL.toLowerCase().indexOf("https") !== -1){
						var windArr = ["inappbrowser",docURL,""];
						window.external.notify(JSON.stringify(windArr));
						}
						else{
						var windArr = ["inappbrowser","https://"+document.domain+docURL,""];
						window.external.notify(JSON.stringify(windArr));
						}
					}
					
					return false;
				}
				else if (/Android|webOS|IEMobile/i.test(navigator.userAgent)) {
				    //if (docURL.indexOf("pdf") !== -1){
				    if (docURL.toLowerCase().indexOf("pdf") !== -1) {
				        //element.css("font-weight","bold"); 
				        element.css("color", "#673ab7");
				        scope.$apply(function() {
				            scope.isLoading.loadimage = true;
				        });
				        var
				        dynamicYes = false;
				        dynamicYes = element.attr('data-dynamicc');

				        if (docURL.toLowerCase().indexOf("https") !== -1) {
				            var monopdfurl = docURL;
				        } else {
				            var monopdfurl = "https://" + document.domain + docURL;
				        }
						if(openPopup){var popup = window.open(encodeURI(monopdfurl),'rmtReqLogPopup', 'location=yes,hidden=yes');}
						else{var popup = window.open(encodeURI(monopdfurl), "_blank", "location=yes,hidden=yes");}
				        popup.addEventListener("loadstop", function(event) {
				            if (event.url.toLowerCase().indexOf("loginfailure") !== -1) {
				                var scope = angular.element(
				                    document.getElementById("containerWrap")).
				                scope();
				                scope.$apply(function() {
				                    scope.isLoading.loadimage = false;
				                });
				                popup.show();
				            } else { //starts
									popup.close();
									if (docURL.toLowerCase().indexOf("https") !== -1) {
										var monopdfurl = docURL;
													document.addEventListener('deviceready', function() {
													var fileTransfer = new FileTransfer();

													fileTransfer.download(
														monopdfurl,
														"cdvfile://localhost/persistent/tt_Information_mono.pdf",
														function(entry) {
															var scope = angular.element(
																document.getElementById("containerWrap")).
															scope();
															scope.$apply(function() {
																scope.isLoading.loadimage = false;
															});
															cordova.plugins.fileOpener2.open(
																"cdvfile://localhost/persistent" + entry.fullPath,
																'application/pdf', {
																	error: function(e) {
																		alert('Error status: ' + e.status + ' - Error message: ' + e.message);
																	},
																	success: function() {

																		// alert('file opened successfully');                
																	}
																}
															);
														},
														function(error) {
															alert("download error source " + error.source);
															alert("download error target " + error.target);
															alert("upload error code" + error.code);
														});
													});
										
									} else {
										var monopdfurl = encodeURIComponent("https://" + document.domain + docURL);
										var strUrlpdfappend = "https://"+document.domain+"/serviceLane/staticcontent/pdfjs-1.7.225-dist/web/viewer.html?file="+monopdfurl;
										setTimeout(function(){
											document.addEventListener('deviceready', function(){
											if(openPopup){var popup = window.open(strUrlpdfappend,'rmtReqLogPopup', 'location=yes,hidden=yes');}
											else{var popup = window.open(strUrlpdfappend, "_blank", "location=yes,hidden=yes");}
												popup.addEventListener("loadstop", function() {
													popup.show(); 
													var scope = angular.element(document.getElementById("containerWrap")).scope();
													scope.$apply(function() {
														 scope.isLoading.loadimage = false;
													 });
												}, false);
	
											});
										},100);
									}
				            }

				        });
				    } else {
				        //window.open(docURL, '_blank', 'location=yes');
				        scope.$apply(function() {
				            scope.isLoading.loadimage = true;
				        });
						if(openPopup){var popup = window.open(docURL, 'rmtReqLogPopup', 'location=yes,toolbar=yes,hidden=yes');}
						else{var popup = window.open(docURL, "_blank", "location=yes,toolbar=yes,hidden=yes");}
				        popup.addEventListener("loadstop", function() {
				            popup.show();
				            scope.$apply(function() {
				                scope.isLoading.loadimage = false;
				            });
				        });
				    }
				}
				else if(/(iPhone|iPod|iPad)/.test(navigator.userAgent)){
					if (docURL.indexOf("pdf") !== -1){
						//element.css("font-weight","bold");
						element.css("color","#673ab7");
					}
					//window.open(docURL, '_blank', 'location=yes');
					scope.$apply(function () {
						scope.isLoading.loadimage = true;
					});
					if(openPopup){
						var popup = window.open(docURL, 'rmtReqLogPopup', 'location=yes,toolbar=yes,hidden=yes');
					}
					else{
						//var popup = window.open(docURL, "_blank", "location=yes,toolbar=yes,hidden=yes");
						window.open(docURL, "_blank", "location=yes");
						scope.$apply(function () {
							scope.isLoading.loadimage = false;
						});
					}					
					popup.addEventListener("loadstop", function() {
						popup.show();
						scope.$apply(function () {
							scope.isLoading.loadimage = false;
						});
					});
					}
					else {
					if (docURL.indexOf("pdf") !== -1){
					//element.css("font-weight","bold");
					element.css("color","#673ab7");
					}
					if(openPopup){window.open(docURL, 'rmtReqLogPopup', 'location=yes');}
					else{window.open(docURL, '_blank', 'location=yes');}
					}
				return false;
				}
            );
        }
    };
 });
 /*(asmApp.directive('openDocumentvhr', function () {
	    return {
	        restrict: 'A',
	        link: function (scope, element, attr) {
	            element.bind('click', function (e) {
	                var docURL = element.attr('data-url');				
					window.open(docURL, '_blank', 'location=yes');
	            });
	        }
	    };
	 });*/
asmApp.directive('isNumber', function () {
	return {
		require: 'ngModel',		
		link: function(scope, element, attrs, modelCtrl) {
			modelCtrl.$parsers.push(function (mileage) {			   
			   var maxL = parseInt(attrs.maxl,10)
			   if (typeof(mileage) == "undefined" ) return '' 
			   var transformedInput = mileage.replace(/[^0-9]/g, ''); 
			   var tempCheckNumber = parseInt(transformedInput);
			   if(!isNaN(tempCheckNumber))
				  transformedInput = tempCheckNumber.toString();
			   if (transformedInput!=mileage ||  transformedInput.length > maxL) {
				  transformedInput = transformedInput.substr(0, maxL);
				  modelCtrl.$setViewValue(transformedInput);
				  modelCtrl.$render();
			   }         
				
			   return transformedInput;         
       });
     }
	};
});
asmApp.directive('isAuthcodeval', function () {
	return {
		require: 'ngModel',		
		link: function(scope, element, attrs, modelCtrl) {
			modelCtrl.$parsers.push(function (authcodeVal) {	
			   var maxL = parseInt(attrs.maxl,10)
			   if (typeof(authcodeVal) == "undefined" ) return '' 
			   var transformedInput = authcodeVal;
			   if (transformedInput!=authcodeVal ||  transformedInput.length > maxL) {
				  transformedInput = transformedInput.substr(0, maxL);
				  modelCtrl.$setViewValue(transformedInput);
				  modelCtrl.$render();
			   }         
				
			   return transformedInput;         
       });
     }
	};
});
asmApp.directive("dtipp", function(){
	 return function(scope, element) {
	  element.bind("click", function(){
		  if(this.offsetWidth < this.scrollWidth){
			  scope.displayTcuvpopup();
			  var evtobj = window.event ? window.event : e;
			  displayballoontip(this, evtobj,1);
			}
		});
	}
});

//VHR warning List popup 
asmApp.directive("vhrdtip", function(){
	 return function(scope, element) {
	  element.bind("click", function(){
			scope.displayTcuvpopup();
			var evtobj = window.event ? window.event : e;
			displayballoontip(this, evtobj,1);
		});
	}
});


asmApp.directive("popWindow", function(){
	 return function(scope, element) {
	  element.bind("click", function(){
		var dealerCode = element.attr('data-dcode');
			scope.displayTcuvpopup(dealerCode)				
			var evtobj = window.event ? window.event : e
			displayballoontip(this, evtobj,1)					
		  });
		}
});

asmApp.directive("newtip", function(){
	 return function(scope, element) {
		  element.bind("click", function(){
			  element.removeClass('newthreedot');
			   
				 					
		  });
		  
		}
});

asmApp.directive("donlytip", function(){
	 return function(scope, element) {
		  element.bind("click", function(){	
				var evtobj = window.event ? window.event : e;
					displayballoontip(this, evtobj,0);					
		  });
		  
		}
});

asmApp.directive("popSwindow", function(){
		 return function(scope, element) {
			  element.bind("click", function(){
				var subId = element.attr('data-scode');
				scope.displaySubcriberPopup(subId)				
				var evtobj = window.event ? window.event : e
				displayballoontip(this, evtobj,1)					
			  });
			}
});

asmApp.directive("dealerPopup", function(){
	return {
	 
	restrict:'E',
	scope:{
		dname:"@",
		dcode:"@"
	},
	link: function(scope, element, attrs, modelCtrl) {
	scope.dialogStyle = {};
    scope.toggleModal =  function(){
	scope.show = true;
	//scope.$parent.dealPopUp = true;
	//alert(scope.dealPopUp);
	scope.dealerCodeTcuv = attrs.dcode;
	 
	//angular.element("#popUpOverlay").css('display','block');
	 
	angular.element(".adjPortrait").css({'z-index':'auto','overflow-y':'auto'});
	scope.callDealService();
	  
	}
	scope.hideModal =  function(){
	scope.show = false;
	//scope.$parent.dealPopUp = false;
	}
	 
	},
	controller: function($scope, mainService) {
	$scope.callDealService =  function(){
	mainService.getDealerCodeData($scope.dealerCodeTcuv).then(function(ddata) {
	$scope.setTcuvFlag = true;
	$scope.dealerD = ddata;
	});  
	}
	     },
	template:"<span ng-if='(dcode == \"N/A\" && dname == \"N/A\")' style='display:inline;'>N/A</span><span ng-if='(dcode == \"N/A\" && dname != \"N/A\")' style='display:inline;'>{{dname}} ({{dcode}})</span><span ng-click='toggleModal()' ng-if='(dcode != \"N/A\" && dname == \"N/A\")' style='display:inline;' class='dealernameclass'>{{dname}} ({{dcode}})</span><span ng-click='toggleModal()' ng-if='(dcode != \"N/A\" && dname != \"N/A\")' style='display:inline;' class='dealernameclass'>{{dname}} ({{dcode}})</span><div ng-if='show' class='ng-modal' ng-show='show'><div class='ng-modal-overlay' ng-click='hideModal()' my-touchstart='hideModal()' ></div><div stop-screen-move class='ng-modal-dialog' ng-style='dialogStyle'><div class='ng-modal-close' ng-click='hideModal()'>X</div><div class='ng-modal-dialog-content' ><div ng-include=\"'/serviceLane/pages/asm/mobile/views/dealerPopup.html'\"></div></div></div></div>"
	}
	});

asmApp.directive("popTrouble", function(){
		 return function(scope, element) {
			  element.bind("click", function(){
			var troubeCodeKey = element.attr('data-tcode');
			var troubeCodeValue = element.attr('data-tvalue');
				scope.displayTroubleCodepopup(troubeCodeKey,troubeCodeValue);				
				var evtobj = window.event ? window.event : e;
				displayballoontip(this, evtobj,1);
				scope.troubleD.troubleCodeJson	= '';
			  });
			};
});
asmApp.directive("aut", function(){
		 return function(scope, element) {
			  element.bind("click", function(){
			var troubeCodeKey = element.attr('data-tcode');
			var troubeCodeValue = element.attr('data-tvalue');
				scope.displayTroubleCodepopup(troubeCodeKey,troubeCodeValue);				
				var evtobj = window.event ? window.event : e;
				displayballoontip(this, evtobj,1);
				scope.troubleD.troubleCodeJson	= '';
			  });
			};
});

asmApp.directive("dtip", function($compile){
	 return {
		 scope:{
			 donly : "=",
			 rel:"@"
		 },
		 restrict:"A",
		 link:function(scope, element,attrs) {

				scope.hideModal1 =  function(){
					
					scope.show1 = false;
					element.next().remove();
					console.log(element);
					
					
					}
		  element.bind("click", function(){
			  if(!scope.donly) {
				  if(this.offsetWidth < this.scrollWidth){
					  scope.show1 = true;
					  angular.element(".adjPortrait").css({'z-index':'auto','overflow-y':'auto'});
			  element.after($compile("<div ng-show='show1' class='ng-modal'  ><div class='ng-modal-overlay' ng-click='hideModal1()' my-touchstart='hideModal1()'  ></div><div stop-screen-move class='ng-modal-dialog' ng-style='dialogStyle'><div class='ng-modal-close' ng-click='hideModal1()'>X</div><div class='ng-modal-dialog-content' >{{rel}}</div></div></div> ")
					             (scope));
				  }
			  }
			  else{
					  scope.show1 = true;
					  angular.element(".adjPortrait").css({'z-index':'auto','overflow-y':'auto'});
					  element.after($compile("<div ng-show='show1' class='ng-modal'  ><div class='ng-modal-overlay' ng-click='hideModal1()' my-touchstart='hideModal1()'  ></div><div stop-screen-move class='ng-modal-dialog' ng-style='dialogStyle'><div class='ng-modal-close' ng-click='hideModal1()'>X</div><div class='ng-modal-dialog-content' ng-bind-html='rel'></div></div></div> ")
					             (scope));

			  }

			  });
			}
	 }
});

asmApp.directive('scrollTo', function ($location, $anchorScroll) {
    return function(scope, element, attr) {
      element.bind('touchstart click', function(event) {
        event.stopPropagation();
        scope.$on('$locationChangeStart', function(ev) {
            ev.preventDefault();
        });
		if(element.attr('scoll-page'))
			var location = 'linksmGridNote_'+element.attr('scroll-url');
		else
			var location = 'linkNote_'+element.attr('scroll-url');
		//if ($location.hash() !== location){
			$location.hash(location);
			//alert("calling");
			$anchorScroll();
			/*}
			else
				return false;*/
        
      });
    }
  });
  
  asmApp.config(['$httpProvider', function($httpProvider) {
    //initialize get if not there
    if (!$httpProvider.defaults.headers.get) {
        $httpProvider.defaults.headers.get = {};    
    }    
    //disable IE ajax request caching
    $httpProvider.defaults.headers.get['If-Modified-Since'] = 'Mon, 26 Jul 1997 05:00:00 GMT';
    $httpProvider.defaults.headers.get['Cache-Control'] = 'no-cache';
    $httpProvider.defaults.headers.get['Pragma'] = 'no-cache';

}]);
 
asmApp.config(['$routeProvider', function($routeProvider, $locationProvider) {
	$routeProvider
		.when('/vehicleInfo', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/vehicleinformation.html',
			controller: "vehInfoController"
		})
		.when('/campaign',{
			templateUrl: '/serviceLane/pages/asm/mobile/views/campaign.html',
			controller: "campController"
		})
		.when('/care',{
			templateUrl: '/serviceLane/pages/asm/mobile/views/care.html',
			controller: "careController"
		})
		.when('/warranty', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/warranty.html',
			controller: "warrantyController"
		})
		.when('/servicehistory', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/servicehistory.html',
			controller: "serviceHistoryController"
		}) 
		.when('/olderservicehistory', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/olderservicehistory.html',
			controller: "olderServiceHistoryController"
		})
		.when('/product', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/fsproducts.html',
			controller: "fsproductController"
		}) 
		.when('/customersurvey', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/customersurvey.html',
			controller: "customerSurveyController"
		})
		.when('/vhr', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/vhr.html',
			controller: "vhrController"
		}) 
		.when('/lps', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/lps.html',
			controller: "lpsController"
		}) 
		.when('/roadside', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/roadsideassistance.html',
			controller: "roadSideAssistanceController"
		})
		.when('/telematics', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/telematics.html',
			controller: "telematicsController"
		}).when('/sm', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/sheduleManitance.html',
			controller: "smController"
		}).when('/vspec', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/vehiclespecification.html',
			controller: "vehInfoController"
		}).when('/dtc', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/dtc.html',
			controller: "dtcController"
		}).when('/kc', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/knowledgecenter.html',
			controller: "kcController"
		}).when('/librarysearch', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/librarysearch.html',
			controller: "librarySearchController"
		}).when('/ASG', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/asg.html'
		}).when('/performance', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/performance.html'
		}).when('/issueList', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/issueList.html',
			controller: "issueListController"
		}).when('/issueEntry', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/issueEntry.html',
			controller: "issueEntryController"
		}).when('/auditSetup', {
			templateUrl: '/serviceLane/pages/asm/mobile/views/auditSetup.html',
			controller: "auditSetupController"
		}).otherwise({
		redirectTo: '/'
	});       
}]);

var asmControllers = angular.module('asmApp.asmControllers', []);
var asmServices = angular.module('asmApp.asmServices', []);


function validateEmail($email) {
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test($email);
	}
	
var disappeardelay = 250 //tooltip disappear delay (in miliseconds)
	var verticaloffset = 0 //vertical offset of tooltip from anchor link, if any
	var enablearrowhead = 1 //0 or 1, to disable or enable the arrow image
	var arrowheadimg = ["/serviceLane/pages/asm/mobile/images/Tablet/arrowdown.gif", "/serviceLane/pages/asm/mobile/images/Tablet/arrowup.gif"] //path to down and up arrow images
	var arrowheadheight = 11 //height of arrow image (amount to reveal) 
		
	var ie = document.all
	var ns6 = document.getElementById && !document.all
	verticaloffset = (enablearrowhead) ? verticaloffset + arrowheadheight : verticaloffset

	function getposOffset(what, offsettype) {
		var totaloffset = (offsettype == "left") ? what.offsetLeft : what.offsetTop;
		var parentEl = what.offsetParent;
		return totaloffset;
	}

	function showhide(obj, e) {
		//dropmenuobj.style.left = dropmenuobj.style.top = "-500px"
		if (e.type == "click")
			obj.visibility = "visible"
	}

	function iecompattest() {
		return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
	}

	function clearbrowseredge(obj, whichedge) {
		if (whichedge == "rightedge") {
			edgeoffsetx = 0
			var windowedge = ie && !window.opera ? iecompattest().scrollLeft + iecompattest().clientWidth - 15 : window.pageXOffset + window.innerWidth - 15
			dropmenuobj.contentmeasure = dropmenuobj.offsetWidth
			if (windowedge - dropmenuobj.x < dropmenuobj.contentmeasure)
				edgeoffsetx = dropmenuobj.contentmeasure - obj.offsetWidth
			if (dropmenuobj.x - edgeoffsetx + dropmenuobj.contentmeasure > windowedge)
				edgeoffsetx = dropmenuobj.x - windowedge + dropmenuobj.contentmeasure
			return edgeoffsetx
		} else {
			edgeoffsety = 0
			var topedge = ie && !window.opera ? iecompattest().scrollTop : window.pageYOffset
			var windowedge = ie && !window.opera ? iecompattest().scrollTop + iecompattest().clientHeight - 15 : window.pageYOffset + window.innerHeight - 18
			dropmenuobj.contentmeasure = dropmenuobj.offsetHeight
			if (windowedge - dropmenuobj.y < dropmenuobj.contentmeasure) //move up?
				edgeoffsety = dropmenuobj.contentmeasure + obj.offsetHeight + (verticaloffset * 2)
			return edgeoffsety
		}
	}

	function displayballoontip(obj, e,popupflag) { //main ballooon tooltip function
		//when popup loads body style changed to overflow-y:hidden
		//angular.element("body").css({'overflow-y':'hidden'});
		angular.element("#popUpOverlay").css('display','block');	
		angular.element(".customersurveypage .panel-default > .panel-heading").css('display','inline-block');	
		
		if(popupflag == 1)
			{
			angular.element(".adjPortrait").css({'z-index':'auto','overflow-y':'auto'});
		/*	if(window.innerWidth <= 809)	
				angular.element(".adjPortrait").css('margin-top','0px');
			if(window.innerWidth >= 811 && window.innerWidth <= 992)	
				angular.element(".adjPortrait").css('overflow-x','auto'); */
			}

		if (window.event) event.cancelBubble = true
		else if (e.stopPropagation) e.stopPropagation()
		if (typeof dropmenuobj != "undefined") //hide previous tooltip?
			dropmenuobj.style.visibility = "hidden";
		clearhidemenu();
		dropmenuobj = document.getElementById(obj.getAttribute("rel"))
		showhide(dropmenuobj.style, e)
		dropmenuobj.x = getposOffset(obj, "left")
		dropmenuobj.y = getposOffset(obj, "top") + verticaloffset
		//dropmenuobj.style.left = dropmenuobj.x - clearbrowseredge(obj, "rightedge") + "px"
		//dropmenuobj.style.top = dropmenuobj.y - clearbrowseredge(obj, "bottomedge") + obj.offsetHeight + "px"
		
	}
	function clearhidemenu() {
		if (typeof delayhide != "undefined")
			clearTimeout(delayhide)
	}

	function reltoelement(linkobj) { //tests if a link has "rel" defined and it's the ID of an element on page
		var relvalue = linkobj.getAttribute("rel")
		return (relvalue != null && relvalue != "" && document.getElementById(relvalue) != null && document.getElementById(relvalue).className == "balloonstyle") ? true : false
	}
	
	
	

function Ctrl($scope) {
    $scope.a = {i: 0};
    $scope.b = false;
}

function TabCtrl($scope) {
    $scope.list = [];//$http ... heavy request for a resource
}

function successCallback(data) {
    console.log("Success!");
    // window.plugins.launcher.launch({packageName:'com.facebook.katana'}, this.successCallback, this.errorCallback);
    // if calling canLaunch() with getAppList:true, data will contain an array named "appList" with the package names of applications that can handle the uri specified.
}
function errorCallback(errMsg) {
    console.log("Error! " + errMsg);
}
function fbopen(){
    window.plugins.launcher.launch({packageName:'com.facebook.katana'}, successCallback, errorCallback);
}
function hybridopen(){
    window.plugins.launcher.launch({packageName:'com.hybrid.test'}, successCallback, errorCallback);
}
function inappopen(){
    window.plugins.launcher.launch({uri:'https://www.google.com'}, successCallback, errorCallback);
}
asmApp.filter('split', function() {
  return function(input, delimiter) {
    delimiter = delimiter || ','
  var a = input.split(delimiter);
    return a[a.length-1];
    //return a;
  }
});


asmApp.filter('startFrom', function() {
    return function(input, start) {
	 if (!input || !input.length) { return; }
        start = +start; //parse to int
        return input.slice(start);
    }
});

$(window).bind("touchstart click",function() {
	angular.element(".tooltipPopUp").css('visibility','hidden');
	angular.element(".tooltipPopUpUpdated").css('visibility','hidden');
	angular.element(".tooltipPopUpBottomLine").css('visibility','hidden');
	angular.element(".tooltipPopUpCSPBottomline").css('visibility','hidden');
});