<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        	
        	<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg1"/>
        		
        	<h:form id="tcuvWarrantyForm">
        	
        	<h:panelGroup style="font-size: 11px" id="certifiedWtyMainPanel">
        		<c:if test="${not empty certifiedWarrantyControllerBean.vinVo and 
        						not empty certifiedWarrantyControllerBean.vinVo.vinNumber and 
        							!certifiedWarrantyControllerBean.certifiedWarrantyVO.certifiedDofuEmpty and 
        							!certifiedWarrantyControllerBean.certifiedWarrantyVO.certifiedDealerEmpty}">
        			<table style="table-layout:fixed;" id ="certWtyTable">				
        				<tr>
		        			<td>
		        				<h:panelGrid style="text-align: center;" width="100%" >
				       			<h:outputLabel value="TCUV WARRANTY APPLICABILITY CHART" style="font-weight:bold;text-align: center;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="TCUH WARRANTY APPLICABILITY CHART" style="font-weight:bold;text-align: center;" 
		       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="LCPO WARRANTY APPLICABILITY CHART" style="font-weight:bold;text-align: center;" 
		       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="SCPO WARRANTY APPLICABILITY CHART" style="font-weight:bold;text-align: center;"
		       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
				       			<h:outputText>&nbsp;</h:outputText>
				       			<h:panelGrid columns="1" width="100%" columnClasses="mdlyear1stColumn">
				       				<h:panelGroup>
				       					<h:outputLabel style="font-weight:bold;" value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.modelYear}" />&nbsp;
				       					<h:outputLabel style="font-weight:bold;" value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.modelName}" />&nbsp;
				       					<h:outputLabel style="font-weight:bold;" value="#{msg1['portlets.label.vin']}">:&nbsp;</h:outputLabel><h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.vin}" />
				       				</h:panelGroup>
				       				
				       			</h:panelGrid>
				       			<h:panelGrid columns="3" width="100%" columnClasses="certWty1stColumn,certWty2ndColumn,certWty3rdColumn">
				       				<h:panelGroup style="text-align: left;">
				       					<h:outputLabel value="TCUV Miles:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="TCUH Miles:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="LCPO Miles:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="SCPO Miles:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
				       					<h:outputText value="Info not available" 
			       								rendered="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileage == 'Info not available'}"/>
			       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage - certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileageNum}" 
			       								rendered="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileage != 'Info not available' &&
			       								(certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage - certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileageNum > 0)}"/>
			       					<h:outputText value="0" 
			       								rendered="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileage != 'Info not available' &&
			       								(certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage - certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileageNum <= 0)}"/>
				       				</h:panelGroup>
				       				<h:panelGroup style="text-align: left;" >
				       					<h:outputLabel value="TCUV Retailed Mileage:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="TCUH Retailed Mileage:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="LCPO Retailed Mileage:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="SCPO Retailed Mileage:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
				       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedMileage}" />
				       				</h:panelGroup>
				       				
				       				<h:panelGroup style="text-align: right;">
				       					<h:outputLabel value="TCUV Retailed State:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="TCUH Retailed State:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="LCPO Retailed State:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="SCPO Retailed State:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
				       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.retailedState}" />
				       				</h:panelGroup>
				       				
				       				<h:panelGroup style="text-align: left;">
				       					<h:outputLabel value="TCUV Months in Service:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="TCUH Months in Service:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="LCPO Months in Service:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
				       					<h:outputLabel value="SCPO Months in Service:" style="font-weight:bold;" 
				       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
				       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.monthsInService}" />
				       				</h:panelGroup>
				       				<h:panelGroup style="text-align: left;">
				       					<h:outputLabel value="Last Known Mileage:" style="font-weight:bold">&nbsp;</h:outputLabel>
				       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.mileage}" rendered="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.mileage != '0'}"/>
			       						<h:outputText value="0" rendered="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.mileage == '0'}"/>
				       				</h:panelGroup>
				       				<h:panelGroup style="text-align: left;">
				       					<h:outputLabel value="Owner:" style="font-weight:bold;">&nbsp;</h:outputLabel>
				       					<h:outputText value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.ownerName}" />
				       				</h:panelGroup>
				       			</h:panelGrid>
				       			
			       			</h:panelGrid>
		        			</td>
	        		</tr>			
        			<tr>
	        			<td>
		        			<input type="hidden" value="${certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage}" id="tcuvLastKnownMileageId"/>
							<c:set value="${certifiedWarrantyControllerBean.certifiedWarrantyVO.mileageIndicatorPosition}" var="mileageIndicatorPosition"></c:set>
		        			<table  style="border-style: solid; border-width: 2px; border-color: black;"
									width="100%" align="left" id="certifiedWtyTableId" cellpadding="2" cellspacing="0">
			       				<tr style="padding: 2px 2px 2px 2px;" bgcolor="#D8D8D8">
									<td width="247px"
										style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black">
											<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header1']}" style="font-weight: bold;"></h:outputLabel>
									</td>
									<td width="84px" align="center"
										style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black">
											<h:outputLabel value="Valid Until" style="font-weight: bold;"></h:outputLabel>
									</td>
									<td width="442px"
										style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black">
											<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header3']}" style="font-weight: bold;"></h:outputLabel>
									</td>
									<td width="58px" align="center"
										style="border-bottom-style: solid;  border-width: 2px; border-color: black">
											<h:outputLabel value="#{msg1['portlets.tis.warranty.chart.header4']}" style="font-weight: bold;"></h:outputLabel>
									</td>
								</tr>
								
								<c:set var="count" value="0" scope="page"/>
								<c:forEach items="${certifiedWarrantyControllerBean.certifiedWarrantyVO.certifiedWarrantyDetails}" var="warrantyDetail">
								<c:set var="count" value="${count + 1}"/>	 
								<tr>
									<td width="247px"
										style="position:relative;border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black; padding-left: 2px">
										<div id = "mileageinddiv${pageScope.count}" style="display:none;position:absolute;z-index:500;width:2px;color:blue;font-size:16px;vertical-align:top;border-left:2px dashed blue;">&nbsp;</div>
										<table border="0" cellpadding="0" cellspacing="0">
			       							<tr>
			       								<td title="${warrantyDetail.wtyCategoryDesc}">
			       									${warrantyDetail.wtyCategoryDesc}
			       								</td>
			       							</tr>
			       						</table>
			       					</td>
			       					<td align="center" width="84px"
										style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black;padding-left: 0px">
										<table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
											<tr>
												<c:choose>
													<c:when test="${!warrantyDetail.wtyCoveredByDate  or 
																certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum}">
														<td>${warrantyDetail.wtyValidityDate}</td>
													</c:when>
													<c:otherwise>
														<td><b>${warrantyDetail.wtyValidityDate}</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</table>
									</td>
									<td id='certWtyBkgrndtd${pageScope.count}' width="442px" style="border-bottom-style: solid; border-right-style: solid; border-width: 2px; border-color: black; padding-left: 0px; background-repeat: repeat-Y;${pageScope.mileageIndicatorPosition}">										
									<table width="100%" border="0" cellpadding="1" cellspacing="0">
			       							<tr>
			       								<c:choose>
													<c:when test="${!warrantyDetail.wtyCoveredByDate  or 
																certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum}">
														<c:if test="${warrantyDetail.wtyTermMilesNum >= 20000}">
															<td id='certWtyBkgrndtd${pageScope.count}' height="40%" width="${warrantyDetail.wtyMileageWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
				       											<b>${warrantyDetail.wtyTermMiles}</b>
				       										</td>
			       										</c:if>
			       										<c:if test="${warrantyDetail.wtyTermMilesNum < 20000}">
			       											<td id='certWtyBkgrndtd${pageScope.count}' height="40%" width="${warrantyDetail.wtyMileageWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
				       											&nbsp;
				       										</td>
				       										<td align="left">
				       											<b>${warrantyDetail.wtyTermMiles}</b>
				       										</td>
			       										</c:if>
													</c:when>
													<c:otherwise>
														<c:if test="${warrantyDetail.wtyTermMilesNum >= 20000}">
															<td id='certWtyBkgrndtd${pageScope.count}' height="40%" width="${warrantyDetail.wtyMileageWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
						       									<b>${warrantyDetail.wtyTermMiles}</b>
						       								</td>
						       							</c:if>
						       							<c:if test="${warrantyDetail.wtyTermMilesNum < 20000}">
						    	   							<td id='certWtyBkgrndtd${pageScope.count}' height="40%" width="${warrantyDetail.wtyMileageWidth}" align="right" style="position:relative;z-index:5000;background-color: #000000;color:white;border-right-style: solid;border-top-style: solid; border-bottom-style: solid; border-width: 1px;border-color: black;">
						       									&nbsp;
						       								</td>
						       								<td align="left">
						       									<b>${warrantyDetail.wtyTermMiles}</b>
						       								</td>
						       							
						       							</c:if>
													</c:otherwise>
												</c:choose>
			       								<td>&nbsp;</td>
			       							</tr>
			       							
			       						</table>
		       						</td>
		       						<c:choose>
										<c:when test="${!warrantyDetail.wtyCoveredByDate  or 
													certifiedWarrantyControllerBean.certifiedWarrantyVO.lastKnownMileage > warrantyDetail.wtyTermMilesNum}">
											<td align="center" width="58"
												style="border-bottom-style: solid; border-width: 2px; border-color: black;padding-left: 0px;background-color: #B40431;color:white;">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
													<tr>	
														<td style="color: #FFFFFF;font-weight: bold;padding-top: 0px;vertical-align: top;">NO</td>
													</tr>
												</table>
											</td>
										</c:when>	
										<c:otherwise>
											<td align="center" width="58"
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
								
								</c:forEach>
								<tr style="padding-top: 0px;" >
									<td style="padding:0px"></td>
									<td style="padding:0px"></td>
									<td  bgcolor="#FFFFFF" style="padding-top: 0px; padding-bottom: 2px;padding-left: 0px" valign="top">
										<table width="100%" border=0 height="20%" cellpadding="0" cellspacing="0">
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
									<td  bgcolor="#FFFFFF" style="padding-left: 0px;padding-top: 0px; padding-bottom: 2px" valign="top">
										<table width="100%" border=0 height="20%" cellpadding="0" cellspacing="0">
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
									<td> &nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="width: 100%">        			
	        			<td style="text-align: left;">
	        				<h:dataTable value="#{certifiedWarrantyControllerBean.certifiedWarrantyVO.warrantyNotes}" var="warrantyNote"
	        					columnClasses="notesFirstCol,notesSecCol">
	        					<h:column>
	        						<h:graphicImage url="/resources/images/schMnt/Bullet.png" height="5px" width="4px"
	        							rendered="#{warrantyNote != msg1['certifiedwty.notes.tcuhvehicle4']}" style="vertical-align:top;padding-top:4px;"/>
									<h:outputLabel value="#" rendered="#{warrantyNote == msg1['certifiedwty.notes.tcuhvehicle4']}" style="height: 5px;width: 4px;"></h:outputLabel>        						
	        					</h:column>
	        					<h:column>
	        						<h:outputText value="#{warrantyNote}" escape="false"></h:outputText>
	        					</h:column>
	        				</h:dataTable>
	        			</td>
	        		</tr>				
        			</table>			
        		</c:if>
        		<c:if test="${not empty certifiedWarrantyControllerBean.vinVo.vinNumber and certifiedWarrantyControllerBean.certifiedWarrantyVO.certifiedDofuEmpty}">
		 			<h:outputLabel
						value="#{msg1['certifiedwty.errmsg.certifieddofuempty']}"></h:outputLabel>
		 		</c:if>
		 		<c:if test="${not empty certifiedWarrantyControllerBean.vinVo.vinNumber and certifiedWarrantyControllerBean.certifiedWarrantyVO.certifiedDealerEmpty}">
		 			<h:outputLabel
						value="#{msg1['certifiedwty.errmsg.dealercodeempty']}"></h:outputLabel>
		 		</c:if>
        	</h:panelGroup>
