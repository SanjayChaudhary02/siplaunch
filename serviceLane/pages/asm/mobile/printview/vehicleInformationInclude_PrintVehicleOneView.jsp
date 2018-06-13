<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />

<style>

.colWidth{
	width: 25%;
vertical-align: top;
}
.colWidth2{
	width: 25%;
vertical-align: top;
padding-bottom:4px;
padding-top:0px;
}

.colWidth1{
	width: 50%;
vertical-align: top;
padding-bottom:4px;
padding-top:0px;
}
.tip {
position: absolute;
 border:2px solid black; 
 width:270px; padding:2px;
 position:absolute; z-index:100;
 visibility:hidden; color:#333333; top:20px;
 left:90px; background-color:yellow;
 layer-background-color:#ffffcc;
 filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135)
 
 }

</style>


<h:form id="vehInformationForm" style="padding-bottom: 0px;">

<div id="accessoryToolTip" class="tip"></div>
	<!--  VIN exists and VehicleInformationVO exists  -->
	<c:set var="infoNotAvailable" value="Info not available"></c:set>
	<jsp:useBean id="infoNotAvailable" type="java.lang.String"></jsp:useBean>
	<h:panelGroup rendered="#{vehicleInformationControllerBean.vehicleInformationVinVo !=null and vehicleInformationControllerBean.vehicleInformationVO != null}">
		<h:panelGrid columns="1" width="100%" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tciIndicator !=null and vehicleInformationControllerBean.vehicleInformationVO.tciIndicator == 'Y'}">
			<h:panelGroup>
				<h:outputLabel value="#{msg['portlets.label.vin.tci']}" style="font-weight: bold;text-decoration: underline;"></h:outputLabel>
			</h:panelGroup>
		</h:panelGrid>	
		
		<h:panelGrid columns="4" columnClasses="colWidth,colWidth,colWidth,colWidth" width="100%" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="TCUV Certified" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && !vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="TCUH Certified" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && vehicleInformationControllerBean.hybridIndicator }">:&nbsp;</h:outputLabel>
				<h:outputLabel value="SCPO Certified" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'SCION' }">:&nbsp;</h:outputLabel>
				<h:outputLabel value="LCPO Certified" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'LEXUS' }">:&nbsp;</h:outputLabel>
				<h:outputText
					value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified}">
				</h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="TCUV DOFU" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && !vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="TCUH DOFU" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="SCPO DOFU" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'SCION' }">:&nbsp;</h:outputLabel>
				<h:outputLabel value="LCPO DOFU" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'LEXUS' }">:&nbsp;</h:outputLabel>
				<h:outputText
					value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvDofu}">
				</h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				
				<h:outputLabel value="TCUV Retailed Mileage" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && !vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="TCUH Retailed Mileage" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="SCPO Retailed Mileage" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'SCION' }">:&nbsp;</h:outputLabel>
				<h:outputLabel value="LCPO Retailed Mileage" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'LEXUS' }">:&nbsp;</h:outputLabel>
				<h:outputText
					value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedMileage}">
				</h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">				
				<h:outputLabel value="TCUV Dealer" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && !vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="TCUH Dealer" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'TOYOTA' && vehicleInformationControllerBean.hybridIndicator}">:&nbsp;</h:outputLabel>
				<h:outputLabel value="SCPO Dealer" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'SCION' }">:&nbsp;</h:outputLabel>
				<h:outputLabel value="LCPO Dealer" style="font-weight: bold;" rendered="#{vinSearchResultVO.division == 'LEXUS' }">:&nbsp;</h:outputLabel>
				<h:outputLabel style="color : blue;" value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvDealerName} (#{vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer})"
					rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvDealerName != null && vehicleInformationControllerBean.vehicleInformationVO.tcuvDealerName != \"Info not available\"}"></h:outputLabel>
				<h:panelGroup rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvDealerName == \"Info not available\" }">
					<h:outputLabel value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvDealerName}" >&nbsp;</h:outputLabel>
					<h:outputLabel value="(" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer != null && not empty vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer }"></h:outputLabel>
					<h:outputLabel value="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer}" ></h:outputLabel>
					<h:outputLabel value=")" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer != null && not empty vehicleInformationControllerBean.vehicleInformationVO.tcuvRetailedDealer }"></h:outputLabel>
				</h:panelGroup>
			</h:panelGroup>
		</h:panelGrid>
		<h:outputLabel value="" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">&nbsp;</h:outputLabel>
		<h:panelGrid columns="4" columnClasses="colWidth,colWidth,colWidth,colWidth" width="100%">
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Prod Date" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.prodDate}">
				</h:outputText>
			</h:panelGroup>
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.dofu']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.dofu}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.engineOilType']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.engineOilType}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.transmission']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText
					value="#{vehicleInformationControllerBean.vehicleInformationVO.transmission}"></h:outputText>
				<c:if
					test="${vehicleInformationControllerBean.vehicleInformationVO.transmission != infoNotAvailable}">
					<c:if
						test="${not empty vehicleInformationControllerBean.vehicleInformationVO.transmission}">
						<h:outputText escape="false"
							value="/#{vehicleInformationControllerBean.vehicleInformationVO.driveType}"></h:outputText>
					</c:if>
					<c:if
						test="${empty vehicleInformationControllerBean.vehicleInformationVO.transmission}">
						<h:outputText escape="false"
							value="#{vehicleInformationControllerBean.vehicleInformationVO.driveType}"></h:outputText>
					</c:if>
				</c:if>
			</h:panelGroup>
		</h:panelGrid>
		<h:outputLabel value="">&nbsp;</h:outputLabel>
		<h:panelGrid columns="4" columnClasses="colWidth,colWidth,colWidth,colWidth" width="100%">
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.plantcode']}"
					style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.plantCode}"></h:outputText>
				<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.plantCode != infoNotAvailable}">
					<c:if test="${not empty vehicleInformationControllerBean.vehicleInformationVO.plantCode}">
						<h:outputText escape="false" value="&nbsp;-&nbsp;#{vehicleInformationControllerBean.vehicleInformationVO.plantName}"></h:outputText>
					</c:if>
					<c:if test="${empty vehicleInformationControllerBean.vehicleInformationVO.plantCode}">
						<h:outputText escape="false" value="#{vehicleInformationControllerBean.vehicleInformationVO.plantName}"></h:outputText>
					</c:if>
				</c:if>
			</h:panelGroup style="text-align: center;">
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Original Selling Dealer"
					style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputLabel style="color : blue;" value="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerName} (#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode})"
					onclick="javascript:openDealerCode('#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode}');return false;" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerName != null && vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerName != \"Info not available\"}"></h:outputLabel>
				<h:panelGroup rendered="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerName == \"Info not available\" }">
					<h:outputLabel value="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerName }" >&nbsp;</h:outputLabel>
					<h:outputLabel value="(" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode != null && not empty vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode }"></h:outputLabel>
					<h:outputLabel value="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode }" ></h:outputLabel>
					<h:outputLabel value=")" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode != null && not empty vehicleInformationControllerBean.vehicleInformationVO.originalSellingDealerCode }"></h:outputLabel>
				</h:panelGroup>
			</h:panelGroup>  
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Engine Oil" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.engineOil}" 
									rendered="#{vehicleInformationControllerBean.vehicleInformationVO.engineOil !=null}"></h:outputText>
				<h:outputLabel rendered="#{vehicleInformationControllerBean.vehicleInformationVO.engineOil ==null}" 
					value="#{msg['portlets.label.fluidspecification']}" style="font-weight: bold;color: #4292CD;text-decoration:underline;"></h:outputLabel>
			</h:panelGroup>
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Trans Oil" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.transOil != null}">
					<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.transOil}"></h:outputText>
				</c:if>
				<h:outputLabel rendered="#{vehicleInformationControllerBean.vehicleInformationVO.transOil ==null}" 
					value="#{msg['portlets.label.fluidspecification']}" style="font-weight: bold;color: #4292CD;text-decoration:underline;"></h:outputLabel>
			</h:panelGroup>
			
		</h:panelGrid>
		<h:outputLabel value="">&nbsp;</h:outputLabel>
		<h:panelGrid columns="4" columnClasses="colWidth2,colWidth2,colWidth2,colWidth2" width="100%"  >
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.grade']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<c:if test="${not empty vehicleInformationControllerBean.vehicleInformationVO.grade}">
					<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.grade} "/>
				</c:if>
				<c:if test="${not empty vehicleInformationControllerBean.vehicleInformationVO.modelNumber}">
					<h:outputText value="(#{vehicleInformationControllerBean.vehicleInformationVO.modelNumber})" rendered="#{not empty vehicleInformationControllerBean.vehicleInformationVO.grade}"/>
					<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.modelNumber}" rendered="#{empty vehicleInformationControllerBean.vehicleInformationVO.grade}"/>
				</c:if>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
			<h:outputLabel value="#{msg['portlets.label.color']}"
					style="font-weight: bold;">:&nbsp;</h:outputLabel>
				
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorCode}"></h:outputText>
					<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorCode != infoNotAvailable and 
					    not empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorDescription}">
						<c:if test="${not empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorCode}">
							<h:outputText escape="false" value="-#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorDescription}"></h:outputText>
						</c:if>
						<c:if test="${empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorCode}">
							<h:outputText escape="false" value="#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.exteriorColorDescription}"></h:outputText>
						</c:if>
					</c:if>
					
				<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorCode != infoNotAvailable}">
					<h:outputText value="/" escape="false"></h:outputText>
					<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorCode}"></h:outputText>
					<c:if test="${not empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorCode and
					  not empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorDescription}">
						<h:outputText escape="false" value="-#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorDescription}"></h:outputText>
					</c:if>
					<c:if test="${empty vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorCode}">
						<h:outputText escape="false" value="#{vehicleInformationControllerBean.vehicleInformationVO.vehicleColors.interiorColorDescription}"></h:outputText>
					</c:if>
				</c:if>
			</h:panelGroup>
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Engine Family" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.engineFamilyLong}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="#{msg['portlets.label.vinDestination']}"
								style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<c:choose>
					<c:when
						test="${(not empty vehicleInformationControllerBean.vehicleInformationVO.fsCountryName) or (not empty vehicleInformationControllerBean.vehicleInformationVO.fsCntryFlgImgUrl)}">
						<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.fsCountryName}"></h:outputText>&nbsp;<h:graphicImage id="fsCntryFlgImg"  height="25px" width="50px"
							url="#{vehicleInformationControllerBean.vehicleInformationVO.fsCntryFlgImgUrl}"	></h:graphicImage>
					</c:when>
					<c:otherwise>
						<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.fsDistributorName}"></h:outputText>
					</c:otherwise>
				</c:choose>
			</h:panelGroup>
			
		</h:panelGrid>
		<h:outputLabel value="">&nbsp;</h:outputLabel>
		<!--  Display Telematic Subscriptions  -->
			<c:set var="telematicSystemStatusMap" scope="page"
								value="${vehicleInformationControllerBean.vehicleInformationVO.telematicSystemStatusMap}" />
								
			<table style="width: 100%;">
				<tr>
					<td width="25%">
						<h:outputLabel value="Remote Capable"
								style="font-weight: bold;">:&nbsp;</h:outputLabel>
						<h:outputText
								value="#{vehicleInformationControllerBean.telematicSubscriptionIndicatorVO.remoteCapableIndicator}"></h:outputText>
						</td>
					<td width="25%" style="padding-bottom: 6px;">
						<h:outputLabel value="Remote Opted In"
								style="font-weight: bold;">:&nbsp;</h:outputLabel>
						<h:outputText
								value="#{vehicleInformationControllerBean.telematicSubscriptionIndicatorVO.remoteOptedIn}"></h:outputText>
					</td>
					<td width="25%" style="padding-bottom: 6px;">
						<h:outputLabel value="Engine #"
								style="font-weight: bold;">:&nbsp;</h:outputLabel>
						<h:outputText
								value="#{vehicleInformationControllerBean.vehicleInformationVO.engineNumber}"></h:outputText>
					</td>
					<td width="25%" style="padding-bottom: 6px;">
						<h:outputLabel value="Monroney"
						style="font-weight: bold;">:&nbsp;</h:outputLabel>
						<h:graphicImage url="/resources/images/pdf_icon.gif" id="monroneyPdfImage" style="cursor:pointer;"
						onclick="javascript:getMonroneyPdf(); return false;" rendered="#{vehicleInformationControllerBean.displayMonroneyLabel}">
						
						</h:graphicImage>
						
						<h:outputText rendered="#{!vehicleInformationControllerBean.displayMonroneyLabel }" value="Info not available"></h:outputText>
					
						
					</td>
				</tr>
			</table>
			&nbsp;
			<table style="width: 100%;" >
				<tr>
					<td width="25%" style="padding-bottom: 6px;">&nbsp;</td>
					<td width="25%" style="padding-bottom: 6px;">
					<h:outputLabel value="Next Service Apt:"
					style="font-weight: bold;"></h:outputLabel>
					<c:choose>
					<c:when test="${(vehicleInformationControllerBean.nextAppointmentDate!=null) or (not empty vehicleInformationControllerBean.nextAppointmentDate)}">
					<h:commandLink  id="nextDate" value="#{vehicleInformationControllerBean.nextAppointmentDate}" ></h:commandLink>
					</c:when>
					<c:when test="${vehicleInformationControllerBean.vehicleInformationVO.dofu==null or ( empty vehicleInformationControllerBean.vehicleInformationVO.dofu)}">
					<h:outputText   value="No DOFU available"/>
					</c:when>
					
					<c:when test="${vehicleInformationControllerBean.lastServiceDate==null and vehicleInformationControllerBean.currentMileage==null and vehicleInformationControllerBean.mileage !=null }">
					<h:commandLink  id="nextDate" value="No Service History available" ></h:commandLink>
				    </c:when>
				   
				   <c:when test="${vehicleInformationControllerBean.mileage ==null }">
				   <h:outputText  value="No Schedule Maintenance available"/>
				   </c:when>
				   
				   </c:choose>
					</td>
					<td width="25%" style="padding-bottom: 6px;">&nbsp;</td>
					<td width="25%" style="padding-bottom: 6px;">
						<c:forEach items="${paramValues.stEquip}" var="stEquipValue">
					
						 	<c:if test="${stEquipValue == 'Yes'}">
								<a id="STDEQPMIN">
									<h:outputText value="#{msg['portlets.label.standardequipment']}" style="color: #4292CD;font-weight: bold;text-decoration: underline;"></h:outputText>
								</a>
				  				<a id="STDEQPMINICON">
				  				<font size='2' style="font-weight: bold;color: #4292CD;"><b>-</b></font>
				  				</a>
							</c:if>
							<c:if test="${stEquipValue == 'No'}">
								<a id="STDEQPMAX">
									<h:outputText value="#{msg['portlets.label.standardequipment']}" style="color: #4292CD;font-weight: bold;text-decoration: underline;"></h:outputText>
								</a>
				  				<a id="STDEQPMAXICON">
				  				<font size='2' style="font-weight: bold;color: #4292CD;"><b>+</b></font>
				  				</a>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				
			</table>
		
		<!--  Display Standard Equipments -->
		<c:set var="equipmentsVO" scope="page" value="${vehicleInformationControllerBean.vehicleInformationVO.standardEquipments}"/>
		<c:set var="equipmentCtgryList" scope="page" value="${vehicleInformationControllerBean.vehicleInformationVO.standardEquipments.standardEquipmentList}"/>
		<h:dataTable width="100%" value="#{paramValues.stEquip}" var="stEquipSelectedValue">
			<h:column>
			<h:panelGroup layout="block" rendered="#{stEquipSelectedValue == 'Yes'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<c:choose>
				<c:when test="${(not empty pageScope.equipmentCtgryList) or (equipmentsVO.equipmentListEmpty == 'No')}">
					<table id="standardEquipment" style="border-bottom: 2px solid #E1E1E1;padding-bottom: 6px;" width="100%" >
						<tr>
							<c:forEach items="${pageScope.equipmentCtgryList}" var="equipmentCatgryVO">
								<td valign="top">
									<table>
										<tr><td><b>${equipmentCatgryVO.headerText}</b></td></tr>
										<c:forEach items="${equipmentCatgryVO.equipmentDescList}" var="equipmentDesc">
											<tr><td>${equipmentDesc}</td></tr>
										</c:forEach>
									</table>
								</td>
							</c:forEach>
						</tr>
					</table>
				</c:when>
				<c:when test="${equipmentsVO.equipmentListEmpty == 'Yes' }">
					<div id="standardEquipment" style="width:100%;margin-top:3px; margin-bottom:3px;">
					<table  border="0" cellpadding="3" cellspacing="0" width="100%" style="padding-bottom: 3px;margin-bottom:3px">
						<tr>
				      		<td width="100%" style="border-bottom: 2px solid #E1E1E1;">
				      			<div style="width:100%"><h:outputLabel value="#{msg['portlets.label.standardequipment.notfound']}"></h:outputLabel><div>
				      		</td>
						<td width="100%" style="border-bottom: 2px solid #E1E1E1;">
				      			<div><h:outputLabel value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h:outputLabel><div>
				      		</td>
						
				      		
				  		</tr>
				 	</table>
	</div>			
				</c:when>
				<c:otherwise>
					<div id="standardEquipment" style="width:100%;margin-top:3px; margin-bottom:3px;">
					<table  border="0" cellpadding="3" cellspacing="0" width="100%" style="padding-bottom: 3px;margin-bottom:3px">
						<tr>
				      		<td width="100%" style="border-bottom: 2px solid #E1E1E1;">
				      			<div style="width:100%">Standard Equipment service is currently inaccessible.  Please try again.<div>
				      		</td>
							<td width="100%" style="border-bottom: 2px solid #E1E1E1;">
				      			<div><h:outputLabel value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h:outputLabel><div>
				      		</td>
						
				      		
				  		</tr>
				 	</table>
					</div>
				</c:otherwise>
			</c:choose>
			
		</h:panelGroup>
				</h:column>
				</h:dataTable>
				
				
		<table style="width: 100%;border-bottom: 2px solid #E1E1E1;" >
			<c:if test="${vinSearchResultVO.division == 'LEXUS' || vinSearchResultVO.division == 'TOYOTA'}">
				<tr>
					<td width="100%" style="padding-bottom: 6px;" colspan="4">
						<fieldset style="border:1px #F55C3B;border-style:solid;">
							<legend style="color:#F55C3B;">Service Connect</legend>
							<table style="width: 100%;border:none;" >
								<tr>
									<td style="width:25%;">
									
										<h:outputLabel value="Diagnostics Capable"
										style="font-weight: bold;">:&nbsp;</h:outputLabel>
										<h:outputText
										value="#{vehicleInformationControllerBean.telematicSubscriptionIndicatorVO.diagnosticCapableIndicator }"></h:outputText>
										
									</td>
									<td style="width:25%;">
										<h:outputLabel value="Diagnostics Opted In"
										style="font-weight: bold;">:&nbsp;</h:outputLabel>
										<h:outputText
										value="#{vehicleInformationControllerBean.telematicSubscriptionIndicatorVO.diagnosticOptedIn }"></h:outputText>
									</td>
									<td style="width:25%:">
										<h:outputLabel value="Transmitting"
										style="font-weight: bold;padding-left:2px;">:&nbsp;</h:outputLabel>
										<h:outputText
										value="#{vehicleInformationControllerBean.telematicSubscriptionIndicatorVO.diagnosticActive}"></h:outputText>
									</td>
									<td style="width:25%;">
										<h:outputLabel value="Preferred Dealer"
										style="font-weight: bold;padding-left:9px;">:&nbsp;</h:outputLabel>
										<h:outputText
										value="#{vehicleInformationControllerBean.vehicleInformationVO.preferredDealer }" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.preferredDealer!=null && vehicleInformationControllerBean.vehicleInformationVO.preferredDealer!=''}"></h:outputText>
										<h:outputText
										value="Info not available" rendered="#{vehicleInformationControllerBean.vehicleInformationVO.preferredDealer==null || vehicleInformationControllerBean.vehicleInformationVO.preferredDealer==''}"></h:outputText>
									</td>
									
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
				
			</c:if>
		
		</table>		
				
		<!--  Display Accessories  -->
		<c:set var="accessoryList" scope="page" value="${vehicleInformationControllerBean.vehicleInformationVO.accessories}"/> 
		
		<c:choose>
			<c:when test="${not empty accessoryList}">
			
			<table border="0" cellpadding="3" cellspacing="0" width="100%" style="border-bottom: 2px solid #E1E1E1;padding-bottom: 6px;">
				
				<tr>
		      		<td colspan="4">
		      		
		      		<c:forEach items="${pageScope.accessoryList}" var="accessory">
		      			<a onclick="return false" style="color:black; text-decoration:none; font-weight: bold;">${accessory.code}:</a>&nbsp;<a onclick="return false" style="color:black; text-decoration:none;">${accessory.description}</a>&nbsp;&nbsp;&nbsp;&nbsp;
		      		</c:forEach>
		      		</td>
		      		
		  		</tr>
			 </table>
			</c:when>
			<c:when test="${empty accessoryList}">
				<h:panelGrid style="border-bottom: 2px solid #E1E1E1;padding-bottom: 6px;" width="100%">
					<h:outputLabel value="#{msg['portlets.tas.accessories.nodatafound']}"></h:outputLabel>
				</h:panelGrid>
			</c:when>
		</c:choose>
		
	</h:panelGroup>
	
	<!--  VIN exists, but VehicleInformationVO is null  -->
	<h:panelGroup rendered="#{not empty vehicleInformationControllerBean.vehicleInformationVinVo.vinNumber  and vehicleInformationControllerBean.vehicleInformationVO == null}">
		<h:outputLabel value="#{msg['portlets.description.vehicleinformation']}"></h:outputLabel>&nbsp;
		<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVinVo}" style="font-weight: bold;" />
	</h:panelGroup>
	
	
</h:form>

<style>
.accessoryText{
	color: black;
	text-decoration: none;
}

</style>
<script>



function expandCollapse(id1, id2, stdOptionsTbl)
{
	if(document.getElementById(id1) !=null)
	{
		document.getElementById(id1).style.display = "inline";
	}
	if(document.getElementById(id2) !=null)
	{
		document.getElementById(id2).style.display = "none";
	}
	var stdOptionsTable = document.getElementById(stdOptionsTbl);
	if(stdOptionsTable !=null)
	{
		if(stdOptionsTable.style.display=='inline')
		{
			stdOptionsTable.style.display='none';
		}
		else if(stdOptionsTable.style.display=='none')
		{
			stdOptionsTable.style.display='inline';
		}
		
	}
		
}

function setDiv(content)
{
	//alert(content);
	//var temp = "19\" 5- Spoke";
	var tempContent = content.replace(/\"/g," Inch");
	//alert('modified content :: '+tempContent);
	document.getElementById("accessoryToolTip").innerHTML = tempContent;
	return true;
}

</script>
