<%@page import="com.tms.t3.common.web.SiteInfo"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ taglib uri="http://www.extremecomponents.org" prefix="ec" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"%>
<script src="${facesContext.externalContext.requestContextPath}/framework/skins/t3/js/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="/serviceLane/pages/asm/dtc/dtc.css"/>
<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/serviceLane/pages/asm/dtc/dtcJS.js"></script>




<link href="${facesContext.externalContext.requestContextPath}/resources/css/extremecomponents.css" rel="stylesheet" type="text/css"/>
<link href="${facesContext.externalContext.requestContextPath}/resources/css/tablegrid.css" rel="stylesheet" type="text/css"/>
<render:pageUrl var="dtcPageUrl" pageLabel="<%=Constants.PAGE_ASM_DTC_HISTORY %>" scope="request" >
</render:pageUrl>

<c:set var="dtcControllerBean" scope="request" value="${dtcControllerBean}"/>
<c:set var="milSessionsVO" scope="request" value="${dtcControllerBean.dtcHistoryVO}"/>
<c:set var="milSessionsList" scope="request" value="${dtcControllerBean.dtcHistoryVO.dtcDetailsList}"/> 


<c:if test="${milSessionsList != null}">
	<h:panelGroup rendered="#{not empty dtcControllerBean.vinVO && 
					not empty dtcControllerBean.vinVO.vinNumber && not dtcControllerBean.dtcHistoryVO.dtcListEmpty}">
		<div>
			<h:panelGroup rendered="#{dtcControllerBean.reprogrammingHistoryCount > 0 }">
				
					<h:outputText  value="Reprogramming History " style="color:blue; font-weight:bold; font-size:15px;"></h:outputText>
					<h:graphicImage style="height:40px;vertical-align:bottom;" url="/resources/images/reprogrammingHistory.jpg"></h:graphicImage>
				
			</h:panelGroup>
		</div>
		<ec:table 
			items="milSessionsList"
			action="${pageScope.dtcPageUrl}"
			imagePath="${pageContext.request.contextPath}/resources/images/table/*.gif"
			rowsDisplayed="${dtcControllerBean.paginationSize}"
			showPagination="false"
			filterable="false" styleClass="grid" var="milSessionInfo"  autoIncludeParameters="false">
			
			<ec:row >
				<ec:column property="serial"  width="2%" sortable="false" title="#">
					${pageScope.milSessionInfo.serial}
				</ec:column>
				<ec:column property="connectionTime"  width="20%" sortable="false">
					<a  style="color:#3333ff;font-weight: bold;" onclick="return false;">${pageScope.milSessionInfo.connectionTime}</a>
				</ec:column>
				<ec:column property="version"  width="5%" sortable="false">
					${pageScope.milSessionInfo.version}
				</ec:column>
				<ec:column property="formattedDealer" width="15%" sortable="false" title="Dealer">
					<c:if test="${pageScope.milSessionInfo.formattedDealer != null && not empty pageScope.milSessionInfo.formattedDealer}">
						<a  style="color:#3333ff;font-weight: bold;" onclick="return false;">${pageScope.milSessionInfo.formattedDealer}</a>
					</c:if>
					<c:if test="${pageScope.milSessionInfo.formattedDealer == null ||  empty pageScope.milSessionInfo.formattedDealer}">
						${pageScope.milSessionInfo.dealerCode}
					</c:if>
				</ec:column>
				<ec:column property="mileage"  width="6%" sortable="false">
					
						${pageScope.milSessionInfo.mileage}
					
				</ec:column>
				<ec:column property="initialHC"  width="5%" sortable="false" title="Initial HC">
					${pageScope.milSessionInfo.initialHC}
				</ec:column>
				<ec:column property="userHC"  width="5%" sortable="false" title="User HC">
					${pageScope.milSessionInfo.userHC}
				</ec:column>
				<ec:column property="systemDTC"  width="5%" sortable="false" title="System DTC">
					${pageScope.milSessionInfo.systemDTC}
				</ec:column>
				<ec:column property="dtcMapInfoList"  width="25%" sortable="false" title="DTCs (links show stored FFD)">
					<c:if test="${ fn:length(pageScope.milSessionInfo.dtcMapInfoList) gt 0  }">
						<c:forEach items="${pageScope.milSessionInfo.dtcMapInfoList}" var="dtcList"  varStatus="status">
							<c:if test="${dtcList.objMilLogId == null}">${dtcList.trucDtcCode}${status.count lt fn:length(pageScope.milSessionInfo.dtcMapInfoList)?', ':''} </c:if>
							<c:if test="${dtcList.objMilLogId != null}"><a style="color:blue;font-weight:bold;" onclick="return false;">${dtcList.trucDtcCode}${status.count lt fn:length(pageScope.milSessionInfo.dtcMapInfoList)?',':''}</a></c:if>
						</c:forEach>
					</c:if>
					<c:if test="${ fn:length(pageScope.milSessionInfo.dtcMapInfoList) eq 0  }">
						&nbsp;
					</c:if>
				</ec:column>
				<ec:column property="dataList"  width="15%" sortable="false" title="Data List">
					${pageScope.milSessionInfo.dataList}
				</ec:column>
			</ec:row>
		</ec:table>
	</h:panelGroup>
	<div>
	<br/>
    <table width="100%">
        <tr>
            <td style="font-size:8pt;"><b>P</b> - Powertrain System&nbsp;&nbsp;&nbsp;&nbsp;<b>B</b> - Body System&nbsp;&nbsp;&nbsp;&nbsp;<b>C</b> - Chassis System&nbsp;&nbsp;&nbsp;&nbsp;<b>HC</b> - Health Check
        </tr>
    </table>
	</div>
	
	</c:if>

	<h:panelGroup rendered="#{not empty dtcControllerBean.vinVO && 
					not empty dtcControllerBean.vinVO.vinNumber  && dtcControllerBean.showPage && (dtcControllerBean.dtcHistoryVO == null || (dtcControllerBean.dtcHistoryVO != null && empty dtcControllerBean.dtcHistoryVO.dtcDetailsList)) }">
		<h:outputLabel value="#{msg['portlets.description.nowarrantyinformation']}">:&nbsp;</h:outputLabel>
		<h:outputText value="#{vin.vinNumber}" style="font-weight : bold"></h:outputText>
	</h:panelGroup>
	<h:panelGroup rendered="#{not empty dtcControllerBean.vinVO && 
					not empty dtcControllerBean.vinVO.vinNumber && dtcControllerBean.exception }" style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page">
		
			
											<table style="width:100%;" >
											<tr>
											<td style="width:100%">
											<f:subview id="dtcErrorSubView">
												<jsp:include
													page="/resources/jsp/sLaneAppError.jsp">
												</jsp:include>
											</f:subview>
											</td>
											</tr>
											</table>
			
	</h:panelGroup>