</h:form>

<style>

th.header1 { 
	text-align:left;
	border-bottom-style: solid; 
	border-right-style: solid; 
	border-width: 2px; 
	border-color: black;
	background-color: #D8D8D8;
	
}
.mdlyear1stColumn{
	width: 55%;
	text-align: center;
}
.retailst2ndColumn{
	width: 45%;
	text-align: left;
}

.certWty1stColumn{
	width: 36%;
	text-align: left;
	vertical-align: top;
}

.certWty2ndColumn{
	width: 34%;
	text-align: left;
	vertical-align: top;
}

.certWty3rdColumn{
	width: 30%;
	text-align: left;
	vertical-align: top;
	
}

.miniSelect{
	background-color: white;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	border-bottom-style: groove;
}
.notesFirstCol{
	padding-left:4px;
	padding-right:4px;
	padding-top:1px;
	padding-bottom:1px;
	text-align:center;
	vertical-align: top !important;
}
.notesSecCol{
	width:100%;
	text-align:left;
	padding-top:1px;
	padding-bottom:1px;
	padding-left:15px;
}

</style>
<script>
var certWtyCount = '${pageScope.count}';
document.getElementById('certWtyTable').style.width = '850px';
var certWtyContainer = '${facesContext.viewRoot.id}:tcuvWarrantyForm';

