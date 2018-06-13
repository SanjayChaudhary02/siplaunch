<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg" />

<h:form id="mpgRatingsForm">
	
<div id="specHelpToolTipGovt" class="specHelpPanel"></div>
	<!-- Check if mpgRatingsVO is not null -->
    <c:if test="${mpgRatingsControllerBean.mpgRatingsVO != null}"> 	
	
		<!-- Begin of Safety Ratings -->
	    <c:set value="${mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo}" var="safetyRatingsInfo"></c:set>
	        
		<table class="ratingtbl_wrapper">
			
			<tr>
			<td class="rating_tbl">
		
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableBorder">
				<tr>
					<th colspan="2" style="padding:0px">
					<strong>
					<h:panelGroup style="text-align: center;">
				<input id="safetyRatingHelpText"
					value="${msg['portlets.spechelp.safetyRating']}" type="hidden" />
				<h:graphicImage id="safetyRatingSpecHelp" rendered="#{specHelpAvailable.specHelpNeeded && specHelpAvailable.portletRequest}" 
					url="/resources/images/SpecHelp_ON.png"
					onmouseout="popUp(event,'specHelpToolTipGovt');"
					onmouseover="setSpecHelpGovt('safetyRatingHelpText');popUp(event,'specHelpToolTipGovt');"
					onclick="return false;"></h:graphicImage>
					
					<h:outputLabel value="#{msg['portlets.govtratings.ncaprating']}" /></strong></th>
					</h:panelGroup>
				</tr>
			</table>
			<c:if test="${not empty safetyRatingsInfo}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableBorder">
					<tr style="vertical-align: center">
						<td style="padding:6px">
							<strong>
								<h:outputLabel value="#{msg['portlets.govtratings.overallscore']}" >&nbsp;</h:outputLabel>
							</strong>
							<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.overallCrash}" 
										rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.overallCrashPresent}"/>
							<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.overallCrash}" 
								rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.overallCrashPresent}"></h:outputText>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="tableBorder">
								<tr>
									<td colspan=2 style="border-left: 2px solid #BFBFB5;border-top: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;padding:3px 7px ">
										<strong><h:outputLabel value="#{msg['portlets.govtratings.frontalcrash']}" /></strong>
									</td>
									<td colspan=2 style="border-top: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;padding:3px 7px ">
										<strong><h:outputLabel value="#{msg['portlets.govtratings.sidecrash']}" /></strong>
									</td>
									<td rowspan=2 style="BORDER-TOP: #bfbfb5 2px solid;BORDER-LEFT: #bfbfb5 2px solid; BORDER-RIGHT: #bfbfb5 2px solid; padding:14px 0px;border-bottom:2px solid #BFBFB5;font-weight:bold">
										<h:outputLabel value="#{msg['portlets.govtratings.rollover']}" />										
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;padding:3px 7px">
										<h:outputLabel value="#{msg['portlets.govtratings.driver']}" />
									</td>
									<td style="padding: 3px 7px;border-bottom: 2px solid #BFBFB5;">
										<h:outputLabel value="#{msg['portlets.govtratings.passenger']}" />
									</td>
									<td style="border-left: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;padding:3px 7px">
										<h:outputLabel value="#{msg['portlets.govtratings.frontseat']}" />
									</td>
									<td style="padding: 3px 7px;border-bottom: 2px solid #BFBFB5;">
										<h:outputLabel value="#{msg['portlets.govtratings.rearseat']}" />
									</td>
								</tr>	
								<tr>
									<td style="border-left: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;padding:3px 3px 4px">
													<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashDriver}" 
															rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashDriverPresent}"/>
													<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashDriver}" 
															rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashDriverPresent}"/>
									</td>
									<td style="border-bottom: 2px solid #BFBFB5;padding:3px 3px 4px">
													<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashPassenger}" 
															rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashPassengerPresent}"/>
													<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashPassenger}" 
															rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.frontalCrashPassengerPresent}"/>
									</td>
									<td style="border-left: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;border-right: 2px solid #BFBFB5;padding:3px 3px 4px">
													<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashFrontSeat}" 
															rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashFrontPresent}"/>
													<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashFrontSeat}" 
															rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashFrontPresent}"/>
									</td>
									<td style="border-bottom: 2px solid #BFBFB5;padding:3px 3px 4px;">
													<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashRearSeat}" 
															rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashRearPresent}"/>
													<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashRearSeat}" 
															rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.sideCrashRearPresent}"/>
									</td>
									<td style="border-left: 2px solid #BFBFB5;padding: 3px 3px;border-right: 2px solid #BFBFB5;border-bottom: 2px solid #BFBFB5;">
										<h:graphicImage  value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.rolloverCrash}" 
												rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.rolloverCrashPresent}"/>
										<h:outputText value="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.rolloverCrash}" 
												rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo.rolloverCrashPresent}"/>
									</td>
								</tr>								
							</table>
						</td>
					</tr>
			</table>
		</c:if>
        <c:if test="${empty safetyRatingsInfo}">
        	<table  style="margin-top:2%;" cellpadding="0" cellpadding="0" width="100%" class="tableBorder">
        		<tr>
        			<td>&nbsp;</td>
        		</tr>
        		<tr>
        			<td style="text-align: center">
        				<h:outputLabel value="#{msg['portlets.govtratings.ncapratings.dataunavailable']}"></h:outputLabel>
        			</td>
        		</tr>
        	
        	</table>
        </c:if>
	    <!-- End of Safety Ratings -->
	        
		</td>
		
		<td class="separator" >
			<!--<img src="${facesContext.externalContext.requestContextPath}/resources/images/fuel/separator.png" alt="Toyota" />
		-->
		<h:graphicImage  value="/resources/images/fuel/separator.png" height="50%"
									rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo == null and 
										mpgRatingsControllerBean.mpgRatingsVO.vehMpgInfoVO ==null}"/>
			<h:graphicImage  value="/resources/images/fuel/separator.png" 
									rendered="#{mpgRatingsControllerBean.mpgRatingsVO.safetyRatingsInfo != null or 
										mpgRatingsControllerBean.mpgRatingsVO.vehMpgInfoVO !=null}"/>
		
		</td>
		
		<!-- Begin of Fuel Economy section -->
		<td class="milage_tbl" >
	        <f:subview id="fuelEconomySimple"
								rendered="#{!mpgRatingsControllerBean.mpgRatingsVO.vehMpgInfoVO.fuelTypeHybrid}">
					<jsp:include page="/pages/asm/govtratings/fuelEconomySimple.jsp"></jsp:include>
			</f:subview>
			<f:subview id="fuelEconomyHybrid"
								rendered="#{mpgRatingsControllerBean.mpgRatingsVO.vehMpgInfoVO.fuelTypeHybrid}">
					<jsp:include page="/pages/asm/govtratings/fuelEconomyHybrid.jsp"></jsp:include>
			</f:subview>
				
			</td>
		</tr>
		
		<!-- End of Fuel Economy section -->
		<tr>
			<td class="rating_tbl tbl_bottom" style="text-align: left">
				<h:outputLabel value="#{msg['portlets.govtratings.additionalinfo']}" >&nbsp;</h:outputLabel>
				<a href="http://www.safercar.gov" target="_blank">www.safercar.gov</a>
			</td>
			<td class="separator" style="padding-top: 0px">&nbsp;</td>
			<td class="milage_tbl tbl_bottom" style="text-align:center;padding-right:0px;">
				<h:outputLabel value="#{msg['portlets.govtratings.additionalinfo']}">&nbsp;</h:outputLabel>
				<a href="http://www.fueleconomy.gov" target="_blank">www.fueleconomy.gov</a>
			</td>
		</tr>
	</table>
