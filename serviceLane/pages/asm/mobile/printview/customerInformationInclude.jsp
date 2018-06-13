<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>

<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />
<script type="text/javascript">

	function selectCustomerFromList(customerId){
		var container = '${facesContext.viewRoot.id}:customerInformationForm';	
		document.getElementById('selectedCustomerId').value = customerId;
		var selectCustomerButton = findElement('customerSelectButton', container);
		selectCustomerButton.click();
	}
	
	function findElement(elementId,container){ 
		if(document.getElementById(container+ ':' + elementId)) 
		{
		return document.getElementById(container+ ':' + elementId);
		}
	}
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("customerInfoControllerBean");
%>
var custInfoPage = document.getElementById('ASMPortal_Cust_Info');
if('<%=tasTab.containsResult()%>'=='true' && custInfoPage && singleView)
	custInfoPage.innerHTML = "<font color='yellow'><u>" + custInfoPage.innerHTML + "</u></font>";	
</script>
<h:form id="customerInformationForm">
	<c:if test="${customerInfoControllerBean.containsData and null != vin and null != vin.vinNumber and not empty vin.vinNumber}">
	<f:verbatim>
			<input type="hidden" name="_disableAysnc" value="no" />
		</f:verbatim>
		<input type="hidden" name="selectedCustomerId" id="selectedCustomerId"/> 
		<table style="width: 100%">
			<tr>
				<td>
					<h:panelGroup style="width: 70%">
						<h:panelGrid columns="1" width="100%">
							<h:panelGroup>
								<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.displayNameFormat}" styleClass="fontstyleClass nameStyle" style="vertical-align:top;"></h:outputText>
								<h:graphicImage style="width:30px; cursor:pointer; align:left;border:0px;vertical-align:bottom;" url="/resources/images/household.jpg" title="View Household Vehicles" onclick="javascript:openHouseholdPopup();"/>
							</h:panelGroup>
							<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.addressLine1}" rendered="#{null !=  customerInfoControllerBean.customerDetailsVODisplayed.addressLine1 && not empty customerInfoControllerBean.customerDetailsVODisplayed.addressLine1}"></h:outputText>
							<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.addressLine2}" rendered="#{null !=  customerInfoControllerBean.customerDetailsVODisplayed.addressLine2 && not empty customerInfoControllerBean.customerDetailsVODisplayed.addressLine2}"></h:outputText>
							<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.displayAddress3Format}" rendered="#{null !=  customerInfoControllerBean.customerDetailsVODisplayed.displayAddress3Format && not empty customerInfoControllerBean.customerDetailsVODisplayed.displayAddress3Format}"></h:outputText>
							
						</h:panelGrid>
					</h:panelGroup>
				</td>
					
				
				<td style="vertical-align: top;">
					<h:panelGroup style="width: 100%;" rendered="#{not empty customerInfoControllerBean.customerDetailsVOList}">
						<c:set value="${customerInfoControllerBean.customerDetailsVOList}" var="customerList"></c:set>
						<table style="width:100%;">
							<tr style="text-align: center;">
								<td>
									<h:outputText value="#{msg['portlet.guestInfo.associatedParties']}" styleClass="fontstyleClass" style="text-decoration : underline;"></h:outputText>
								</td>
							</tr>
							<c:forEach items="${customerList}" var="customerDetails">
								<tr style="text-align: center;">
									<td>
										<c:if test="${customerInfoControllerBean.portletRequest}">
											<a href="javascript:selectCustomerFromList(${customerDetails.customerID});" style="color: blue; "><b>${customerDetails.displayNameFormat}</b></a>
										</c:if>
										<c:if test="${!customerInfoControllerBean.portletRequest}">
											<b style="color: blue;">${customerDetails.displayNameFormat}</b>
										</c:if>
									</td>
								</tr>	
							</c:forEach>
						</table>
						<h:commandButton style="display: none;" value="Hidden Button" id="customerSelectButton" action="#{customerInfoControllerBean.selectCustomerId}"></h:commandButton>
					</h:panelGroup>
				</td>
			</tr>
		</table>
		<br/>
		<h:panelGrid columns="2" columnClasses="emailClass,lastUpdateClass" style="width : 100%;">
			<h:panelGroup rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.displayPrimaryPhFormat && not empty customerInfoControllerBean.customerDetailsVODisplayed.displayPrimaryPhFormat }">
						<h:outputText value="#{msg['portlet.guestInfo.primaryPh']}" styleClass="fontstyleClass"></h:outputText>
					<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.displayPrimaryPhFormat}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.displayAlternatePhFormat && not empty customerInfoControllerBean.customerDetailsVODisplayed.displayAlternatePhFormat }" style="white-space: no-wrap;">
			</h:panelGroup>
			<h:panelGroup rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.displayAlternatePhFormat && not empty customerInfoControllerBean.customerDetailsVODisplayed.displayAlternatePhFormat }">
					<h:outputText value="#{msg['portlet.guestInfo.alternate']}" styleClass="fontstyleClass"></h:outputText>
					<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.displayAlternatePhFormat}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.emailAddress && not empty customerInfoControllerBean.customerDetailsVODisplayed.emailAddress }">
			</h:panelGroup>
			<h:panelGroup style="white-space: no-wrap; vertical-align : top;" rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.emailAddress && not empty customerInfoControllerBean.customerDetailsVODisplayed.emailAddress }">
				<h:outputText value=" #{msg['portlet.guestInfo.email']}" styleClass="fontstyleClass"></h:outputText>
				<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.emailAddress}"></h:outputText>
			</h:panelGroup>
			
			<h:panelGroup  rendered="#{null != customerInfoControllerBean.customerDetailsVODisplayed.displayLastUpdateFormat && not empty customerInfoControllerBean.customerDetailsVODisplayed.displayLastUpdateFormat }">
				<h:outputText value="#{msg['portlet.guestInfo.lastUpdate']}" styleClass="fontstyleClass"></h:outputText>
				<h:outputText value="#{customerInfoControllerBean.customerDetailsVODisplayed.displayLastUpdateFormat}"></h:outputText>
				<h:panelGroup rendered="#{customerInfoControllerBean.customerDetailsVODisplayed.dealerCodeLinkAvailable}">
					<a style="color: blue;" onclick="javascript:openLatestDealerCode('${customerInfoControllerBean.customerDetailsVODisplayed.dealerCode}','${customerInfoControllerBean.customerDetailsVODisplayed.lastUpdateDT}','MM-dd-yyyy');return false;">(${customerInfoControllerBean.customerDetailsVODisplayed.trucDealerName}-${customerInfoControllerBean.customerDetailsVODisplayed.dealerCode})</a>
				</h:panelGroup>
			</h:panelGroup>
		</h:panelGrid>
	</c:if>
	<c:if test="${!customerInfoControllerBean.containsData and null != vin and null != vin.vinNumber and not empty vin.vinNumber}">
		<h:outputLabel value="#{msg['portlet.guestInfo.errMsg1']} #{vin.vinNumber} #{msg['portlet.guestInfo.errMsg2']}" style="color: red;"></h:outputLabel>
	</c:if>
	
</h:form>
<style>
.lastUpdateClass{
	width: 50%;
	text-align:center;
}
.emailClass{
	width: 50%;
	vertical-align:top;
}
.fontstyleClass{
	font-weight: bold;
}
.nameStyle{
	color: #8E0707;
}


</style>