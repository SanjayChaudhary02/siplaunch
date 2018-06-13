<%@page import="javax.portlet.PortletRequest"%>
<%@page import="javax.faces.context.ExternalContext"%>
<%@page import="javax.faces.context.FacesContext"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />


<style type="text/css">
.renderEDAlertDiv{
	color: darkorange;
	padding-left: 8px;
	padding-top: 5px; 
	padding-bottom: 2px;
}
.warningAndIndicator{
	text-decoration: underline;
	font-weight: bold;
}
.AlertEDBrdr {
	background-color: #357EC7;
	border-collapse: collapse;
	width:100%;
}

.AlertEDBrdr td {
	background-color: #fff;
	border: 1px solid #85BDEB;
	border-right: none;
}

.AlertEDBrdr td:first-child {
	border-left: none;	
}	

.EDclass1 {
	height: 64px;
	width: 15%;
	text-align:center;
}

.EDclass2 {
	height: 64px;
	width: 85%;
	padding-left: 5px;
}

.EDclass21{
	word-wrap: break-word;
	white-space: normal;
}

.EDclass3 {
	text-align: left;
	font-weight: bold;
	padding-left: 10px;
	padding-bottom: 5px;
	padding-top: 5px;
}

.vehicleEDAlertoverlay {
	display: none;
	position: absolute;
	float: right;
	background-color: #ffffff;
	background-size: 200 px;
	font: 12px arial;
	left: 31%;
	top: 15%;
	white-space: nowrap;
/* 	border:1px solid #85BDEB; */
}

