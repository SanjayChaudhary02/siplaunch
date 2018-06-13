<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />
<style>
.colWidth_spec_1stCol{
	width: 26%;
	vertical-align: top;
}

.colWidth_spec_1stCol2ndRow{
	width: 26%;
	vertical-align: bottom;
}
.colWidth_spec{
	width: 25%;
	vertical-align: bottom;
}
.colWidth_spec label{font-weight: normal;}
.firstRow{
	width: 25%;
	vertical-align: top;
}
.2ndrow tr{
	vertical-align: bottom;
}
.specHelpPanel {
	position: absolute;
	border: 2px solid #6B85A9;
	width: 270px;
	padding: 2px;
	position: absolute;
	z-index: 100;
	visibility: hidden;
	color: black;
	top: 20px;
	left: 90px;
	background-color: white;
	layer-background-color: #ffffcc;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=gray, direction=135)
}
</style>
<h:form id="vehSpecificationForm" style="padding-bottom: 0px;">
<render:pageUrl var="fluidSpecPageUrl" pageLabel="<%=Constants.PAGE_ASM_FLUID_SPECIFICATION %>" forcedAmpForm="false">
</render:pageUrl>
<render:pageUrl var="ownersManualPageUrl" pageLabel="<%=Constants.PAGE_ASM_OWNERS_MANUAL %>" forcedAmpForm="false">
</render:pageUrl>
<div id="specHelpToolTipSpec" class="specHelpPanel"></div>	
	<h:panelGroup rendered="#{vehicleSpecControllerBean.vehicleSpecVO  != null}">
		<h:panelGrid columns="4" columnClasses="colWidth_spec_1stCol,firstRow,firstRow,firstRow" width="100%">
		
			<h:panelGroup rendered="#{vehicleSpecControllerBean.vehicleSpecVO != null}"  style="text-align: center;">
				<input id="gvwrHelpText"
					value="${msg['portlets.spechelp.Gvwr']}" type="hidden" />
				<h:graphicImage id="gvwrSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('gvwrHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.gvwr']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.gvwr}"/>
				<h:outputText value="#{msg['portlets.vehiclespec.gvwr.unit']}" rendered="#{!vehicleSpecControllerBean.vehicleSpecVO.gvwrEmpty}">&nbsp;</h:outputText>
			</h:panelGroup>			
			<h:panelGroup style="text-align: center;" >
				<input id="hpHelpText"
					value="${msg['portlets.spechelp.Hp']}" type="hidden" />
				<h:graphicImage id="hpSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('hpHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.hp']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.engineHP}"></h:outputText>
				<h:outputText value="hp" rendered="#{!vehicleSpecControllerBean.vehicleSpecVO.engineHPEmpty}">&nbsp;</h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<input id="fuelTankCapacityHelpText"
					value="${msg['portlets.spechelp.fuelTankCapacity']}" type="hidden" />
				<h:graphicImage id="fuelTankCapacitySpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('fuelTankCapacityHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.fueltankcapacity']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.fuelTankCapacity}"></h:outputText>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.fuelTankCapacityUnit}">&nbsp;</h:outputText>
			</h:panelGroup>
			
			<h:panelGroup style="text-align: center;">
				<h:outputLabel value="Trans Oil" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<c:if test="${vehicleInformationControllerBean.vehicleInformationVO.transOil != null}">
					<h:outputText value="#{vehicleInformationControllerBean.vehicleInformationVO.transOil != \"Info not available\" ? vehicleInformationControllerBean.vehicleInformationVO.transOil : \"N/A\"}"></h:outputText>
				</c:if>
				<h:outputLabel rendered="#{vehicleInformationControllerBean.vehicleInformationVO.transOil ==null}" 
					value="#{msg['portlets.label.fluidspecification']}" style="font-weight: bold;color: #4292CD;text-decoration:underline;"></h:outputLabel>
			</h:panelGroup>
			
			<h:panelGroup style="text-align: center;">
				<input id="coolantHelpText"
					value="${msg['portlets.spechelp.coolant']}" type="hidden" />
				<h:graphicImage id="coolantSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('coolantHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.coolant']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.coolant}" rendered="#{vehicleSpecControllerBean.vehicleSpecVO.coolant !=null}"></h:outputText>
				<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.coolant ==null}">
					<h:outputLink value="javascript:void(0);" 
									onclick="javascript:#{facesContext.viewRoot.id}_goToFluidSpecPage();" style="font-weight: bold;color: #4292CD;text-decoration:underline;">
						<h:outputText value="#{msg['portlets.label.fluidspecification']}" escape="false"/>
				</h:outputLink>
				</c:if>				
			</h:panelGroup>
		</h:panelGrid>
		<h:outputLabel value="" rendered="#{vehicleSpecControllerBean.vehicleSpecVO.dinghyTowEmpty}">&nbsp;</h:outputLabel>
		<h:panelGrid columns="4" columnClasses="colWidth_spec_1stCol2ndRow,colWidth_spec,colWidth_spec,colWidth_spec" width="100%" style="padding: 0px;" >
			<h:panelGroup style="text-align: center;">
				<input id="towingCapacityHelpText"
					value="${msg['portlets.spechelp.towingCapacity']}" type="hidden" />
				<h:graphicImage id="towingCapacitySpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('towingCapacityHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.towingcapacity']}" style="font-weight: bold;">*:&nbsp;</h:outputLabel>
				<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacity != 0}">
					<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacity}"></h:outputText>
					<h:outputLabel value="#{vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacityUnit}" rendered="#{not empty vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacityUnit}"> </h:outputLabel>
				</c:if>
				<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacity == 0}">
					<h:graphicImage  value="/resources/images/utils/TowingCapacity_NO.jpg"/>
				</c:if>
				
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<input id="dinghyTowHelpText"
					value="${msg['portlets.spechelp.dinghyTow']}" type="hidden" />
				<h:graphicImage id="dinghyTowSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('dinghyTowHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.dingytow']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.dinghyTow}"> </h:outputText>
				<h:graphicImage  value="/resources/images/utils/DinghyTow_YES.jpg" rendered="#{!vehicleSpecControllerBean.vehicleSpecVO.dinghyTowEmpty and vehicleSpecControllerBean.vehicleSpecVO.dinghyTowable}">&nbsp;&nbsp;&nbsp;&nbsp;</h:graphicImage>
				<h:graphicImage  value="/resources/images/utils/DinghyTow_NO.jpg" rendered="#{!vehicleSpecControllerBean.vehicleSpecVO.dinghyTowEmpty and !vehicleSpecControllerBean.vehicleSpecVO.dinghyTowable}"/>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<input id="fuelHelpText"
					value="${msg['portlets.spechelp.fuel']}" type="hidden" />
				<h:graphicImage id="fuelSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('fuelHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.fuel']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.fuelType}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup style="text-align: center;">
				<input id="cabinAirFilterHelpText"
					value="${msg['portlets.spechelp.cabinAirFilter']}" type="hidden" />
				<h:graphicImage id="cabinAirFilterSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipSpec');"
					onmouseover=" setSpecHelpVS('cabinAirFilterHelpText');popUp(event,'specHelpToolTipSpec');"
					onclick="return false;"></h:graphicImage>
				<h:outputLabel value="#{msg['portlets.vehiclespec.cabinairfilter']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.cabinAirFilter}" style="font-weight: normal"></h:outputText>
			</h:panelGroup>
		</h:panelGrid>
		<h:panelGrid columns="4" columnClasses="colWidth_spec_1stCol,colWidth_spec,colWidth_spec,colWidth_spec" width="100%" style="padding: 0px;" rowClasses="2ndrow">
			
			<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacity != 0}">
				<h:outputLabel value="#{vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacityComment}"></h:outputLabel>
			</c:if>
			
			<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withouttowingCapacity == 0}">
				<h:panelGroup>
					(<h:outputText value="#{msg['portlets.vehiclespec.towingcapacity.notrecommended']}"></h:outputText>)
				</h:panelGroup>
			</c:if>
			<h:panelGroup>
				<h:outputLabel value="#{msg['portlets.vehiclespec.refermanual1']}">&nbsp;</h:outputLabel>
				<h:outputLink title="Navigates to #{vinSearchResultVO.modelYear} #{vinSearchResultVO.division} #{vinSearchResultVO.modelName} Owner's Manual" value="javascript:void(0);" 
									onclick="javascript:#{facesContext.viewRoot.id}_goToOwnersManualPage();" style="font-weight: bold;color: #4292CD;text-decoration:underline;" rendered="#{specHelpAvailable.portletRequest}">
						<h:outputText value="#{msg['portlets.vehiclespec.ownermanual']}" escape="false"/>
				</h:outputLink>
				<h:outputLink title="Navigates to #{vinSearchResultVO.modelYear} #{vinSearchResultVO.division} #{vinSearchResultVO.modelName} Owner's Manual" value="javascript:void(0);" 
									onclick="return false;" style="font-weight: bold;color: #4292CD; cursor:default;text-decoration:underline;" rendered="#{!specHelpAvailable.portletRequest}">
						<h:outputText value="#{msg['portlets.vehiclespec.ownermanual']}" escape="false"/>
				</h:outputLink>
				<h:outputText value="#{msg['portlets.vehiclespec.refermanual2']}">&nbsp;</h:outputText>
			</h:panelGroup>
			<h:outputLabel></h:outputLabel>
			<h:outputLabel></h:outputLabel>
		</h:panelGrid>
		
		
		
		<h:panelGrid columns="4" columnClasses="colWidth_spec_1stCol2ndRow,colWidth_spec,colWidth_spec,colWidth_spec" width="100%" style="padding-left:11px;" >
			<h:panelGroup style="text-align: center;">
			
				<h:outputLabel value="#{msg['portlets.vehiclespec.withTowingcapacity']}" rendered="#{vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity!='Info not available'}" style="font-weight:bold;">:&nbsp;</h:outputLabel>
				<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity != 0 && vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity!='Info not available' }">
					<h:outputText value="#{vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity}"></h:outputText>
					<h:outputLabel value="#{vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacityUnit}" rendered="#{not empty vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacityUnit}"> </h:outputLabel>
				</c:if>
				<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity == 0}">
					<h:graphicImage  value="/resources/images/utils/TowingCapacity_NO.jpg"/>
				</c:if>
				
			</h:panelGroup>
		
		</h:panelGrid>
		
		
		<h:panelGrid columns="4" columnClasses="colWidth_spec_1stCol,colWidth_spec,colWidth_spec,colWidth_spec" width="100%" style="padding-left: 11px;" rowClasses="2ndrow">
			
			<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity != 0}">
				<h:outputLabel value="#{vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacityComment}"></h:outputLabel>
			</c:if>
			
			<c:if test="${vehicleSpecControllerBean.vehicleSpecVO.withTowingCapacity == 0}">
				<h:panelGroup>
					(<h:outputText value="#{msg['portlets.vehiclespec.towingcapacity.notrecommended']}"></h:outputText>)
				</h:panelGroup>
			</c:if>
		</h:panelGrid>
		
		
		
		
		
		
		
		
		<h:outputLabel value="">&nbsp;</h:outputLabel>
		
		
		
		
		
		
		
		
		
		
		
		<h:panelGrid columns="1" width="100%" >
			<h:panelGroup>
				<h:outputLabel value="#{msg['portlets.vehiclespec.note']}" style="font-weight: bold;">:&nbsp;</h:outputLabel>
				<h:outputLabel value="#{msg['portlets.vehiclespec.note.text1']}" escape="false" style="font-weight: normal;display: inline;">&nbsp;</h:outputLabel>
				<h:outputLink title="Navigates to #{vinSearchResultVO.modelYear} #{vinSearchResultVO.division} #{vinSearchResultVO.modelName} Owner's Manual" value="javascript:void(0);" 
									onclick="javascript:#{facesContext.viewRoot.id}_goToOwnersManualPage();" style="font-weight: bold;color: #4292CD;text-decoration:underline;" rendered="#{specHelpAvailable.portletRequest}">
						<h:outputText value="#{msg['portlets.vehiclespec.ownermanual']}" escape="false"/>
				</h:outputLink>
				<h:outputLink title="Navigates to #{vinSearchResultVO.modelYear} #{vinSearchResultVO.division} #{vinSearchResultVO.modelName} Owner's Manual" value="javascript:void(0);" 
									onclick="return false;" style="font-weight: bold;color: #4292CD; cursor:default;text-decoration:underline;" rendered="#{!specHelpAvailable.portletRequest}">
						<h:outputText value="#{msg['portlets.vehiclespec.ownermanual']}" escape="false"/>
				</h:outputLink><h:outputText value="." escape="false"></h:outputText>
				<h:outputText value="#{msg['portlets.vehiclespec.note.text3']}" escape="false"></h:outputText>
				
			</h:panelGroup>
		</h:panelGrid>	
	</h:panelGroup>
	<h:panelGroup rendered="#{not empty vehicleSpecControllerBean.vinVO.vinNumber  and vehicleSpecControllerBean.vehicleSpecVO == null}">
		<h:outputLabel value="#{msg['portlets.description.vehicleinformation']}">&nbsp;</h:outputLabel>
		<h:outputText value="#{vehicleSpecControllerBean.vinVO}" style="font-weight: bold;" />
	</h:panelGroup>	
