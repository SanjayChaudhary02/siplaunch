<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.secondCol{
	padding-bottom:30px;
}
</style>

<%
long time1=System.currentTimeMillis();

System.out.println("print common include start" + time1);
%>
<tbody>
<tr>
		<td colspan=2>		
		<table style="width:100%">
		<tr>
			<td style="text-align: left;vertical-align:top;" width="100%"> 
			<f:subview id="vinHeader">
				<h:outputText escape="false" value="#{vehicleOneLinerDescription.pdfVehicleOneLiner }" style="font-weight: bolder; font-family: arial; font-size: 12px;"></h:outputText>
			</f:subview>
			</td>
		</tr>
		<tr>
			<td style="text-align: left;vertical-align:top;" width="100%"> 
			<h:panelGrid columns="2" columnClasses="firstCol,secondCol">
					<h:column>
					<img src="${pageContext.request.contextPath}/LinearServlet.jpg?BARCODE=${vinValue}&CODE_TYPE=CODE39&CHECK_CHAR=N&FONT_COLOR=WHITE"/>
					</h:column>
					<h:column>
					<h:panelGroup>
							
						<h:graphicImage 
						rendered="#{searchVinControllerBean.showEDDashboardAlertIcon}"
						style="vertical-align: top;border : none;" width="50" height="30"
						url="/resources/images/edDashAlert.jpg"></h:graphicImage>
						&nbsp;
						<h:graphicImage 
						rendered="#{searchVinControllerBean.sscIndicator}"
						style="vertical-align: top;border : none;"
						url="/resources/images/ssc.jpg"></h:graphicImage>
						&nbsp;
						<h:graphicImage rendered="#{null != searchVinControllerBean.vehicleServiceHistoryVO and searchVinControllerBean.vehicleServiceHistoryVO.toyotaCareIcon and searchVinControllerBean.vinSearchResultVO.division == \"TOYOTA\"}"
						style="vertical-align: top; border : none;"
						url="/resources/images/toyota_care_logo.jpg"></h:graphicImage>
						
						<h:graphicImage rendered="#{null != searchVinControllerBean.vehicleServiceHistoryVO and searchVinControllerBean.vehicleServiceHistoryVO.toyotaCareIcon and searchVinControllerBean.vinSearchResultVO.division == \"SCION\"}" 
						style="vertical-align: top;border : none;" url="/resources/images/scionserviceboost.jpg"/>
						&nbsp;
						
						<h:graphicImage rendered="#{searchVinControllerBean.tcuvIndicator and vinSearchResultVO.division == 'TOYOTA' and not searchVinControllerBean.hybridIndicator}"
						style="vertical-align: top;border : none;"
						url="/resources/images/tcuv.jpg"></h:graphicImage>
						<h:graphicImage
						rendered="#{searchVinControllerBean.tcuvIndicator and vinSearchResultVO.division == 'TOYOTA' and searchVinControllerBean.hybridIndicator }"
						style="vertical-align: top;border : none;"
						url="/resources/images/tcuh.jpg"></h:graphicImage>
						
						<h:graphicImage 
						rendered="#{searchVinControllerBean.tcuvIndicator and vinSearchResultVO.division == 'SCION'}"
						style="vertical-align: top;border : none;"
						url="/resources/images/scpo.png"></h:graphicImage>
						
						<h:graphicImage 
						rendered="#{searchVinControllerBean.tcuvIndicator and vinSearchResultVO.division == 'LEXUS'}"
						style="vertical-align: top;border : none;"
						url="/resources/images/lexus_certified.jpg"></h:graphicImage>
						
						<h:graphicImage rendered="#{searchVinControllerBean.roadsideAssistanceHistoryIndicator}"
						url="/resources/images/roadsideAssistance/roadsideAssistanceHistory.gif" style="vertical-align: top;border : none;"></h:graphicImage>
					
						<c:if test="${not empty salvageVinControllerBean.salvageVinVo and salvageVinControllerBean.salvageVinVo.salvageVin}">
				
						<h:graphicImage url="/resources/images/salvage.png"
									id="slavageImg1" style="vertical-align:middle;" height="38" width="42"></h:graphicImage>
						</c:if>
					</h:panelGroup>
					</h:column>
			</h:panelGrid>
			</td>
		</tr>
		</table>
	
	<h:panelGroup style="width:100%; margin:auto;" layout="block">
	<h:dataTable width="100%" value="#{paramValues.moduleName}" var="moduleName">
		<h:column>
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.alerts']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"> 
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="Vehicle Alerts"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="vehicleAlerts" styleClass="bea-portal-book-page">
				<table cellpadding=3 class="panelStyle">
				<tr>
				<td style="width:100%">
					<f:subview id="vehicleAlertsSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/vehicleAlertsIncludeForPrint.jsp">
						</jsp:include>
					</f:subview>
				</td>
				</tr>
				</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.enformDiag.alerts']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"> 
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{msg['print.title.enformDiag.alerts']}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="edDiagAlerts" styleClass="bea-portal-book-page">
				<table cellpadding=3 class="panelStyle">
				<tr>
				<td style="width:100%">
					<f:subview id="edDashAlertsSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/edDashboardAlertPrintInclude.jsp">
						</jsp:include>
					</f:subview>
				</td>
				</tr>
				</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.guestinformation']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"  styleClass="section">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="guestInfo" styleClass="bea-portal-book-page" rendered="#{customerInfoControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="guestInfoSubView">
						<jsp:include page="/pages/asm/mobile/printview/customerInformationInclude.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{customerInfoControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="guestInfoErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.vehinformation']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="vehicleInformation" styleClass="bea-portal-book-page" rendered="#{vehicleInformationControllerBean.showPage}">
				<table class="panelStyle section">
					<tr>
					<td style="width:100%">
						<f:subview id="vehicleHistorySubView">
							<jsp:include
								page="/pages/asm/mobile/printview/vehicleInformationInclude_PrintVehicleOneView.jsp">
							</jsp:include>
						</f:subview>
					</td>
					</tr>
					
				</table>
				
				<c:if test="${param.specHelpClicked == 'yes'}">
   					<table style="font-size:9px;" class="panelStyle section" id="specHelpVehInfoTable">
   						<tr><td width=100%>
   						<b>${msg['portlets.spechelp.vehicleinfo']}</b>
   						<ul>
   						<c:if test="${vinSearchResultVO.division == 'TOYOTA' && !vehicleInformationControllerBean.hybridIndicator}">
							<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">
							<li>${msg['portlets.spechelp.tcuvCertified']}</li>
							<li>${msg['portlets.spechelp.tcuvDofu']}</li>
							<li>${msg['portlets.spechelp.tcuvMileage']}</li>
							<li>${msg['portlets.spechelp.tcuvDealer']}</li>
						</c:if>	</c:if>	
						<c:if test="${vinSearchResultVO.division == 'TOYOTA' && vehicleInformationControllerBean.hybridIndicator}">
							<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">
							<li>${msg['portlets.spechelp.tcuhCertified']}</li>
							<li>${msg['portlets.spechelp.tcuhDofu']}</li>
							<li>${msg['portlets.spechelp.tcuhMileage']}</li>
							<li>${msg['portlets.spechelp.tcuhDealer']}</li>
						</c:if>	</c:if>	
						<c:if test="${vinSearchResultVO.division == 'SCION'}">
							
							<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">
							<li>${msg['portlets.spechelp.scpoCertified']}</li>
							<li>${msg['portlets.spechelp.scpoDofu']}</li>
							<li>${msg['portlets.spechelp.scpoMileage']}</li>
							<li>${msg['portlets.spechelp.scpoDealer']}</li>
						</c:if></c:if>		
						<c:if test="${vinSearchResultVO.division == 'LEXUS'}">
					
							<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.tcuvCertified !=null}">
							<li>${msg['portlets.spechelp.lcpoCertified']}</li>
							<li>${msg['portlets.spechelp.lcpoDofu']}</li>
							<li>${msg['portlets.spechelp.lcpoMileage']}</li>
							<li>${msg['portlets.spechelp.lcpoDealer']}</li>
						</c:if></c:if>
						<li>${msg['portlets.spechelp.prodDate']}</li>
						<li>${msg['portlets.spechelp.dofu']}</li>
						<li>${msg['portlets.spechelp.engineOilType']}</li>
						<li>${msg['portlets.spechelp.transDrive']}</li>
						<li>${msg['portlets.spechelp.plantCode']}</li>
						<li>${msg['portlets.spechelp.dealer']}</li>
						<li>${msg['portlets.spechelp.engineOil']}</li>
						<li>${msg['portlets.spechelp.transOil']}</li>
						<li>${msg['portlets.spechelp.grade']}</li>
						<li>${msg['portlets.spechelp.color']}</li>
						<li>${msg['portlets.spechelp.flatRateManual']}</li>
						<li>${msg['portlets.spechelp.standardEquipment']}</li>						
						<c:if test="${vinSearchResultVO.division == 'TOYOTA'}">
							<li>${msg['portlets.spechelp.safetyConnect']}</li></c:if>	
								
						<c:if test="${vinSearchResultVO.division == 'LEXUS'}">
							<li>${msg['portlets.spechelp.enformsafetyConnect']}</li>
						</c:if>
						<li>${msg['portlets.spechelp.xmsubscription']}</li>	
						</ul>
						</td></tr>
					</table>
				</c:if>
				</h:panelGroup>
				
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{vehicleInformationControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="vehInfoErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
		
			<h:panelGroup  styleClass="section" layout="block" rendered="#{moduleName == msg['print.title.vehspecifications']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="vehicleSpecificationMobile" styleClass="bea-portal-book-page" rendered="#{vehicleSpecControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="vehicleSpecSubView">
						<jsp:include page="/pages/asm/mobile/printview/vehicleSpecificationInclude.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
					<c:if test="${param.specHelpClicked == 'yes'}">
						<table style="font-size:9px;" class="panelStyle" id="specHelpVehSpecTable">
						<tr><td width=100%>
							<b>${msg['portlets.spechelp.vehiclespec']}</b>
							<ul>
							<li>${msg['portlets.spechelp.Gvwr']}</li>
							<li>${msg['portlets.spechelp.towingCapacity']}</li>
							<li>${msg['portlets.spechelp.Hp']}</li>
							<li>${msg['portlets.spechelp.dinghyTow']}</li>
							<li>${msg['portlets.spechelp.fuelTankCapacity']}</li>
							<li>${msg['portlets.spechelp.fuel']}</li>
							<li>${msg['portlets.spechelp.coolant']}</li>
							<li>${msg['portlets.spechelp.cabinAirFilter']}</li>
							</ul>
							</td></tr>
						</table>
					</c:if>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{vehicleSpecControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="vehSpecErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			

			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.govtratings']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"  styleClass="section">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="governmentRatings" styleClass="bea-portal-book-page" rendered="#{mpgRatingsControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="gRatingsSubView">
						<jsp:include page="/pages/asm/mobile/printview/mpgRatingsInclude.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
					<c:if test="${param.specHelpClicked == 'yes'}">
						<table style="font-size:9px;" class="panelStyle" id="specHelpGovtRatingsTable">
						<tr><td width=100%>
							<b>${msg['portlets.spechelp.govratings']}</b>
							<ul>
							<li>${msg['portlets.spechelp.safetyRating']}</li>
							<li>${msg['portlets.spechelp.fuelEconomy']}</li>
							</ul>
						</td></tr>
						</table>
					</c:if>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{mpgRatingsControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="gRatingsErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.ownershiphistory']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"  styleClass="section">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="ownershipHistory" styleClass="bea-portal-book-page" rendered="#{ownershipHistoryControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="ownershipHistorySubView">
						<jsp:include page="/pages/asm/mobile/printview/ownershipHistoryInclude.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{ownershipHistoryControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="ownershipHistErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.campaign']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="campaign" styleClass="bea-portal-book-page" rendered="#{serviceCampaignControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="campaignSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/serviceCampaignPrintInclude.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{serviceCampaignControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="campaignErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			

			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.servicehistory']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="serviceHistory" styleClass="bea-portal-book-page" rendered="#{serviceHistoryControllerBean.showPage}">
					<table style="padding:2px;" class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="serviceHistorySubView">
						<jsp:include
							page="/pages/asm/mobile/printview/serviceHistory_PrintVehicleOneView.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{serviceHistoryControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="serviceHistoryErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			

			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.toyotacare'] || moduleName == msg['print.title.scionboost']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{toyotaCareControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
						<f:subview id="toyotaCareErrorSubView">
							<jsp:include
								page="/pages/asm/mobile/printview/sLaneAppError.jsp">
							</jsp:include>
						</f:subview>
					</td>
					</tr>
					<c:if test="${param.mirai == 'Yes'}">
						<tr><td>
						<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
							<tr>
								<td class="warrantyStyle">
									<h:outputLabel value="Mirai Swap"></h:outputLabel>
								</td>
							</tr>
							<tr>
								<td>
								<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page">
									<f:subview id="miraiSubViewErr">
										<c:if test="${miraiSwapControllerBean.showPage}">
											<jsp:include
												page="/pages/asm/mobile/printview/miraiSwapPrintPDFInclude.jsp">
											</jsp:include>
										</c:if>
										<c:if test="${miraiSwapControllerBean.exception}">
											<jsp:include
												page="/pages/asm/mobile/printview/sLaneAppError.jsp">
											</jsp:include>
										</c:if>
									</f:subview>
								</h:panelGroup>
								
								</td>
							</tr>
						</table>
						</td></tr>
					</c:if>
					
					</table>
					
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="toyotaCare" styleClass="bea-portal-book-page" rendered="#{toyotaCareControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="toyotaCareSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/toyotaCareInclude.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					<c:if test="${param.mirai == 'Yes'}">
						<tr><td>
						<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
							<tr>
								<td class="warrantyStyle">
									<h:outputLabel value="Mirai Swap"></h:outputLabel>
								</td>
							</tr>
							<tr>
								<td>
								<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page">
									<f:subview id="miraiSubView">
										<c:if test="${miraiSwapControllerBean.showPage}">
											<jsp:include
												page="/pages/asm/mobile/printview/miraiSwapPrintPDFInclude.jsp">
											</jsp:include>
										</c:if>
										<c:if test="${miraiSwapControllerBean.exception}">
											<jsp:include
												page="/pages/asm/mobile/printview/sLaneAppError.jsp">
											</jsp:include>
										</c:if>
									</f:subview>
								</h:panelGroup>
								</td>
							</tr>
						</table>
						</td></tr>
					</c:if>
					</table>
					
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			
	</h:panelGroup>
			

			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.warranty']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style="" id="warranty" styleClass="bea-portal-book-page">
					<table class="panelStyle">
					<tr>
					<td style="width:100%;padding:2px;">
					<c:if test="${searchVinControllerBean.tcuvIndicator}">
					<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
						<tr>
							<td class="warrantyStyle">
								<h:outputLabel value="TCUV Warranty Information" style="font-weight:bold;" 
			       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && !certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="TCUH Warranty Information" style="font-weight:bold;" 
		       								rendered="#{vinSearchResultVO.division == 'TOYOTA' && certifiedWarrantyControllerBean.certifiedWarrantyVO.hybridVehicleInd}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="LCPO Warranty Information" style="font-weight:bold;" 
		       								rendered="#{vinSearchResultVO.division == 'LEXUS'}">&nbsp;</h:outputLabel>
		       					<h:outputLabel value="SCPO Warranty Information" style="font-weight:bold;" 
		       								rendered="#{vinSearchResultVO.division == 'SCION'}">&nbsp;</h:outputLabel>
							</td>
						</tr>
						<tr>
							<td>
							<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{searchVinControllerBean.tcuvIndicator}">
								<f:subview id="certWtySubView">
									<jsp:include
										page="/pages/asm/mobile/printview/certifiedWarrantyTis_PrintVehicleOneView.jsp">
									</jsp:include>
								</f:subview>
							</h:panelGroup>
							<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{certifiedWarrantyControllerBean.exception}">
								<h:panelGrid width="100%">
								<f:subview id="certWtyErrorSubView">
									<jsp:include
										page="/pages/asm/mobile/printview/sLaneAppError.jsp">
									</jsp:include>
								</f:subview>
								</h:panelGrid>
							</h:panelGroup>
							</td>
						</tr>
						</table><br/>
						</c:if>
					<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
					<tr>
						<td class="warrantyStyle">
							<h:outputLabel value="Vehicle Warranty Information"></h:outputLabel>
						</td>
					</tr>
					<tr>
						<td>
						<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{standardWarrantyControllerBean.showPage}">
							<f:subview id="warrantySubView">
								<jsp:include
									page="/pages/asm/mobile/printview/standardWarrantyTis_PrintVehicleOneView.jsp">
								</jsp:include>
							</f:subview>
						</h:panelGroup>
						<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{standardWarrantyControllerBean.exception}">
							<h:panelGrid width="100%">
							<f:subview id="warrantyErrorSubView">
								<jsp:include
									page="/pages/asm/mobile/printview/sLaneAppError.jsp">
								</jsp:include>
							</f:subview>
							</h:panelGrid>
						</h:panelGroup>
						</td>
					</tr>
					</table><br/>
					<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
					<tr>
						<td class="warrantyStyle">
							<h:outputLabel value="Customer Support Program"></h:outputLabel>
						</td>
					</tr>
					<tr>
						<td>
						<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{spaCampaignControllerBean.showPage}">
							<f:subview id="cspSubView">
								<jsp:include
									page="/pages/asm/mobile/printview/spaServiceCampaignPrintInclude.jsp">
								</jsp:include>
							</f:subview>
						</h:panelGroup>
						<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{spaCampaignControllerBean.exception}">
							<h:panelGrid width="100%">
							<f:subview id="spaErrorSubView">
								<jsp:include
									page="/pages/asm/mobile/printview/sLaneAppError.jsp">
								</jsp:include>
							</f:subview>
							</h:panelGrid>
						</h:panelGroup>
						</td>
					</tr>
					</table>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			
			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.fsprod']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="fsProd" styleClass="bea-portal-book-page" rendered="#{tfsProductsControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
						<f:subview id="fsProductsSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/tfsProducts_PrintVehicleOneView.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{tfsProductsControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="fsProdErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.telematics']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="telematics" styleClass="bea-portal-book-page" rendered="#{telematicSubscriptionControllerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="telematicsSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/telematicSubscriptionInclude.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
<!-- 					<tr> -->
<!-- 					<td style="width:100%"> -->
<%-- 					<f:subview id="telematicsRepView"> --%>
<!-- 					<div style="text-align:left; padding-bottom : 5px;"> -->
<%-- 							&nbsp;&nbsp;&nbsp;<h:outputLabel value="DCM Replacement Log" style="font-weight:bold; text-decoration: underline; font-size : 15px;font-family: Verdana,Arial,Helvetica,sans-serif;"></h:outputLabel> --%>
<!-- 						</div> -->
<%-- 						<jsp:include --%>
<%-- 							page="/pages/asm/telematicReplacement/telematicReplacementInclude.jsp"> --%>
<%-- 						</jsp:include> --%>
<%-- 					</f:subview> --%>
<!-- 					</td> -->
<!-- 					</tr> -->
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{telematicSubscriptionControllerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="telematicsErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			

			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.roadsideassist']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%" >
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="roadsideAssistance" styleClass="bea-portal-book-page" rendered="#{roadsideAssistanceContollerBean.showPage}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="roadsideAssistanceSubView">
						<jsp:include page="/pages/asm/mobile/printview/roadsideAssistance_PrintVehicleOneView.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{roadsideAssistanceContollerBean.exception}">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="roadsideAssistanceErrorSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/sLaneAppError.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				</table>
			</h:panelGroup>
			
			
			
			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.dtchistory']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%" >
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
					
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="dtchistory" styleClass="bea-portal-book-page"  >
					<table style="width:100%;" class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="dtcSubView">
						<jsp:include page="/pages/asm/dtc/dtc_printOneView.jsp"></jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				
				</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				</table>
			</h:panelGroup>
			
			
			
			<h:panelGroup layout="block" styleClass="section" rendered="#{moduleName == msg['print.title.diagreports']}" style="page-break-inside: auto;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%" >
			<tr>
			<td style="padding: 0px;" class="panelStyle">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<table style="width: 100%">
					<c:if test="${vehicleHealthReportControllerBean.displayVHRPortlet}">
					<tr>
						<td>
							<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid; page-break-inside: auto;" class="warrantySection">
								<tr>
									<td class="warrantyStyle">
										<h:outputLabel value="Vehicle Health Reports"></h:outputLabel>
									</td>
								</tr>
								<tr>
									<td>
									<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{vehicleHealthReportControllerBean.showPage}">
										<f:subview id="vhrSubView">
											<jsp:include
												page="/pages/asm/mobile/printview/vehicleHealthReport_PrintInclude.jsp">
											</jsp:include>
										</f:subview>
									</h:panelGroup>
									<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{vehicleHealthReportControllerBean.exception}">
										<h:panelGrid width="100%">
										<f:subview id="vhrErrorSubView">
											<jsp:include
												page="/pages/asm/mobile/printview/sLaneAppError.jsp">
											</jsp:include>
										</f:subview>
										</h:panelGrid>
									</h:panelGroup>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					</c:if>
					<% System.out.println("Time taken before displayVHRPortlet " + ((System.currentTimeMillis() - time1))); %>
					<tr>
						<td>
							<table style="width:100%;font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;border: #000000 1px solid;" class="warrantySection">
								<c:if test="${vehicleHealthReportControllerBean.displayVHRPortlet}">
									<tr>
										<td class="warrantyStyle">
											<h:outputLabel value="Techstream Diagnostic Reports History"></h:outputLabel>
										</td>
									</tr>
								</c:if>
									<tr>
										<td>
										<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" id="diagnosticReports" styleClass="bea-portal-book-page" rendered="#{diagnosticReportControllerBean.showPage}">
											<table style="width:100%;" >
											<tr>
											<td style="width:100%">
											<f:subview id="diagSubView">
												<jsp:include
													page="/pages/asm/mobile/printview/diagnosticReport_PrintOneView.jsp">
												</jsp:include>
											</f:subview>
											</td>
											</tr>
											</table>
										</h:panelGroup>
										<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page" rendered="#{diagnosticReportControllerBean.exception}">
											<table style="width:100%;" >
											<tr>
											<td style="width:100%">
											<f:subview id="diagErrorSubView">
												<jsp:include
													page="/pages/asm/mobile/printview/sLaneAppError.jsp">
												</jsp:include>
											</f:subview>
											</td>
											</tr>
											</table>
										</h:panelGroup>
										</td>
									</tr>
								</table>
						</td>
					</tr>
				</table>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
					<% System.out.println("Time taken after diagnosticReport_PrintOneView " + ((System.currentTimeMillis() - time1))); %>	
					
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.custsurvey']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"  id="customerSurvey" styleClass="bea-portal-book-page">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					<f:subview id="custSurveySubView">
						<jsp:include
							page="/pages/asm/mobile/printview/customerSurvey_PrintVehicleOneView.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGroup>
				
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			<!-- Schedule Maintenance jsp include start -->
		
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.scheduledmaintenance']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
			<table style="width:100%">
			<tr>
			<td style="width:100%">
				<h:panelGrid columns="2" styleClass="headerStyle">
					<h:outputLabel value="#{moduleName}"></h:outputLabel>
				</h:panelGrid>
				<!-- condition start -->
				
				<c:choose>
				<c:when test="${param['hasSMData'] == 'true'}">
					<h:panelGrid style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;"  id="schMaintenance" styleClass="bea-portal-book-page">
					<table class="panelStyle">
					<tr>
					<td style="width:100%">
					
					<f:subview id="schMaintenanceSubView">
						<jsp:include
							page="/pages/asm/mobile/printview/schMntPrintPDFCommonInclude.jsp">
						</jsp:include>
					</f:subview>
					</td>
					</tr>
					</table>
				</h:panelGrid>
				</c:when>
				<c:otherwise>
				<h:panelGroup styleClass="bea-portal-book-page">
				<table class="panelStyle">
			 	<tr><td style="width:100%"><h:outputLabel value="#{msg['portlet.schMnt.noDataAvailable']}"
							style="color: red;"></h:outputLabel></td></tr>
							
				<!--  divya	<tr><td style="width:100%"><h:outputLabel value="#{msg['portlet.schMnt.noMileageDataAvailable']}"
							style="color: red;"></h:outputLabel></td></tr>-->		
							
					
							</table>
				</h:panelGroup>
					
				
				</c:otherwise>
				</c:choose>
				
				
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			</table>
			</h:panelGroup>
			
			
			<!-- Schedule Maintenance jsp include end -->
		</h:column>
	</h:dataTable> 
	</h:panelGroup>
	</td>
	</tr>
	<tr>
	<td colspan=2>		
			<h:outputLabel style="font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;font-weight: normal" value="#{msg['portlets.pdf.disclaimer']}"></h:outputLabel>
	</td>
	</tr>
	</tbody>
	<% System.out.println("Time taken after print common last " + ((System.currentTimeMillis() - time1))); %>