.vehicleEDAlertoverlayPrint{
	font: 12px arial;
	width: 100%;
	white-space: nowrap;
	border:1px solid #85BDEB;
	border-bottom: none;
}
#vehicleEDAlerts{
	border-bottom: none;
}
</style>
<h:panelGroup layout="block" id="vehicleEDAlertsDiv"
	styleClass="vehicleEDAlertoverlayPrint">
	<div id="vehicleEDAlerts">
		<div class="renderEDAlertDiv">
			<h:outputLabel styleClass="warningAndIndicator"	value="#{msg['portlet.ed.dashalert.warning']}" />
			<c:if test="${edDashboardALertControllerBean.showWarningList or not empty edDashboardALertControllerBean.edDashboardAlertVO.wngLastUpdateTime}">
				
				<h:outputLabel style="padding-right:1px;" value="#{msg['portlet.ed.dashalert.note1']}"/>
				&nbsp;<h:outputText	value="#{edDashboardALertControllerBean.edDashboardAlertVO.wngLastUpdateTime}" />
				<h:panelGroup rendered="#{null!=edDashboardALertControllerBean.edDashboardAlertVO.lastKnownMileage and edDashboardALertControllerBean.edDashboardAlertVO.lastKnownMileage!=''}">
					@ <h:outputText value="#{edDashboardALertControllerBean.edDashboardAlertVO.lastKnownMileage}" /><h:outputLabel value="#{msg['portlet.ed.dashalert.note2']}"/>
				</h:panelGroup>
				)
			</c:if>
		</div>
		<c:choose>
			<c:when test="${edDashboardALertControllerBean.showWarningList}">
				<h:dataTable cellspacing="0" cellpadding="0"
					styleClass="AlertEDBrdr" var="edAlertVar" border="0"
					columnClasses="EDclass1,EDclass2"
					value="#{edDashboardALertControllerBean.edDashboardAlertVO.warningList}">
					<h:column>
						<h:graphicImage rendered="#{null!=edAlertVar.warningIcon and edAlertVar.warningIcon!=''}"
							value="#{edDashboardALertControllerBean.edDashboardAlertVO.deviceURL}#{edAlertVar.warningIcon}" 
   							height="64" width="64"></h:graphicImage> 
					</h:column>
					<h:column>
						<div class="EDclass21" style="font-weight: bold;">
							<h:outputText value="#{edAlertVar.warningCode}" />
							(
							<h:outputText value="#{edAlertVar.warningDesc}" />
							)
						</div>
						<div class="EDclass21">
							<h:outputText value="#{edAlertVar.warningOwnersManual}" />
						</div>
						<div style="font-style: italic;">
							<h:outputLabel value="#{msg['portlets.label.date']}:"/>
							<h:outputText value="#{edAlertVar.warningDcmTime}" />
							<h:panelGroup rendered="#{null!=edAlertVar.warningMileage and edAlertVar.warningMileage!=''}">
								@ <h:outputText value="#{edAlertVar.warningMileage}" /> miles
							</h:panelGroup>
						</div>
					</h:column>
				</h:dataTable>
			</c:when>
			<c:otherwise>
				<table class="AlertEDBrdr" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td class="EDclass3"><h:outputLabel value="#{msg['portlet.ed.dashalert.warning.desc']}" /></td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>

		<div class="renderEDAlertDiv">
			<h:outputLabel styleClass="warningAndIndicator" value="#{msg['portlet.ed.dashalert.indicator']}"></h:outputLabel> 
			<c:if test="${edDashboardALertControllerBean.showQuantEngineOil || edDashboardALertControllerBean.showSmartKeyBat || edDashboardALertControllerBean.showEngineOilDegrade || (not empty edDashboardALertControllerBean.edDashboardAlertVO.indicatorMostRecentDate)}">
				<h:outputLabel style="padding-right:1px;" value="#{msg['portlet.ed.dashalert.note1']}"/>
				&nbsp;<h:outputText value="#{edDashboardALertControllerBean.edDashboardAlertVO.indicatorMostRecentDate}" />)
			</c:if>
		</div>
		<table class="AlertEDBrdr" border="0" cellspacing="0"
			cellpadding="0">
			<tbody>
				<c:choose>
					<c:when
						test="${!edDashboardALertControllerBean.showQuantEngineOil && !edDashboardALertControllerBean.showSmartKeyBat && !edDashboardALertControllerBean.showEngineOilDegrade}">
						<tr>
							<td class="EDclass3"><h:outputLabel value="#{msg['portlet.ed.dashalert.indicator.desc']}"/></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:if test="${edDashboardALertControllerBean.showQuantEngineOil}">
							<tr>
								<td class="EDclass1">
									<h:graphicImage rendered="#{null!=edDashboardALertControllerBean.edDashboardAlertVO.qtyOfEngOilIcon and edDashboardALertControllerBean.edDashboardAlertVO.qtyOfEngOilIcon!=''}"
										value="#{edDashboardALertControllerBean.edDashboardAlertVO.qtyOfEngOilIcon}" 
			   							height="40" width="40"></h:graphicImage> 
								</td>
								<td class="EDclass2">
									<div style="font-weight: bold;" class="EDclass21">
										<h:outputLabel value="#{msg['portlet.ed.dashalert.indicator.quant']}" />
									</div>
									<div class="EDclass21">
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.qtyOfEngOilDesc}" />
									</div>
									<div style="font-style: italic;">
										<h:outputLabel value="#{msg['portlets.label.date']}:" />
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.qtyOfEngOilLastUpdTime}" />
									</div>
								</td>
							</tr>
						</c:if>
						<c:if test="${edDashboardALertControllerBean.showSmartKeyBat}">
							<tr>
								<td class="EDclass1">
									<h:graphicImage rendered="#{null!=edDashboardALertControllerBean.edDashboardAlertVO.smartKeyBatIcon and edDashboardALertControllerBean.edDashboardAlertVO.smartKeyBatIcon!=''}"
										value="#{edDashboardALertControllerBean.edDashboardAlertVO.smartKeyBatIcon}" 
			   							height="40" width="40"></h:graphicImage> 
								</td>
								<td class="EDclass2">
									<div style="font-weight: bold;" class="EDclass21">
										<h:outputLabel value="#{msg['portlet.ed.dashalert.indicator.smart']}" />
									</div>
									<div class="EDclass21">
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.smartKeyBatDesc}" />
									</div>
									<div style="font-style: italic;">
										<h:outputLabel value="#{msg['portlets.label.date']}:" />
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.smartKeyBatLastUpdTime}" />
									</div>
								</td>
							</tr>
						</c:if>
						<c:if
							test="${edDashboardALertControllerBean.showEngineOilDegrade}">
							<tr>
								<td class="EDclass1">
									<h:graphicImage rendered="#{null!=edDashboardALertControllerBean.edDashboardAlertVO.replaceEngOilIcon and edDashboardALertControllerBean.edDashboardAlertVO.replaceEngOilIcon!=''}"
										value="#{edDashboardALertControllerBean.edDashboardAlertVO.replaceEngOilIcon}" 
			   							height="40" width="40"></h:graphicImage> 
	   							</td>
								<td class="EDclass2">
									<div style="font-weight: bold;" class="EDclass21">
										<h:outputLabel value="#{msg['portlet.ed.dashalert.indicator.degrade']}" />
									</div>
									<div class="EDclass21">
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.replaceEngOilDesc}" />
									</div>
									<div style="font-style: italic;">
										<h:outputLabel value="#{msg['portlets.label.date']}:" />
										<h:outputText
											value="#{edDashboardALertControllerBean.edDashboardAlertVO.replaceEngOilLastUpdTime}" />
									</div>
								</td>
							</tr>
						</c:if>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</h:panelGroup>