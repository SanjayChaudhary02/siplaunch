<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"%>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />
	
<style type="text/css">

.mTable{
	width : 100%;
	border : 1px solid black;
	border-collapse : collapse;
	font-size: 11px;
	text-align: center;
}


.mTableInner td{
	border-top: 1px solid black;
	border-left: 1px solid black;
}
.mTableInner tr:FIRST-CHILD td{
	border-top:none;
}

.mTableInner td:FIRST-CHILD{
	border-left:none;
}

.fontBoldStyle{
	font-weight: bold;
	text-align: center;
}

.miraiPanel {
	position: absolute;
	border: 2px solid #6B85A9;
	width: 140px;
	padding: 2px;
	position: absolute;
	z-index: 100;
	visibility: hidden;
	color: black;
	top: 10px;
	left: 50px;
	background-color: white;
	layer-background-color: #C0C0C0;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=gray, direction=135)
 }



</style>
<h:form id="miraiSwapForm">
<c:if test="${not empty vin && not empty vin.vinNumber}">
	<table style="width: 100%;">
		
		<tr style="width: 100%">
			<td style="text-align: center;" width="100%"><h:outputLabel value="#{msg['portlets.miraiSwap.title']}" styleClass="fontBoldStyle"></h:outputLabel></td>
		</tr>
		
			
		<c:if test="${null != vinSearchResultVO and null != vinSearchResultVO.modelName and vinSearchResultVO.modelName != 'Mirai'}">
			<tr style="width: 100%;">
				<td style="text-align: center;" width="100%">
					<h:outputLabel value="#{msg['portlets.miraiSwap.notApplicable']}" styleClass="fontBoldStyle"></h:outputLabel>
					<h:outputLabel value="#{vin.vinNumber}" styleClass="fontBoldStyle"></h:outputLabel>
				</td>
			</tr>
		</c:if>
		<c:if test="${null != vinSearchResultVO and null != vinSearchResultVO.modelName and vinSearchResultVO.modelName == 'Mirai'}">
		
		<c:if test="${null == miraiSwapControllerBean.miraiData || null == miraiSwapControllerBean.miraiData.miraiSwapList}">
			<tr style="width: 100%">
				<td style="text-align: center;" width="100%">
					<h:outputLabel value="#{msg['portlets.miraiSwap.dataNotAvailable']}" styleClass="fontBoldStyle"></h:outputLabel>
					<h:outputLabel value="#{vin.vinNumber}" styleClass="fontBoldStyle"></h:outputLabel>
				</td>
			</tr>
		</c:if>
		
	</table>
	
	<br/>
		
		<c:if test="${null != miraiSwapControllerBean.miraiData && null != miraiSwapControllerBean.miraiData.miraiSwapList and not empty miraiSwapControllerBean.miraiData.miraiSwapList}">
			<table class="mTable" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr style="background: #ADADAD;">
					<td style="border: 1px solid black;padding-left: 3px;padding-right: 3px;padding-bottom: 3px;padding-top: 3px; ">
						<h:outputLabel value="#{msg['portlets.miraiSwap.year']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.effDate']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.expDate']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.status']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.daysRemaining']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.dealer']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.swap']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.pickupDates']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;">
						<h:outputLabel value="#{msg['portlets.miraiSwap.daysUsed']}" styleClass="fontBoldStyle"></h:outputLabel>
					</td>
				</tr>
			</thead>

			<c:forEach items="#{miraiSwapControllerBean.miraiData.miraiSwapList }" var="mirai" varStatus="loopStatus">
				<tr style="${loopStatus.index%2==0 ? 'background-color:#D3D3D3;':'background-color:white;'}">
					<td style="border: 1px solid black;padding-left: 3px;padding-right: 3px;padding-bottom: 3px;padding-top: 3px;">
						<h:outputLabel value="#{mirai.year}"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;white-space: nowrap;">
						<h:outputLabel value="#{mirai.effectiveDate }"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;white-space: nowrap;">
						<h:outputLabel value="#{mirai.expirationDate }"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;">
						<h:outputLabel value="#{mirai.status }"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;padding-bottom: 3px;padding-top: 3px;">
						<h:outputLabel value="#{mirai.daysRemaining }"></h:outputLabel>
					</td>
					<td style="border: 1px solid black;">
						<table class="mTableInner" style="font-size: 11px; width: 100%; height:100%; text-align: center;"
							cellspacing="0" cellpadding="0">
							<c:forEach items="#{mirai.claims }" var="claims">
								<tr>
									<td style="padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px; white-space: nowrap;">
										<a onclick="javascript:openLatestDealerCode('${claims.dealerCode }','${claims.rentalDate }','MM-dd-yyyy');return false;"><h:outputLabel value="#{claims.dealerName }(#{claims.dealerCode })" style="color:blue;"></h:outputLabel></a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>


					<td style="border: 1px solid black;">
						<table class="mTableInner" style="font-size: 11px; width: 100%; text-align: center;"
							cellspacing="0" cellpadding="0">
							<c:forEach items="#{mirai.claims }" var="claims">
								<tr>
									
									<td style="padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;white-space: nowrap;">
									
										<div id="miraiToolTip" class="miraiPanel"></div>
									
										<label  onmouseout="popUp(event,'miraiToolTip');" onmouseover="setMiraiToolTip('${claims.rentalVin}');popUp(event,'miraiToolTip');">${claims.rentalVinModelYear}${claims.rentalVinModel}</label>
									
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>

					<td style="border: 1px solid black;">
						<table class="mTableInner" style="font-size: 11px; width: 100%; text-align: center;"
							cellspacing="0" cellpadding="0">
							<c:forEach items="#{mirai.claims }" var="claims">

								<tr>
									<td style="padding-bottom: 3px;padding-top: 3px;padding-left: 3px;padding-right: 3px;white-space: nowrap;"><h:outputLabel value="#{claims.rentalDate }"></h:outputLabel></td>
								</tr>
							</c:forEach>
						</table>
					</td>



					<td style="border: 1px solid black;">
						<table class="mTableInner" style="font-size: 11px; width: 100%; text-align: center;"
							cellspacing="0" cellpadding="0">
							<c:forEach items="#{mirai.claims }" var="claims">

								<tr>
									<td style="padding-bottom: 3px;padding-top: 3px;"><h:outputLabel value="#{claims.rentalDaysUsed }"></h:outputLabel></td>
								</tr>
							</c:forEach>
						</table>
					</td>

				</tr>
			</c:forEach>

		</table>
	
		<table style="width: 100%;">
			<tr style="width: 100%;">
				<td style="text-align: center;" width="100%">
					<h:outputLabel value="#{msg['portlets.miraiSwap.screenNote']}" styleClass="fontBoldStyle"></h:outputLabel>
				</td>
			</tr>
		
		</table>
		</c:if>
	</c:if>
	</c:if>

</h:form>


<script type="text/javascript">

	function setMiraiToolTip(contentId) {
		document.getElementById("miraiToolTip").innerHTML = contentId;
		return true;
	}

</script>