</c:if>	
</h:form>
<style>
.ratingtbl_wrapper
{
width:100%;
background-color:white;
font-family: Verdana,Arial,Helvetica,sans-serif;
font-size: 11px;
text-align: center;
}
.rating_tbl,.milage_tbl
{
background-color:white;
font-family: Verdana,Arial,Helvetica,sans-serif;
font-size: 11px;
width:48.5%;
padding:5px;
vertical-align: top;
}
.separator
{
width:1%;
padding-top:3%;
}

.tableBorder {
border-collapse: collapse;
border-spacing: 0px;
}

.tbl_bottom
{
font-weight: bold;
font-size: 10px;
}
.electricity_only
{
width:48%;
vertical-align:top;
border:2px solid #e0e0e0;
padding-left:2px;
padding-right:2px;
padding-top:5px;
padding-bottom:5px;
}

.specHelpPanel{
 position: absolute;
 border:2px solid #6B85A9; 
 width:270px; padding:2px;
 position:absolute; z-index:100;
 visibility:hidden; color:black; top:20px;
 left:90px; background-color:white;
 layer-background-color:#ffffcc;
 filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135)
 }
 
</style>
<script type="text/javascript">
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("mpgRatingsControllerBean");
%>
var govPage = document.getElementById('ASMPortal_Gov_Rating');
if('<%=tasTab.containsResult()%>'=='true' && govPage && singleView)
govPage.innerHTML = "<font color='yellow'><u>" + govPage.innerHTML + "</u></font>";	
function setSpecHelpGovt(contentId){
	var contentText = '';
	
	var content = document.getElementById(contentId);
	contentText = content.value;
	
	
	var imageContent = "<img src='/serviceLane/resources/images/SpecHelp_ON.png' style='vertical-align: top;'></img> &nbsp;"+ contentText;
	document.getElementById("specHelpToolTipGovt").innerHTML = imageContent;
	return true;
}

</script>