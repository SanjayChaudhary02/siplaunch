<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"%>
<%@ page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />

<style type="text/css">
.telematictbl_wrapper
	{
	width:100%;
	background-color:white;
	font-family: Verdana,Arial,Helvetica,sans-serif;
	font-size: 11px;
	text-align: center;
	}
	.telematics_tbl
	{
	background-color:white;
	font-family: Verdana,Arial,Helvetica,sans-serif;
	font-size: 11px;
	width:47.5%;
	padding:3px;
	vertical-align: top;
	}
	.tableBorder {
	border-collapse: collapse;
	border-spacing: 0px;
	}
	
	.telematicsHeader{
		BORDER-TOP: #000000 2px solid;
		BORDER-LEFT: #000000 2px solid; 
		BORDER-RIGHT: #000000 2px solid;
		border-bottom:2px solid #000000;
		text-align: center;
		padding: 3px 3px; 
	}
/* 	.telematicsHeader img{ */
/* 		width:20%; */
/* 	} */
	.headerRowStyle{
		text-align: left;
		padding-left: 25px;
	}
	.headerlabel{
		font-size: 15px;
		font-weight: bold;
		text-decoration: underline;
	}
	.orangeBg{ 
	 	background-color: #FFDD99;
	 	border : 1px solid black;
	 	font-size: 11px;
	 	font-family: Verdana,Arial,Helvetica,sans-serif;
	 	width:100%;
	 	text-align: left;
	 	padding: 3px;
	 	
	 	
	}
	.orangeBg td:nth-last-child(1) {
		text-align: right;
	}
	.orangeBg td:nth-last-child(2){
		text-align: center;
	}
	.text-right-align{
		text-align: right;
	}
	.bea-portal-book-page{
	    padding: 0px;
	    font-family: Verdana, Arial, Helvetica, sans-serif; 
	    font-size: 11px small;
	    font-weight: normal;
	    text-decoration: none; 
	    color: #000000;
	}
	.highlight-vhr-row:hover
	{
		background-color:rgb(188,218,241);
		cursor: pointer;
	}
	.telematicsHeader_warning{
		width: 185px;
	}
