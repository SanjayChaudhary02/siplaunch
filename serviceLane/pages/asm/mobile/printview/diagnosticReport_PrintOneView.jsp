<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://www.extremecomponents.org" prefix="ec" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />


<render:pageUrl var="diagnosticPageUrl" pageLabel="ASMPortal_portal_page_Display_One_view" scope="request" >
</render:pageUrl>
<c:set var="diagnosticControllerBean" scope="request" value="${diagnosticReportControllerBean}"/>
<c:set var="milSessionsVO" scope="request" value="${diagnosticReportControllerBean.milSessionsVO}"/>
<c:set var="milSessionsList" scope="request" value="${diagnosticReportControllerBean.milSessionsVO.milSessionsList}"/> 

<c:if test="${milSessionsList != null}">	
	
	<h:panelGroup rendered="#{not empty diagnosticReportControllerBean.vinVO && 
					not empty diagnosticReportControllerBean.vinVO.vinNumber && !diagnosticReportControllerBean.milSessionsVO.milSessionListEmpty}">
		<ec:table 
			items="milSessionsList"
			action="${pageScope.diagnosticPageUrl}"
			imagePath="${pageContext.request.contextPath}/resources/images/table/*.gif"
			showPagination="false"  filterable="false" styleClass="grid" var="milSessionInfo"  autoIncludeParameters="false">
			<ec:row>
				<ec:column property="connectionTime"  width="13%" sortable="false">
					<a onclick="return false;" style="color:#3333ff;font-weight: bold; cursor: default;">${pageScope.milSessionInfo.connectionTime}</a>
				</ec:column>
				
				<ec:column style="color:blue;" property="dealerCode" width="8%" sortable="false"/>
				<ec:column style="color:blue;" property="dealerName" width="22%" sortable="false"/>
			</ec:row>
		</ec:table>
	</h:panelGroup>
</c:if>
	<h:panelGroup rendered="#{not empty diagnosticReportControllerBean.vinVO && 
					not empty diagnosticReportControllerBean.vinVO.vinNumber && diagnosticReportControllerBean.milSessionsVO.milSessionsList ==null}">
		<h:outputLabel value="#{msg['portlets.error.vinsearch.general']}"></h:outputLabel>
	</h:panelGroup>
	<h:panelGroup rendered="#{not empty diagnosticReportControllerBean.vinVO && 
					not empty diagnosticReportControllerBean.vinVO.vinNumber && diagnosticReportControllerBean.milSessionsVO.milSessionListEmpty}">
		<h:outputLabel value="#{msg['portlets.description.nowarrantyinformation']}">:&nbsp;</h:outputLabel>
		<h:outputText value="#{vin.vinNumber}" style="font-weight : bold"></h:outputText>
	</h:panelGroup>
	
