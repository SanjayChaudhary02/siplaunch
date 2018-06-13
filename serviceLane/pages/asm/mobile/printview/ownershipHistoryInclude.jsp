<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>

<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />
<h:form id="ownershipHistoryForm">
	<c:if test="${ownershipHistoryControllerBean.containsData and null != vin and null != vin.vinNumber and not empty vin.vinNumber}">
	
	<br/>
	<table class="tableStyle" cellSpacing="0" cellPadding=2px; >
		<tr class="rowStyle">
			<td class="columnStyle1bold columnStyle2">
				<h:outputLabel value="#{msg['portlet.ownershipHist.associatedParties']}" style="color:black;"></h:outputLabel>
			</td>
			<td class="columnStyle1bold">
				<h:outputLabel value="#{msg['portlet.ownershipHist.type']}" style="color:black;"></h:outputLabel>
			</td>
			<td class="columnStyle1bold">
				<h:outputLabel value="#{msg['portlet.ownershipHist.role']}" style="color:black;"></h:outputLabel>
			</td>
			<td class="columnStyle1bold">
				<h:outputLabel value="#{msg['portlet.ownershipHist.assEndDate']}" style="color:black;"></h:outputLabel>
			</td>
		</tr>
		<c:forEach items="#{ownershipHistoryControllerBean.ownershipHistoryList}" var="item">
			<c:if test="${null != item.displayNameFormat && not empty item.displayNameFormat }">
				<c:if test="${ownershipHistoryControllerBean.portletRequest}">
					<tr onclick="javascript:openAddressPopup('${item.customerID}');return false;" class="ownershiprow">
				</c:if>
				<c:if test="${!ownershipHistoryControllerBean.portletRequest}">
					<tr>
				</c:if>
					<td class="columnStyle1 columnStyle2" width="30%">
						<c:if test="${ownershipHistoryControllerBean.portletRequest}">
							<a style="color: blue" onclick="javascript:openAddressPopup('${item.customerID}');return false;"><b>${item.displayNameFormat}</b></a>
						</c:if>
						<c:if test="${!ownershipHistoryControllerBean.portletRequest}">
							<b style="color: blue">${item.displayNameFormat}</b>
						</c:if>
					</td>
					<td class="columnStyle1 " width="15%">
						<h:outputLabel value="#{msg['portlet.ownershipHist.person']}" rendered="#{null != item.firstNM && not empty item.firstNM }" styleClass="#{ownershipHistoryControllerBean.portletRequest ?'ownershipcursor' : ''}"/>
						<h:outputLabel value="#{msg['portlet.ownershipHist.business']}" rendered="#{null != item.organizationNM && not empty item.organizationNM }"  styleClass="#{ownershipHistoryControllerBean.portletRequest ?'ownershipcursor' : ''}"/>
					</td>
					<td class="columnStyle1" width="15%">
						<h:outputLabel  value="#{item.role}"  styleClass="#{ownershipHistoryControllerBean.portletRequest ?'ownershipcursor' : ''}"/>										
					</td>
					<td class="columnStyle1" width="30%">
						<h:outputLabel value="#{item.displayExpirationDate}" rendered="#{null != item.expirationDate && not empty item.expirationDate }"  styleClass="#{ownershipHistoryControllerBean.portletRequest ?'ownershipcursor' : ''}"/>	
						<h:outputLabel value="---" rendered="#{(null == item.expirationDate ||  empty item.expirationDate) && null != item.displayNameFormat && not empty item.displayNameFormat}"  styleClass="#{ownershipHistoryControllerBean.portletRequest ?'ownershipcursor' : ''}"/>																			
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<br/>
	</c:if>
	<c:if test="${!ownershipHistoryControllerBean.containsData and null != vin and null != vin.vinNumber and not empty vin.vinNumber}">
		
		<h:outputLabel value="#{msg['portlet.ownershipHist.errMsg1']} #{vin.vinNumber} #{msg['portlet.ownershipHist.errMsg2']}" style="color: red;"></h:outputLabel>
		
	</c:if>
</h:form>
<script>
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("ownershipHistoryControllerBean");
%>
var ownHistPage = document.getElementById('ASMPortal_Ownership_History');
if('<%=tasTab.containsResult()%>'=='true' && ownHistPage && singleView)
	ownHistPage.innerHTML = "<font color='yellow'><u>" + ownHistPage.innerHTML + "</u></font>";	
</script>
<style>
.tableStyle{
	width: 70%; 
	border-top: 2px solid black; 
	vertical-align: middle; 
	text-align: center;
}
.rowStyle{
	background-color:#e8e8e8;
}
.columnStyle2{
	border-left: 2px solid black;
}

.columnStyle1bold{
	border-right: 2px solid black; 
	border-bottom: 2px solid black;
	font-weight:bold;
}
.columnStyle1{
	border-bottom: 2px solid black;
	border-right: 2px solid black;
}
.ownershipcursor {
	cursor: pointer;
}

.ownershiprow:hover {
	background-color: #c4d5ef;
	cursor: pointer;
}
</style>