</style>	
	

	<div align="center" style="color: red; font-size: 17px;">
		<h:outputLabel rendered="#{vehicleHealthReportControllerBean.noDataAvailable}"  value="#{msg['portlet.vhr.no.data']}"></h:outputLabel>
	</div>
	<!--  <table style="width: 100%">
		<tr>
			<td>
				<h:panelGrid columns="3" styleClass="orangeBg">
					<h:column>
						<h:outputLabel style="font-weight: bold;" value="#{msg['portlet.vhr.diagnostic.capable']} "></h:outputLabel>
						<h:outputText value="#{vehicleHealthReportControllerBean.telematicSubscriptionIndicatorVO.diagnosticCapableIndicator}"></h:outputText>
					</h:column>
					<h:column>
						<h:outputLabel style="font-weight: bold;" value="#{msg['portlet.vhr.diagnostic.opted']} "></h:outputLabel>
						<h:outputText value="#{vehicleHealthReportControllerBean.telematicSubscriptionIndicatorVO.diagnosticOptedIn}"></h:outputText>
					</h:column>
					<h:column>
						<h:outputLabel style="font-weight: bold;" value="#{msg['portlet.vhr.diagnostic.transmit']} "></h:outputLabel>
						<h:outputText value="#{vehicleHealthReportControllerBean.telematicSubscriptionIndicatorVO.diagnosticActive}"></h:outputText>
					</h:column>
				</h:panelGrid> 
			</td>
		</tr>
	</table>-->
	<c:choose>
		<c:when test="${vehicleHealthReportControllerBean.showFlatTire}">
		 	<h:panelGroup style=" font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;" styleClass="bea-portal-book-page">
				<table style="width: 100%;" class="panelStyle">
					<tr>
						<td style="width: 100%">
							<f:subview id="guestInfoErrorSubView">
								<jsp:include page="/resources/jsp/sLaneAppError.jsp" />
							</f:subview>
						</td>
					</tr>
				</table>
			</h:panelGroup>
		</c:when>
		<c:otherwise>
			<table style="width: 100%">
				<tr>
					<td>
						<h:panelGrid columns="2" style="width:100%;">
							<h:column>
								<c:choose>
									<c:when test="${!vehicleHealthReportControllerBean.noDataAvailable && !vehicleHealthReportControllerBean.vhrListException}">
										<h:outputLabel style="font-weight: bold;" value="#{msg['portlet.vhr.report.type']}:"></h:outputLabel>&nbsp;
										<h:outputLabel style="font-weight: bold;" value="ALL"></h:outputLabel>
										
									</c:when>
									<c:otherwise>
										<div style="margin-right: 180px;"></div>
									</c:otherwise>
								</c:choose>
								
							</h:column>
							
							<h:column>
								
							</h:column>
						</h:panelGrid>
					</td>
				</tr>
			</table>
			<c:if test="${!vehicleHealthReportControllerBean.noDataAvailable && !vehicleHealthReportControllerBean.noFilteredDataAvailable && !vehicleHealthReportControllerBean.vhrListException}">
				<table cellspacing="0" cellpadding="0" width="100%" class="tableBorder">
					<tr  style="background-color:#e8e8e8;">
						<td class="telematicsHeader" style="font-weight: bold;" width="14%">
							<h:outputLabel value="#{msg['portlet.vhr.generation.date']}" />
						</td>
						<td  class="telematicsHeader" style="font-weight: bold;" width="5%">
							<h:outputLabel value="#{msg['portlet.vhr.mileage']}" />
						</td>
						<td  class="telematicsHeader" style="font-weight: bold;" width="20%">
							<h:outputLabel value="#{msg['portlet.vhr.warning']}" />										
						</td>
						<td  class="telematicsHeader" style="font-weight: bold;" width="13%">
							<h:outputLabel value="#{msg['portlet.vhr.smart.key']}" /><sup>*</sup>										
						</td>
						<td class="telematicsHeader" style="font-weight: bold;" width="13%">
							<h:outputLabel value="#{msg['portlet.vhr.engine.oil.quant']}" /><sup>*</sup>										
						</td>
						<td class="telematicsHeader" style="font-weight: bold;" width="13%">
							<h:outputLabel value="#{msg['portlet.vhr.engine.oil.deg']}" /><sup>*</sup>									
						</td>
						<td  class="telematicsHeader" style="font-weight: bold;" width="8%">
							<h:outputLabel value="#{msg['portlet.vhr.report.type']}" />										
						</td>
						<td  class="telematicsHeader" style="font-weight: bold;" width="14%">
							<h:outputLabel value="#{msg['portlet.vhr.generated.type']}" />										
						</td>
					</tr>
			
					<c:forEach items="#{vehicleHealthReportControllerBean.vhrListVOS.vhrVOS}" var="vhrVO">
						<tr>
							<td  class="telematicsHeader" width="14%">
								<h:outputLabel value="#{vhrVO.vhrGenerationTime}" />
							</td>
							<td  class="telematicsHeader" width="5%">
								<h:outputLabel value="#{vhrVO.mileage}" />
							</td>
							<td  class="telematicsHeader" width="20%">
								<c:forEach items="${vhrVO.warningList}" var="wngCode" varStatus="status">
									<label>${wngCode.warningCode}${status.count lt fn:length(vhrVO.warningList)?',':''}</label>
								</c:forEach>
							</td>
							<td  class="telematicsHeader" width="13%">
								<h:graphicImage rendered="#{null!=vhrVO.smartKeyBatIcon and vhrVO.smartKeyBatIcon!=''}" url="#{vhrVO.smartKeyBatIcon}"></h:graphicImage>
							</td>
							<td  class="telematicsHeader" width="13%">
								<h:graphicImage rendered="#{null!=vhrVO.qtyOfEngOilIcon and vhrVO.qtyOfEngOilIcon!=''}" url="#{vhrVO.qtyOfEngOilIcon}"></h:graphicImage>
							</td>
							<td  class="telematicsHeader" width="13%">
								<h:graphicImage rendered="#{null!=vhrVO.replaceEngOilIcon and vhrVO.replaceEngOilIcon!=''}" url="#{vhrVO.replaceEngOilIcon}"></h:graphicImage>
							</td>
							<td  class="telematicsHeader" width="8%">
								<h:outputLabel value="#{vhrVO.vhrType}" />
							</td>
							<td  class="telematicsHeader" width="14%">
								<h:outputLabel value="#{vhrVO.vhrGeneratorType}" />
							</td>
						</tr>			
					</c:forEach>
		 		</table>	
	 		</c:if>	
		 	<c:if test="${vehicleHealthReportControllerBean.vhrListException}">
		 		<h:outputLabel style="font-weight: bold;" value="#{vehicleHealthReportControllerBean.vhrExceptionMessage}" />
		 	</c:if>
		</c:otherwise>
	</c:choose>
	<div style="padding-top: 10px;padding-bottom: 10px;">
	<c:if test="${!vehicleHealthReportControllerBean.noDataAvailable && !vehicleHealthReportControllerBean.noFilteredDataAvailable && !vehicleHealthReportControllerBean.vhrListException}">
		<b>*</b>&nbsp;&nbsp;&nbsp;&nbsp;<h:outputText value="#{msg['portlet.vhr.equipped.msg']}" />
	</c:if>
	</div>
	<label style="font-decoration: none; font-weight: bold; color:blue;">Service Connect Alert History</label>