<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="asm" uri="http://asm.toyota.com/jsf/html/asm"%>

<h:form id="toyotaCareForm">
	<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
		var="msg" />

	<h:panelGroup layout="block" style="width:100%; text-align:center;" rendered="#{vin.vinNumber!= null and not empty vin.vinNumber}">
		<h:outputText style="font-weight:bold;"
			rendered="#{dmy.division == \"TOYOTA\"}"
			value="#{msg['asm.programDetails.TOYOTA']}" />
		<h:outputText style="font-weight:bold;"
			rendered="#{dmy.division == \"SCION\"}"
			value="#{msg['asm.programDetails.SCION']}" />
	</h:panelGroup>
	
	<h:panelGroup
		rendered="#{vin.vinNumber!= null and not empty vin.vinNumber and (toyotaCareControllerBean.vehicleServiceHistoryVO == null || empty toyotaCareControllerBean.vehicleServiceHistoryVO.vehicleServiceHistoryDetailTypesVO) }">
		<h:panelGroup layout="block" style="width:100%; text-align:center;">
			<br/>
			<c:choose>
			<c:when test="${toyotaCareControllerBean.vinSearchResultVO.dofu != null and not toyotaCareControllerBean.validDofu}">
				<h:outputText value="#{msg['portlet.toyotaCare.notApplicable'] }"
					rendered="#{dmy.division == \"TOYOTA\"}"></h:outputText>
				<h:outputText value="#{msg['portlet.ScionBoost.notApplicable'] }"
					rendered="#{dmy.division == \"SCION\"}"></h:outputText>
			</c:when>
			<c:otherwise>
				<h:outputText value="#{msg['portlet.toyotaCare.notAvailable'] }"
					rendered="#{dmy.division == \"TOYOTA\"}"></h:outputText>
				<h:outputText value="#{msg['portlet.ScionBoost.notAvailable'] }"
					rendered="#{dmy.division == \"SCION\"}"></h:outputText>
			</c:otherwise>
			</c:choose>
			<h:outputText style="font-weight:bold;" value="#{vin.vinNumber} "></h:outputText>
			<h:outputText value="#{msg['portlet.toyotaCare.because'] }" rendered="#{not toyotaCareControllerBean.validDofu or (toyotaCareControllerBean.validDofu and toyotaCareControllerBean.vinSearchResultVO.fleetIndicator)}"></h:outputText>
			
		</h:panelGroup>
		<c:choose>
		<c:when test="${(toyotaCareControllerBean.vinSearchResultVO.dofu != null and not toyotaCareControllerBean.validDofu)}">
			<h:panelGroup layout="block"
				style="width:100%; text-align:left;">
				<br/>
				<h:outputText value="#{msg['portlet.toyotaCare.reason1'] }"
					rendered="#{dmy.division == \"TOYOTA\"}"></h:outputText>
				<h:outputText value="#{msg['portlet.ScionBoost.reason1'] }"
					rendered="#{dmy.division == \"SCION\"}"></h:outputText>
			</h:panelGroup>
		</c:when>
		<c:when test="${(toyotaCareControllerBean.vinSearchResultVO.dofu != null and toyotaCareControllerBean.validDofu)  and toyotaCareControllerBean.vinSearchResultVO.fleetIndicator and not toyotaCareControllerBean.mdlYearGtrThan2014}">
				<h:panelGroup layout="block"
					style="width:100%; text-align:left;">
					<br/>
					<h:outputText value="#{msg['portlet.toyotaCare.fleet.reason1'] }"
						rendered="#{dmy.division == \"TOYOTA\"}"></h:outputText>
					<h:outputText value="#{msg['portlet.ScionBoost.fleet.reason1'] }"
						rendered="#{dmy.division == \"SCION\"}"></h:outputText>
				</h:panelGroup>
		</c:when>
		<c:otherwise>
		
		
		<h:panelGroup layout="block"
			style="width:100%; text-align:left; "
			rendered="#{dmy.division == \"TOYOTA\"}">
			<br/>
			<h:outputText style="font-weight:bold;text-decoration:underline;"
				value="#{msg['portlet.toyotaCare.probReasons'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.toyotaCare.probReasons1'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.toyotaCare.probReasons2'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.toyotaCare.probReasons3'] }"></h:outputText>
			<br/>
		</h:panelGroup>

		<h:panelGroup layout="block"
			style="width:100%; text-align:left;"
			rendered="#{dmy.division == \"SCION\"}">
			<br/>
			<h:outputText style="font-weight:bold;text-decoration:underline;"
				value="#{msg['portlet.toyotaCare.probReasons'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.ScionBoost.probReasons1'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.ScionBoost.probReasons2'] }"></h:outputText>
			<br/>
			<h:outputText value="#{msg['portlet.ScionBoost.probReasons3'] }"></h:outputText>
			<br/>
		</h:panelGroup>
		</c:otherwise>
		</c:choose>
	</h:panelGroup>
	
	<h:panelGrid border="0" cellpadding="0" cellspacing="0" width="100%"
		rendered="#{toyotaCareControllerBean.vehicleServiceHistoryVO != null and not empty toyotaCareControllerBean.vehicleServiceHistoryVO.vehicleServiceHistoryDetailTypesVO}">
		<h:panelGrid border="0" width="100%" cellpadding="0" cellspacing="0">

			<h:outputText value="&nbsp;&nbsp;" escape="false" />
			<h:panelGroup layout="block" style="text-align:center;">
				<h:outputText value="#{dmy.modelYear}" escape="false" />&nbsp;<h:outputText
					value="#{dmy.modelName}" escape="false" /> &nbsp;<h:outputText
					value="#{vin.vinNumber}" escape="false" />
			</h:panelGroup>
			<h:outputText value="&nbsp;&nbsp;" escape="false" />
		</h:panelGrid>
		<h:panelGrid width="100%">
			<h:panelGroup layout="block">

				<h:outputText style="font-weight:bold;font-size:10px;"
					value="#{msg['portlets.asm.toyotacare.eligiblevin']}&nbsp;"
					escape="false"></h:outputText>
				<h:outputText
					value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.eligibleVin}"
					style="font-size:10px;"></h:outputText>
				<h:outputText value="&nbsp;&nbsp;" escape="false" />

				<h:outputText style="font-weight:bold;font-size:10px;"
					value="#{msg['portlets.asm.toyotacare.oiltype']}&nbsp;"
					escape="false"></h:outputText>
				<h:outputText
					value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.oilType}"
					style="font-size:12px;font-size:10px;"></h:outputText>
				<h:outputText value="&nbsp;&nbsp;" escape="false" />

				<h:outputText style="font-weight:bold;font-size:10px;"
					value="#{msg['portlets.asm.toyotacare.effectivedate']}&nbsp;"
					escape="false"></h:outputText>
				<h:outputText
					value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.effectiveDate}"
					style="font-size:10px;"></h:outputText>
				<h:outputText value="&nbsp;&nbsp;" escape="false" />

				<h:outputText style="font-weight:bold;font-size:10px;"
					value="#{msg['portlets.asm.toyotacare.expirationdate']}&nbsp;"
					escape="false"></h:outputText>
				<h:outputText
					value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.expirationDate}"
					style="font-size:10px;"></h:outputText>
				<h:outputText value="&nbsp;&nbsp;" escape="false" />


				<h:outputText style="font-weight:bold;font-size:10px;"
					value="#{msg['portlets.asm.toyotacare.expirationmileage']}&nbsp;"
					escape="false"></h:outputText>
				<h:outputText
					value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.expirationMileage}"
					style="font-size:10px;"></h:outputText>
				<h:outputText value="&nbsp;&nbsp;" escape="false" />
			</h:panelGroup>
		</h:panelGrid>
		<h:outputText value="&nbsp;&nbsp;" escape="false" />
		<h:outputText value="&nbsp;&nbsp;" escape="false" />
		<h:panelGrid style="text-align:center;" width="100%">
			<h:dataTable id="serviceDetails"
				rendered="#{not empty toyotaCareControllerBean.vehicleServiceHistoryVO.vehicleServiceHistoryDetailTypesVO}"
				var="serviceDetails" cellspacing="0" cellpadding="2"
				styleClass="toyotaCaretable" style="border: 1px solid black;"
				value="#{toyotaCareControllerBean.vehicleServiceHistoryVO.vehicleServiceHistoryDetailTypesVO}"
				width="100%">
				<h:column>
					<f:facet name="header">
						<h:outputText
							value="#{msg['portlets.asm.toyotacare.service.description']}"
							escape="false" />
					</f:facet>
					<h:outputText
						value="#{serviceDetails.serviceDescription != null ? serviceDetails.serviceDescription : '&nbsp;' }"
						escape="false" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="#{msg['portlets.asm.toyotacare.status']}"
							escape="false" />
					</f:facet>
					<h:outputText
						value="#{serviceDetails.status != null ? serviceDetails.status : '&nbsp;' }"
						escape="false" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="#{msg['portlets.asm.toyotacare.opcode']}"
							escape="false" />
					</f:facet>
					<h:outputText
						value="#{serviceDetails.opCode != null ? serviceDetails.opCode : '&nbsp;' }"
						escape="false" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText
							value="#{msg['portlets.asm.toyotacare.servicing.dealer']}"
							escape="false" />
					</f:facet>
					<c:if test="${customerSurveyControllerBean.portletRequest}">
						<h:commandLink  value="#{serviceDetails.servicingDealerName != null ? serviceDetails.servicingDealerName : '&nbsp;' } (#{serviceDetails.servicingDealer != null ? serviceDetails.servicingDealer : '&nbsp;' })"
						onclick="javascript:openLatestDealerCode('#{serviceDetails.servicingDealer}','#{serviceDetails.dateServiced}','MM-dd-yyyy');return false;" rendered="#{serviceDetails.servicingDealer != null}"></h:commandLink>
					</c:if>
					<c:if test="${not customerSurveyControllerBean.portletRequest}">
						<h:outputText value="#{serviceDetails.servicingDealerName != null ? serviceDetails.servicingDealerName : '&nbsp;' } (#{serviceDetails.servicingDealer != null ? serviceDetails.servicingDealer : '&nbsp;' })"
						rendered="#{serviceDetails.servicingDealer != null}" style="color : blue;">
						</h:outputText>
					</c:if>
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText
							value="#{msg['portlets.asm.toyotacare.date.serviced']}"
							escape="false" />
					</f:facet>
					<h:outputText
						value="#{serviceDetails.dateServiced != null ? serviceDetails.dateServiced : '&nbsp;' }"
						escape="false" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText
							value="#{msg['portlets.asm.toyotacare.date.mileage']}"
							escape="false" />
					</f:facet>
					<h:outputText
						value="#{serviceDetails.mileage != null ? serviceDetails.mileage : '&nbsp;' }"
						escape="false" />
				</h:column>
			</h:dataTable>
		</h:panelGrid>
		<h:outputText value="&nbsp;&nbsp;" escape="false" />
		<h:panelGroup layout="block" style="text-align:center;width:100%;">
			<h:outputText value="#{msg['portlets.asm.toyotacare.note']}" />
		</h:panelGroup>
		<h:outputText value="&nbsp;&nbsp;" escape="false" />
		<h:outputText value="&nbsp;&nbsp;" escape="false" />
	</h:panelGrid>
</h:form>
<Script>
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("toyotaCareControllerBean");
%>
var tcPage = document.getElementById('toyotaCare_blue');
if('<%=tasTab.containsResult()%>'=='true' && tcPage && singleView)
	tcPage.innerHTML = "<font color='yellow'><u>" + tcPage.innerHTML + "</u></font>";	
</Script>
<style>
.toyotaCaretable th {
	border: 1px solid black;
	background-color: #E8E8E8;
}

.toyotaCaretable td {
	border: 1px solid black;
}
</style>