</h:form>
<script type="text/javascript">
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("vehicleSpecControllerBean");
%>
var vehSpecPage = document.getElementById('ASMPortal_specifications');
if('<%=tasTab.containsResult()%>'=='true' && vehSpecPage && singleView)
	vehSpecPage.innerHTML = "<font color='yellow'><u>" + vehSpecPage.innerHTML + "</u></font>";
function setSpecHelpVS(contentId) {
	var contentText = '';
	var content = document.getElementById(contentId);
	contentText = content.value;
	var imageContent = "<img src='/serviceLane/resources/images/SpecHelp_ON.png' style='vertical-align: top;'></img> &nbsp;"
			+ contentText;
	document.getElementById("specHelpToolTipSpec").innerHTML = imageContent;
	return true;
}
function ${facesContext.viewRoot.id}_goToOwnersManualPage()
{
	var isPortletRequest = '${specHelpAvailable.portletRequest}';
	if(isPortletRequest == 'true'){
		var url = '${pageScope.ownersManualPageUrl}';
		window.open(url, "_self");
	}
	
}
function ${facesContext.viewRoot.id}_goToFluidSpecPage()
{
	var isPortletRequest = '${specHelpAvailable.portletRequest}';
	if(isPortletRequest == 'true'){
		var url = '${pageScope.fluidSpecPageUrl}';
		window.open(url, "_self");
	}
}
</script>