var tcuvLastKnownMileageObj = document.getElementById('tcuvLastKnownMileageId');
if(tcuvLastKnownMileageObj !=null && tcuvLastKnownMileageObj.value != "0"
		&& tcuvLastKnownMileageObj.value != "")
{
	var certmileage;
	var ua = navigator.userAgent.toLowerCase();
	var tcuvLastKnownMileage = tcuvLastKnownMileageObj.value;
	if(tcuvLastKnownMileage > 160000){
		certmileage = ((94 * 442)/100+ 248 + 92 - 3);
		if(ua.indexOf('firefox') >= 0){
			certmileage = certmileage + 30;
		}
	}
	else
	{
	  if(ua.indexOf('firefox') >= 0)
	  {
		  if(tcuvLastKnownMileage >= 0 && tcuvLastKnownMileage <= 160000)
		  {
			certmileage = (tcuvLastKnownMileage * 49)/20000 + 248 + 91;
		  }
	  }
	  else if(navigator.appName == 'Microsoft Internet Explorer')
	  {
		 if(tcuvLastKnownMileage < 5000 ){
			 certmileage = ((tcuvLastKnownMileage * 49)/20000 + 248 + 92 + 2);
		 }
		 else if(tcuvLastKnownMileage >= 20000 && tcuvLastKnownMileage < 40000){
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 + 1 ));
		}
		else if(tcuvLastKnownMileage >= 80000 && tcuvLastKnownMileage <= 100000){
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 - 1));
		}
		else if(tcuvLastKnownMileage >= 120000 && tcuvLastKnownMileage < 140000){
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 - 2));
		}
		else if(tcuvLastKnownMileage >= 140000 && tcuvLastKnownMileage < 160000){
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 - 3));
		}
		else if(tcuvLastKnownMileage == 160000){
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 - 4));
		}
		else
		{		
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 248 + 92 ));
		}
	  }	
	  else
	  {	
			certmileage = (((tcuvLastKnownMileage * 49)/20000 + 90 + 240 + 3));
	  }
		
		if(ua.indexOf('firefox') >= 0)
			certmileage = certmileage + 30;
	}
	setDivLeftCertWty(certmileage);
}
else if (document.getElementById('certifiedWtyTableId')  && document.getElementById('certifiedWtyTableId') != null)
{
	//document.getElementById('certifiedWtyTableId').style.backgroundImage = "none";
	setDivLeftCertWty('');
}

function setDivLeftCertWty(leftPos) {	
	for(i = 1; i <= certWtyCount;i++) {
		if (document.getElementById('mileageinddiv' + i)) {
			if(leftPos != '') {
				document.getElementById('mileageinddiv' + i).style.display = 'inline';
				document.getElementById('mileageinddiv' + i).style.left = leftPos + 'px';
			} else {
				document.getElementById('mileageinddiv' + i).style.display = 'none';
			}
		} 
		if (document.getElementById('certWtyBkgrndtd' + i)) {
			document.getElementById('certWtyBkgrndtd' + i).style.backgroundImage = 'none';
		}
	}
}

</script>