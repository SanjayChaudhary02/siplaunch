<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

        	<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg1"/>
        		
        	<h:form id="warrantyForm">
        	<c:set value="${standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyDetails}" var="standardWarrantyDetails"></c:set>
        	<c:if test="${not empty standardWarrantyControllerBean.standardWarrantyVinVo.vinNumber and not empty standardWarrantyControllerBean.standardWarrantyVO.usrStateMap}">
	   		<div style="text-align:center;">
	   		 <h:outputLabel value="#{msg1['portlets.warranty.description.header']}" style="font-weight:bold;text-align: center;"></h:outputLabel>
	   			<h:outputText>&nbsp;</h:outputText>
	   			<c:if  test="${standardWarrantyControllerBean.standardWarrantyVO.expiredwarranty==true }">
						<h:outputLabel value="#{msg1['portlets.warranty.description.alertmsg']}" style="font-weight:bold;text-align: left;color:red;">
						</h:outputLabel>
				 </c:if>
				 </div>
				 <c:if test="${not empty salvageVinControllerBean.salvageVinVo and salvageVinControllerBean.salvageVinVo.salvageVin}">
	   			<div id="warratySalvage">
	   				<jsp:include page="/pages/asm/vehicleOneView/salvageVin/salvageVin.jsp"></jsp:include>
	   			</div>
			</c:if>
   	
        	
        	<table style="table-layout:fixed;" id ="warrtable">
        		<tr>
        			<td colspan="2">
        				<h:panelGrid style="text-align: center;" width="100%" >
		       			
  						<h:outputText>&nbsp;</h:outputText>
		       			<h:panelGrid columns="2" width="100%" columnClasses="retailst1stColumn,retailst2ndColumn">
		       				<h:panelGroup>
		       					<h:outputLabel style="font-weight:bold;" value="#{standardWarrantyControllerBean.standardWarrantyVO.modelYear}" />&nbsp;<h:outputLabel style="font-weight:bold;" value="#{standardWarrantyControllerBean.standardWarrantyVO.modelName}" />
		       					&nbsp;<h:outputLabel style="font-weight:bold;" value="#{msg1['portlets.label.vin']}">:&nbsp;</h:outputLabel><h:outputText value="#{standardWarrantyControllerBean.standardWarrantyVO.vin}" />
		       				</h:panelGroup>
		       				<h:panelGroup>
		       					<h:outputLabel value="" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h:outputLabel>
		       					<h:outputLabel style="font-weight:bold;" value="Retailed State">:&nbsp;</h:outputLabel><h:outputText value="#{standardWarrantyControllerBean.standardWarrantyVO.retailedState != \"Info not available\" ? standardWarrantyControllerBean.standardWarrantyVO.retailedState : \"N/A\"}" />
		       				</h:panelGroup>
		       			</h:panelGrid>
		       			
		       			<h:panelGrid columns="3" width="100%" columnClasses="warranty1stColumn,warranty2ndColumn,warranty3rdColumn">
		       				<h:panelGroup style="text-align: left;" rendered="#{!standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
		       					<h:outputLabel value="#{msg1['portlets.warranty.description.monthservice']}" style="font-weight:bold;">&nbsp;</h:outputLabel>
		       					<h:outputText value="#{standardWarrantyControllerBean.standardWarrantyVO.dofu}" />
		       				</h:panelGroup>
		       				<h:panelGroup style="text-align: left;" rendered="#{standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
		       					<h:outputLabel value="">&nbsp;</h:outputLabel>
		       				</h:panelGroup>
		       				<h:panelGroup style="text-align: left;" rendered="#{!standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
		       					<h:outputLabel value="#{msg1['portlets.warranty.description.mileage']}" style="font-weight:bold">&nbsp;</h:outputLabel>
		       					<h:outputText value="#{standardWarrantyControllerBean.standardWarrantyVO.mileage}" rendered="#{standardWarrantyControllerBean.standardWarrantyVO.mileage != '0'}"/>
		       					<h:outputText value="0" rendered="#{standardWarrantyControllerBean.standardWarrantyVO.mileage == '0'}"/>
		       				</h:panelGroup>
		       				<h:panelGroup style="text-align: left;" rendered="#{standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
		       					<h:outputLabel value="">&nbsp;</h:outputLabel>
		       				</h:panelGroup>
		       				<h:panelGroup style="text-align: right;">
		       					<h:outputLabel value="#{msg1['portlets.warranty.description.state']}" style="font-weight:bold">&nbsp;</h:outputLabel>
								<h:outputText value="#{standardWarrantyControllerBean.warrantyUserState.userState}" />
		       				</h:panelGroup>
		       			</h:panelGrid>
		       			
	       			</h:panelGrid>
        			</td>
        		</tr>
        		<c:if test="${!standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
       			     		
			<tr>
        			<td colspan="2">
        			
	       			
	       			<input type="hidden" value="${standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage}" id="lastKnownMileageId"/>
					<c:set value="${standardWarrantyControllerBean.standardWarrantyVO.mileageIndicatorPosition}" var="mileageIndicatorPosition"></c:set>
					<table  style="width:100%;border-style: solid; border-width: 2px; border-color: black;"
							 align="left" id="warrantyTableId" cellpadding="2" cellspacing="0">
						
	       				<tr style="padding: 2px 2px 2px 2px;" bgcolor="#D8D8D8">
							<td width="300px"
								style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black;">
									<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header1']}" style="font-weight: bold;"></h:outputLabel>
							</td>
							<td width="50px" align="center"
								style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black;">
									<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header2']}" style="font-weight: bold;"></h:outputLabel>
							</td>
							<td width="442px"
								style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black;">
									<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header3']}" style="font-weight: bold;"></h:outputLabel>
							</td>
							<td width="50px" align="center"
								style="border-bottom-style: solid;  border-width: 2px; border-color: black;">
									<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header4']}" style="font-weight: bold;"></h:outputLabel>
							</td>
						</tr>
						<c:set var="count" value="0" scope="page"/>
						<c:forEach items="${standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyDetails}" var="warrantyDetail">
						<c:set var="count" value="${count + 1}"/>	       				
	       				<c:if test="${warrantyDetail.subCategoryList == null }">
	       				<tr>
							<td width="300px"
								style="position:relative;border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black; padding-left: 2px">
								<div id = "imagediv${pageScope.count}" style="display:none;position:absolute;z-index:1000;width:2px;color:blue;font-size:16px;vertical-align:top;border-left:2px dashed blue;">&nbsp;</div>
								<table border="0" cellpadding="0" cellspacing="0">
	       							<tr>
	       								<td title="${warrantyDetail.wtyDetailDesc}">
	       									${warrantyDetail.wtyCategoryDesc}
	       								</td>
	       							</tr>	       							
	       						</table>
	       					</td>
	       					<td align="center" width="50px"
									style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black;padding-left: 0px">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
									<tr>
										<c:if test="${empty warrantyDetail.subCategoryList}">
										<c:choose>
											<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > warrantyDetail.wtyTermMonthNum or 
												(warrantyDetail.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum))}">
												
												<td>${warrantyDetail.wtyTermMonths}</td>
												
											</c:when>
											<c:otherwise>
												<td><b>${warrantyDetail.wtyTermMonths}</b></td>
											</c:otherwise>
										</c:choose>
										</c:if>	
									</tr>								
								</table>
							</td>
							 <td width="442px" id='backroundtd${pageScope.count}' style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black; padding-left: 0px; background-repeat: repeat-Y;${pageScope.mileageIndicatorPosition}">
							 	
								<table width="100%" border="0" cellpadding="1" cellspacing="0">
	       							
	       							<tr>
	       								<c:if test="${empty warrantyDetail.subCategoryList}">
										<c:choose>
											<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > warrantyDetail.wtyTermMonthNum or 
												(warrantyDetail.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum))}">
												
												<td height="38%" id='backroundtd${pageScope.count}' width="${warrantyDetail.wtyMilWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
			       									<b>${warrantyDetail.wtyTermMiles}</b>
			       								</td>
												
											</c:when>
											<c:otherwise>
												<td height="38%" id='backroundtd${pageScope.count}' width="${warrantyDetail.wtyMilWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
			       									<b>${warrantyDetail.wtyTermMiles}</b>
			       								</td>
											</c:otherwise>
										</c:choose>
										</c:if>
	       								<td>&nbsp;</td>
	       							</tr>
	       						</table>
	       					</td>
	       					<c:choose>
		       					<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > warrantyDetail.wtyTermMonthNum or 
													(warrantyDetail.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum))}">
		       						<td align="center" width="50px"
											style="border-bottom-style: solid; border-width: 2px; border-color: black;padding-left: 0px;background-color: #B40431;color:white;">
		       							<table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
		       								<tr>
		       									<td style="color: #FFFFFF;font-weight: bold;padding-top: 0px;vertical-align: top;">NO</td>
		       								</tr>
		       							</table>
		       						</td> 
		       					</c:when>
		       					<c:otherwise>
		       						<td align="center" width="50px"
											style="border-bottom-style: solid; border-width: 2px; border-color: black;padding-left: 0px;background-color: #0B610B;color:white;">
		       							<table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
		       								<tr>
		       									<td style="color: #FFFFFF;font-weight: bold;padding-top: 0px;vertical-align: top;">YES</td>
		       								</tr>
		       							</table>
		       						</td> 
		       					
		       					</c:otherwise>
	       					</c:choose>
	       				</tr>
	       				</c:if>
	       				
	       				<c:if test="${warrantyDetail.subCategoryList != null }">
	       						<tr>
	       						<td width="300px"
								style="position:relative;border-right-style: solid; border-width: 2px; border-color: black; padding-left: 2px">
								<div id = "imagediv${pageScope.count}" style="display:none;position:absolute;z-index:1000;width:2px;color:blue;font-size:16px;vertical-align:top;border-left:2px dashed blue;">&nbsp;</div>
								<table border="0" cellpadding="0" cellspacing="0">
	       							<tr>
	       								<td title="${warrantyDetail.wtyDetailDesc}">
	       									${warrantyDetail.wtyCategoryDesc}
	       								</td>
	       							</tr>
	       						</table>
	       						</td>
	       						<td width="50px" align="center" 
									style="border-right-style: solid; border-width: 2px; border-color: black;padding-left: 0px">
									&nbsp;</td>
								<td width="442px" id='backroundtd${pageScope.count}' style="border-right-style: solid; border-width: 2px; border-color: black; padding-left: 0px;background-repeat: repeat-Y;${pageScope.mileageIndicatorPosition}">
									
									&nbsp;</td>
								<td width="50px" align="center" 
									style="border-width: 2px; border-color: black;padding-left: 0px">
									&nbsp;</td>
	       						</tr>
	       					<c:set var="subCatCount" value="0"/>
		       				<c:forEach items="${warrantyDetail.subCategoryList}" var="subCategory">
		       					<c:set var="count" value="${count + 1}"/>
		       					<c:set var="subCatCount" value="${subCatCount + 1}"/>
		       					<tr>
		       					<c:if test="${fn:length(warrantyDetail.subCategoryList) != subCatCount}">
	       							<td width="300px"
									style="position:relative;border-right-style: solid; border-width: 2px; border-color: black; padding-left: 2px">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) == subCatCount}">
	       							<td width="300px"
									style="position:relative;border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black; padding-left: 2px">
								</c:if>
								<div id = "imagediv${pageScope.count}" style="display:none;position:absolute;z-index:1000;width:2px;color:blue;font-size:16px;vertical-align:top;border-left:2px dashed blue;">&nbsp;</div>
								<table border="0" cellpadding="0" cellspacing="0">
	       							<tr>
	       								<td title="${subCategory.wtyDetailDesc}" style="padding-left:10px;">${subCategory.wtySubCategory}
	       							</tr>
	       						</table>
	       						</td>
	       						<c:if test="${fn:length(warrantyDetail.subCategoryList) != subCatCount}">
		       						<td width="50px" align="center" 
										style="border-right-style: solid; border-width: 2px; border-color: black;padding-left: 0px">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) == subCatCount}">
									<td width="50px" align="center" 
										style="border-bottom-style: solid;border-right-style: solid; border-width: 2px; border-color: black;padding-left: 0px">
								</c:if>
									<table width="100%" cellpadding="0" cellspacing="0">
										<c:if test="${not empty warrantyDetail.subCategoryList}">
											<c:choose>
												<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum or 
													(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
													
													<td style="border-top-style: solid; border-bottom-style: solid; border-width: 2px; border-color: white;" align="center">
														${subCategory.wtyTermMonths}
													</td>
													
												</c:when>
												<c:otherwise>
													<td style="border-top-style: solid; border-bottom-style: solid; border-width: 2px; border-color: white;font-weight: bold" align="center">
														${subCategory.wtyTermMonths}
													</td>
												</c:otherwise>
											</c:choose>
											</c:if>
									</table>
								</td>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) != subCatCount}">
									<td width="442px" id='backroundtd${pageScope.count}' style="border-right-style: solid; border-width: 2px; border-color: black; padding-left: 0px;background-repeat: repeat-Y;${pageScope.mileageIndicatorPosition}">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) == subCatCount}">
									<td width="442px" id='backroundtd${pageScope.count}' style="border-bottom-style: solid;border-right-style: solid; border-width: 2px; border-color: black; padding-left: 0px;background-repeat: repeat-Y;${pageScope.mileageIndicatorPosition}">
								</c:if>
									
									<table width="100%" cellpadding="1" cellspacing="0">
										<tr>
											<c:if test="${not empty warrantyDetail.subCategoryList}">
											<c:choose>
												<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum or 
													(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
													
													<td height="40%" bgcolor="#000000" width="${subCategory.wtyMilWidth}" align="right" style="POSITION: relative; z-index:5000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px; border-color: black;">
	      												<b>${subCategory.wtyTermMiles}</b>
	      											</td>
												</c:when>
												<c:otherwise>
													<td height="40%" bgcolor="#000000" width="${subCategory.wtyMilWidth}" align="right" style="POSITION: relative; z-index:5000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px; border-color: black;">
	      												<b>${subCategory.wtyTermMiles}</b>
	      											</td>
												</c:otherwise>
											</c:choose>
											</c:if>
      										<td>&nbsp;</td>
										</tr>
									</table>
								</td>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) != subCatCount &&
									((standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum) or 
															(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
									<td width="50px" align="center" style="padding-left: 0px;background-color: #B40431;border-top-style: solid;border-bottom-style: solid;border-width: 2px; border-color: white;">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) != subCatCount &&
									!((standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum) or 
															(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
									<td width="50px" align="center" style="padding-left: 0px;background-color: #0B610B;border-top-style: solid;border-bottom-style: solid;border-width: 2px; border-color: white;">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) == subCatCount &&
									((standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum) or 
															(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
									<td width="50px" align="center" 
										style="background-color: #B40431;border-top-style: solid;border-top-color: white;border-width: 2px;border-bottom-style: solid;border-bottom-color: black;padding-left: 0px">
								</c:if>
								<c:if test="${fn:length(warrantyDetail.subCategoryList) == subCatCount &&
									!((standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum) or 
															(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum))}">
									<td width="50px" align="center" 
										style="background-color: #0B610B;border-top-style: solid;border-top-color: white; border-width: 2px;border-bottom-style: solid;border-bottom-color: black;padding-left: 0px">
								</c:if>
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>	
											<c:choose>
												<c:when test="${(standardWarrantyControllerBean.standardWarrantyVO.dofu1 > subCategory.wtyTermMonthNum) or 
															(subCategory.wtyTermMiles !='Unlimited' and standardWarrantyControllerBean.standardWarrantyVO.lastKnownMileage > subCategory.wtyTermMilesNum)}">
													
													<td align="center" style="font-weight: bold;color:white;border-top-style: solid; border-bottom-style: solid; border-width: 0px;border-color: #B40431;">NO</td>
												</c:when>
												<c:otherwise>
													<td align="center" style="color:white;font-weight: bold;border-top-style: solid; border-bottom-style: solid; border-width: 0px;border-color: #04B4AE;">YES</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>	
								</td>
	       						</tr>
		       				</c:forEach>
	       					</c:if>
	       					
	       				</c:forEach>
	       				
						<tr style="padding-top: 0px;" >
							<td style="padding:0px;" valign="top"></td>
							<td style="padding:0px"></td>
							<td  bgcolor="#FFFFFF" style="padding-top: 0px; padding-bottom: 2px;padding-left: 0px;" valign="top">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
										<td width="49px" style="padding:0px;BORDER-LEFT: black 1px solid;">&nbsp;</td>
									</tr>
								</table>
							</td>
							<td></td>
						</tr>
						<tr style="padding-top: 0px;" >
							<td style="padding:0px"></td>
							<td style="padding:0px"></td>
							<td  bgcolor="#FFFFFF" style="padding-left: 0px;padding-top: 0px; padding-bottom: 2px;padding-left: 0px" valign="top">
							
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="30px">0</td>
														<td width="40px" align="left" >20,000</td>
														<td width="40px" align="left">40,000</td>
														<td width="40px" align="left">60,000</td>
														<td width="43px" align="center">80,000</td>
														<td width="32px" align="left">100,000</td>
														<td width="32px" align="left">120,000</td>
														<td width="32px" align="left">140,000</td>
														<td width="32px" align="left">160,000</td>
										</tr>
									</table>
									
							</td>
							<td></td>
						</tr>
						
					</table>
				


				</td>
			</tr>
			<tr style="width: 100%">  
    			<td style="text-align: left;font-style:italic;">
	   			 	 <h:outputLink onclick="return false;">
						<h:outputLabel value="#{msg1['portlets.warranty.coverage.document.title']}" style="font-weight: bold;font-color: #2E64FE;"/>
					 </h:outputLink>
    			</td>
    			<td style="text-align: right;font-style:italic; white-space: nowrap;">
	   			 	 <h:outputLink onclick="return false;">
						<h:outputLabel value="#{msg1['portlets.warranty.powertrain.parts.title']}" style="font-weight: bold;font-color: #2E64FE;"/>
					 </h:outputLink>
    			</td>
    		</tr>
			<tr>
       			<td style="text-align: left;" colspan="2">
       				<h:panelGrid columns="2"  columnClasses="wtyNotesFirstCol,wtyNotesSecCol">
       						<h:graphicImage url="/resources/images/schMnt/Bullet.png" height="5px" width="4px"
       													style="vertical-align:top;padding-top:4px;"/>
       						<h:outputText value="#{msg1['portlets.tis.warranty.chart.message1']}" escape="false"></h:outputText>
       						
       						<h:graphicImage url="/resources/images/schMnt/Bullet.png" height="5px" width="4px"
       													style="vertical-align:top;padding-top:4px;"/>
    						<h:outputText value="#{msg1['portlets.tis.warranty.chart.message2']}" escape="false"></h:outputText>
    						<h:graphicImage url="/resources/images/schMnt/Bullet.png" height="5px" width="4px"
    													style="vertical-align:top;padding-top:4px;"/>
    						<h:outputText value="#{msg1['portlets.tis.warranty.chart.message3']}" escape="false"></h:outputText>
       				</h:panelGrid>
       			</td>
       		</tr>
			</c:if>        		
        		<tr>
        			<td>
        				<h:panelGroup rendered="#{standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}">
	       				<h:outputLabel value="#{msg1['wt.noinfo']}" style="font-weight: normal;">&nbsp;</h:outputLabel>
						<h:outputText value="#{standardWarrantyControllerBean.standardWarrantyVinVo}"
																				style="font-weight: bold;" />
	       				</h:panelGroup>
        			</td>
        		</tr>
			
			<tr>
    			<td>
    				<h:outputLink rendered="#{standardWarrantyControllerBean.standardWarrantyVO.standardWarrantyObjectEmpty}" onclick="return false;" style="text-align: left;font-style:italic;">
						<h:outputLabel value="#{msg1['portlets.warranty.coverage.document.title']}" style="font-weight: bold;font-color: #2E64FE;cursor:pointer;"/>
					 </h:outputLink>
    			</td>
    	    </tr>
        	</table>
	       	</c:if>		
			<c:if test="${not empty standardWarrantyControllerBean.standardWarrantyVinVo.vinNumber and empty standardWarrantyControllerBean.standardWarrantyVO.usrStateMap}">
	 			<h:outputLabel
					value="#{msg1['portlets.description.vehicleinformation']}"></h:outputLabel>
				<h:outputText
					value="#{standardWarrantyControllerBean.standardWarrantyVinVo}"
					style="font-weight: bold;" />
	 		</c:if>		
</h:form>
<style>

.retailst1stColumn{
	width: 55%;
	text-align: right;
}
.retailst2ndColumn{
	width: 45%;
	text-align: left;
}

.warranty1stColumn{
	width: 33%;
	text-align: left;
}

.warranty2ndColumn{
	width: 33%;
	text-align: center;
}

.warranty3rdColumn{
	width: 33%;
	text-align: right;
}
.wtyNotesFirstCol{
	padding-left:4px;
	padding-right:4px;
	padding-top:1px;
	padding-bottom:1px;
	text-align:center;
	vertical-align: top !important;
}
.wtyNotesSecCol{
	width:100%;
	text-align:left;
	padding-top:1px;
	padding-bottom:1px;
	padding-left:15px;
}
</style>
<script>
var count = '${pageScope.count}';

document.getElementById('warrtable').style.width = '850px';

if(document.getElementById('lastKnownMileageId') && document.getElementById('lastKnownMileageId').value != "0.0"
		&& document.getElementById('lastKnownMileageId').value != "")
{
	var lastKnownMileage = document.getElementById('lastKnownMileageId').value;
	var ua = navigator.userAgent.toLowerCase();
	var mileage = 0;
	if(lastKnownMileage > 160000){
		mileage = (((94 * 451)/100+ 63 + 272));		
	}
	else 
	{
		if(ua.indexOf('firefox') >= 0 )
		{
			if(tcuvLastKnownMileage >= 20000 && tcuvLastKnownMileage <= 160000)
		    {
		    	mileage = (lastKnownMileage * 49)/20000 + 286 + 57;
		    }
			else{
				mileage = (lastKnownMileage * 49)/20000 + 286 + 57 + 3;
			}
		}
		else if(navigator.appName == 'Microsoft Internet Explorer')
		{
			if(lastKnownMileage <= 5000 ){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 + 4));	
			}
			else if(lastKnownMileage > 5000 && lastKnownMileage < 40000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57));
			}
			else if(lastKnownMileage >= 40000 && lastKnownMileage < 60000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -2));
			}
			else if(lastKnownMileage >= 60000 && lastKnownMileage < 80000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -4));
			}
			else if(lastKnownMileage >= 80000 && lastKnownMileage < 100000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -6));
			}
			else if(lastKnownMileage >= 100000 && lastKnownMileage < 120000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 - 9));
			}
			else if(lastKnownMileage >= 120000 && lastKnownMileage < 140000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -11));
			}
			else if(lastKnownMileage >= 140000 && lastKnownMileage < 160000){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -13));
			}
			else if(lastKnownMileage == 160000 ){
				mileage = (((lastKnownMileage * 49)/20000 + 303 + 57 -15));
			}

		}
		else
		{
			mileage = (((lastKnownMileage * 49)/20000 + 286 + 55 + 1));
			
		}
	}
	
	if(ua.indexOf('firefox') >= 0)
		mileage = mileage + 34;
	setDivLeft(mileage);
}
else if (document.getElementById('warrantyTableId')  && document.getElementById('warrantyTableId') != null)
{
	setDivLeft('');
}

function setDivLeft(leftPos) {	
	for(i = 1; i <= count;i++) {
		if (document.getElementById('imagediv' + i)) {
			if(leftPos != '') {
				document.getElementById('imagediv' + i).style.display = 'inline';
				document.getElementById('imagediv' + i).style.left = leftPos + 'px';
			} else {
				document.getElementById('imagediv' + i).style.display = 'none';
			}
		} 
		if (document.getElementById('backroundtd' + i)) {
			document.getElementById('backroundtd' + i).style.backgroundImage = 'none';
		}
	}
}
</script>