<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@page
	import="com.tms.t3.asm.binding.vo.vehicleAlert.VehicleAlertTypes"%>
<%@ taglib prefix="asm" uri="http://asm.toyota.com/jsf/html/asm"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />
	
<%
	pageContext.setAttribute("WARRANTY_ELIGIBILITY",
			VehicleAlertTypes.WARRANTY_ELIGIBILITY);
%>
<%
	pageContext.setAttribute("CUSTOMER_RELATION",
			VehicleAlertTypes.CUSTOMER_RELATION);
%>
<%
	pageContext.setAttribute("TASCASE", VehicleAlertTypes.TASCASE);
%>
<%
	pageContext.setAttribute("REPEAT_REPAIR",
			VehicleAlertTypes.REPEAT_REPAIR);
%>
<%
	pageContext.setAttribute("BUYBACK", VehicleAlertTypes.BUYBACK);
%>
<%
	pageContext.setAttribute("CUSTOMER_SURVEY_SAD", VehicleAlertTypes.CUSTOMER_SURVEY_SAD);
%>
<%
	pageContext.setAttribute("CUSTOMER_SURVEY_SMILE", VehicleAlertTypes.CUSTOMER_SURVEY_SMILE);
%>
	<h:form>
	<h:panelGroup rendered="#{searchVinControllerBean.vehicleAlertsVOForPrint.vehicleAlertColl == null}">
		<h:outputLabel value="#{msg['portlets.vehAlerts.empty.message']}" style="font-weight: bold;"></h:outputLabel>
	</h:panelGroup>
	<h:dataTable id="vehicleAlerts" cellspacing="1" width="100%"
		styleClass="vehicleAlerts AlertBrdr" var="vehcileVar"
		rendered="#{searchVinControllerBean.vehicleAlertsVOForPrint != null}"
		value="#{searchVinControllerBean.vehicleAlertsVOForPrint.vehicleAlertColl}"
		 border="1"
		columnClasses="class1,class2">
		<h:column >
			<h:graphicImage value="#{vehcileVar.vehicleAlert.icon}" height="30px"
				width="30px"></h:graphicImage>
		</h:column>
		<h:column>
			<h:panelGroup id="warrantyeligibility"
				rendered="#{vehcileVar.vehicleAlert == 'WARRANTY_ELIGIBILITY'}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/warrantyEligibilityAlerts.jsp"></jsp:include>
			</h:panelGroup>
			<h:panelGroup id="customerrelation"
				rendered="#{vehcileVar.vehicleAlert == 'CUSTOMER_RELATION' && fn:length(vehcileVar.customerRelationCollection) > 0}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/customerRelationAlerts.jsp"></jsp:include>
			</h:panelGroup>
			<h:panelGroup id="tascaseinfo"
				rendered="#{vehcileVar.vehicleAlert == 'TASCASE'}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/tasCaseInfoAlerts.jsp"></jsp:include>
			</h:panelGroup>
			<h:panelGroup id="buyback"
				rendered="#{vehcileVar.vehicleAlert == 'BUYBACK'}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/buyBackAlerts.jsp"></jsp:include>
			</h:panelGroup>
			<h:panelGroup id="repeatrepair"
				rendered="#{vehcileVar.vehicleAlert == 'REPEAT_REPAIR'}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/repeatRepairAlerts.jsp"></jsp:include>
			</h:panelGroup>
			<f:subview id="surveyAlert"
				rendered="#{vehcileVar.vehicleAlert == 'CUSTOMER_SURVEY_SAD' or vehcileVar.vehicleAlert == 'CUSTOMER_SURVEY_SMILE'}">
				<jsp:include
					page="/pages/asm/vehicleOneView/vehicleAlerts/CustomerSurveyAlerts.jsp"></jsp:include>
			</f:subview>
		</h:column>
	</h:dataTable>
	</h:form>
<style>


.class1 {
	height: 20px;
	width: 20px;
	text-align:center;
}

.class2 {
	height: 20px;
	width: 300px;
}

.AlertBrdr {
	background-color: #357EC7;
}

.AlertBrdr td {
	background-color: #fff;
}
</style>
