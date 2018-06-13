<%@page import="com.tms.t3.library.web.tas.HasValueTab"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<script type="text/javascript">
var telematicSubscriptionContainer = '${facesContext.viewRoot.id}:telematicSubscriptionForm';
</script>

<h:form id="telematicSubscriptionForm">
<c:if test="${telematicSubscriptionControllerBean.vinVO.vinNumber != null && telematicSubscriptionControllerBean.vinVO.vinNumber != '' }">
<c:if test="${telematicSubscriptionControllerBean.brriEnabled && not telematicSubscriptionControllerBean.toyotaDealer}">
<!--  <table class="telematictbl_wrapper">
	<tr>
	<td class="telematics_tbl" width="80%">
		<table style="width:100%; align:center;">
			<tr>
			<td width="50%">
				<table style="width:100%; border:1px solid black; border-spacing:0;">
					<tr>
						<td width="33%" style="border-bottom : 1px solid black;">
						</td>
						<td width="33%" style="border-bottom : 1px solid black; align:center;">
							<h:outputText value="Service Connect" style="align:center;font-weight:bold; font-size:14px; color: #FA463F;"></h:outputText>
						</td>
						<td width="33%" style="border-bottom : 1px solid black;">
						</td>
					</tr>
					<tr bgcolor="#FFDD99">
						<td style="border:none;">
							<h:outputText value="Capable: " style="align:center; font-weight: bold;"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.telematicSubscriptionIndicatorVO.diagnosticCapableIndicator }"></h:outputText>
						</td>
						<td style="border:none;">
							<h:outputText value="Opted In: " style="align:center; font-weight: bold;"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.telematicSubscriptionIndicatorVO.diagnosticOptedIn }"></h:outputText>
						</td>
						<td style="border:none;">
							<h:outputText value="Transmitting: " style="align:center; font-weight: bold;"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.telematicSubscriptionIndicatorVO.diagnosticActive }"></h:outputText>
						</td>
					</tr>
				</table>
			</td>
			<td width="50%">
				<table style="width:100%; border: 1px solid black; border-spacing:0;">
					<tr>
						<td width="33%" style="border-bottom : 1px solid black;">
						</td>
						<td width="33%" style="border-bottom : 1px solid black; align:center;">
							<h:outputText value="Enform Remote" style="align:center; font-weight:bold; font-size : 14px; color:#FA463F;"></h:outputText>
						</td>
						<td width="33%" style="border-bottom : 1px solid black;">
						</td>
					</tr>
					<tr bgcolor="#FFDD99">
						<td style="border:none;">
							<h:outputText value="Capable: " style="align:center; font-weight: bold;"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.telematicSubscriptionIndicatorVO.remoteCapableIndicator }"></h:outputText>
						</td>
						<td style="border:none;">
						</td>
						<td style="border:none;">
							<h:outputText value="Opted In: " style="align:center; font-weight: bold;"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.telematicSubscriptionIndicatorVO.remoteOptedIn }"></h:outputText>
						</td>
					</tr>
				</table>
			</td>	
			</tr>
		</table>
	</td>
	</tr>
 </table>-->
</c:if>

<div style="padding-left:30px;padding-bottom : 20px;">

<div style="text-align:left; padding-bottom : 20px;">
	<h:outputLabel value="#{msg['portlets.telematicSubs.vehiclecapability']}" style="font-weight:bold; text-decoration: underline; font-size : 15px;font-family: Verdana,Arial,Helvetica,sans-serif;"></h:outputLabel>
</div>

<div style="padding-right:10px;">
<table style="width:99%;" class="tableBorder">
<tr>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;width:15%;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.appsuitecapable']}"></h:outputLabel>
	</td>
	<td class="telematicsHeader" style="text-align:center;width:25%;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.appSuiteCapable}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;width:15%;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.navigation']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;width:15%;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.navigation}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;width:15%;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.dynamiccommute']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;width:15%;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.dynamicCommute}
	</td>	
</tr>
<tr>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.safetycapable']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.safetyCapable}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.destinationassist']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.destinationAssist}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.dynamicmaproute']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.dynamicMaporRoute}
	</td>
</tr>

<tr>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.wificapable']}" ></h:outputLabel>
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.wifiCapable}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.dynamicpoisearch']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.dynamicPOISearch}
	</td>
	<td class="telematicsHeader" style="font-weight: bold;background-color:#e8e8e8;">
		<h:outputLabel value="#{msg['portlets.telematicSubs.scoutgpslinkcapable']}"></h:outputLabel> 
	</td>
	<td class="telematicsHeader" style="text-align:center;">
		${telematicSubscriptionControllerBean.vehicleCapabilityVO.scoutGPSLinkCapable}
	</td>
</tr>
</table>
</div>


</div>
<c:if test="${telematicSubscriptionControllerBean.telematicSubscriptionVO != null && not empty telematicSubscriptionControllerBean.telematicSubscriptionVO.telematicSystemList}"> 	
	    <c:set value="${telematicSubscriptionControllerBean.telematicSubscriptionVO.telematicSystemList}" var="telematicSubsList"></c:set>
	    
		<table class="telematictbl_wrapper">
			<tr>
			<td class="telematics_tbl" width="80%">
			<c:if test="${not empty telematicSubsList}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableBorder" >
					<tr>
						<td style="padding:0px 15px 0px 25px;">
						<div style="text-align:left; padding-bottom : 5px;">
							<h:outputLabel value="TELEMATICS PRODUCTS" style="font-weight:bold; text-decoration: underline; font-size : 15px;font-family: Verdana,Arial,Helvetica,sans-serif;"></h:outputLabel>
						</div>
						</td>
					</tr>
					<tr>
						<td style="padding:0px 15px 0px 25px;">
						<table cellspacing="0" cellpadding="0" width="100%" class="tableBorder">
						<tr  style="background-color:#e8e8e8;">
							<td class="telematicsHeader" style="font-weight: bold;width:15%;">
								<h:outputLabel value="#{msg['portlets.telematicSubs.telematicSystem']}" />
							</td>
							<td  class="telematicsHeader" style="font-weight: bold;width:10%;">
								<h:outputLabel value="#{msg['portlets.telematicSubs.contractID']}" />
							</td>
								<td  class="telematicsHeader" style="font-weight: bold;width:15%;">
									<h:outputLabel value="#{msg['portlets.telematicSubs.subscriber']}" />										
								</td>
								<td  class="telematicsHeader" style="font-weight: bold;width:15%;">
									<h:outputLabel value="#{msg['portlets.telematicSubs.role']}" />										
								</td>
							<td class="telematicsHeader" style="font-weight: bold;width:15%;">
								<h:outputLabel value="#{msg['portlets.telematicSubs.effectiveDt']}" />										
							</td>
							<td class="telematicsHeader" style="font-weight: bold;width:15%;">
								<h:outputLabel value="#{msg['portlets.telematicSubs.expDt']}" />										
							</td>
							<td  class="telematicsHeader" style="font-weight: bold;width:15%;">
								<h:outputLabel value="#{msg['portlets.telematicSubs.status']}" />										
							</td>
						</tr>
						<c:forEach items="#{telematicSubscriptionControllerBean.telematicSubscriptionVO.telematicSystemList}" var="item">
						<tr>
							<td  class="telematicsHeader" style="align:left;">
								<h:outputLabel title="#{item.productName}" value="#{item.telematicSystem}" rendered="#{null != item.telematicSystem}"/>
								<h:outputLabel title="#{item.productName}" value="#{item.productName}" rendered="#{null == item.telematicSystem}"/>
							</td>
							<td  class="telematicsHeader">
							<!--  TMS logic change
								<h:outputLabel  rendered="#{person.dealerCode == null }" value="#{item.contractId}" />
								<h:outputLabel  rendered="#{person.dealerCode != null }" value="#{item.maskedContractId}" /> -->
								<h:outputLabel  rendered="#{person.userType == null || person.userType !='Dealer-User'}" value="#{item.contractId}" />
								<h:outputLabel  rendered="#{person.userType =='Dealer-User' }" value="#{item.maskedContractId}" />
								
							</td>
							<%--<c:if test="${!telematicSubscriptionControllerBean.hideColumns}">--%>
								<td class="telematicsHeader">		
									<h:commandLink rendered="#{telematicSubscriptionControllerBean.portletRequest && null != item.telematicSystem}" value="#{item.subscriber}" onclick="javascript:openAccountInfo('#{item.custID}','#{item.contractId}','#{item.telematicSystem}');"></h:commandLink>
									<h:commandLink rendered="#{telematicSubscriptionControllerBean.portletRequest && null == item.telematicSystem}" value="#{item.subscriber}" onclick="javascript:openAccountInfo('#{item.custID}','#{item.contractId}','#{item.productName}');"></h:commandLink>
									<h:outputText rendered="#{!telematicSubscriptionControllerBean.portletRequest }" style="color:blue;" value="#{item.subscriber}" ></h:outputText>								
								</td>
								<td class="telematicsHeader">
									<h:outputLabel  value="#{item.role}" />										
								</td>
							<%-- </c:if>--%>
							<td class="telematicsHeader">
								<h:outputLabel  value="#{item.effectiveDt}" />										
							</td>
							<td  class="telematicsHeader">
								<h:outputLabel value="#{item.expDt}" />										
							</td>
							
							<c:set value="${item.status}" var="status" />
							<c:choose>
							<c:when test="${status == 'Active' || status == 'ACTIVE' || status == 'Enrolled' || status == 'ENROLLED' || status == 'Linked' || status == 'LINKED'}">
							<td class="telematicsHeader" style=" color: #04B404;">
								<strong><h:outputLabel value="#{item.status}" /></strong>										
							</td>
							</c:when>
							<c:when test="${status == 'Inactive'  || status == 'INACTIVE' || status == 'Not Enrolled' || status == 'NOT ENROLLED' || status == 'Not Linked' || status == 'NOT LINKED'}">
							<td  class="telematicsHeader" style="color: #DF0101;">
								<strong><h:outputLabel value="#{item.status}" /></strong>										
							</td>
							</c:when>
							<c:when test="${status == 'Future'  || status == 'FUTURE'}">
							<td  class="telematicsHeader">
								<strong><h:outputLabel value="#{item.status}" /></strong>										
							</td>
							</c:when>
							<c:otherwise>
							<td class="telematicsHeader">
									<h:outputLabel value="#{item.status}" />										
							</td>
							</c:otherwise>
							</c:choose>
							
							
						</tr>
						</c:forEach>
					</table>
				</td>
				</tr>
			</table>
			</c:if>
			</td>
			</tr>
			</table>
			<h:commandLink style="font-style:italic; font-weight:bold; padding-left: 30px;" value="#{msg['portlets.telematicSubs.lexusLink']}" rendered="#{telematicSubscriptionControllerBean.brriEnabled && telematicSubscriptionControllerBean.displayLexusPersonalisedSettings && telematicSubscriptionControllerBean.portletRequest && !telematicSubscriptionControllerBean.toyotaDealer}" onclick="javascript:openLPSPopup(); return false;"></h:commandLink>
        	<h:outputText style="font-style:italic; font-weight:bold; padding-left: 30px;color : blue;" value="#{msg['portlets.telematicSubs.lexusLink']}" rendered="#{telematicSubscriptionControllerBean.brriEnabled && telematicSubscriptionControllerBean.displayLexusPersonalisedSettings && !telematicSubscriptionControllerBean.portletRequest && !telematicSubscriptionControllerBean.toyotaDealer}" ></h:outputText>
        	<c:if test="${telematicSubscriptionControllerBean.brriEnabled && not telematicSubscriptionControllerBean.toyotaDealer}">
			<div>
        	<ul>
        		<li>
        			<h:outputText value="#{msg['portlets.telematicSubs.screenNote']}"></h:outputText>
        		</li>
        		<li>
        			<h:outputText value="#{msg['portlets.telematicSubs.screenNote1']}"></h:outputText>
        		</li>
        	</ul>
        </div>
        </c:if>
		</c:if>
		<c:if test="${telematicSubscriptionControllerBean.telematicSubscriptionVO == null ||  empty telematicSubscriptionControllerBean.telematicSubscriptionVO.telematicSystemList}">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableBorder" >
					<tr>
						<td style="padding:0px 15px 0px 25px;">
						<div style="text-align:left; padding-bottom : 5px;">
							<h:outputLabel value="TELEMATICS PRODUCTS" style="font-weight:bold; text-decoration: underline; font-size : 15px;font-family: Verdana,Arial,Helvetica,sans-serif;"></h:outputLabel>
						</div>
						</td>
					</tr>
					<tr>
						<td style="padding:0px 15px 0px 25px;">
							<h:outputText value="#{msg['portlets.telematicSubs.errorMsgPart1']}"></h:outputText>
							<h:outputText value="#{telematicSubscriptionControllerBean.vinVO.vinNumber} "></h:outputText>
							<h:outputText value="#{msg['portlets.telematicSubs.errorMsgPart2']}"></h:outputText>
						</td>
					</tr>
			</table>
			<br/>
			
		</c:if>
		
        </c:if>
       
        <br/>
        <input type="hidden" value="" id="custID" name="custID"/>
        <input type="hidden" value="" id="contractID" name="contractID"/>
        <input type="hidden" value="" id="prodName" name="prodName"/>
        <jsp:include page="/pages/asm/telematicSubscription/xmsubscriptionInclude.jsp"></jsp:include>
        </h:form>
<style>
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
		padding: 3px 3px; 
		border-bottom:2px solid #000000;
	}
	
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
	 	text-align: center;
	}
  </style>
<script>
<%
WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
HasValueTab tasTab = (HasValueTab) ctx.getBean("telematicSubscriptionControllerBean");
%>
var telePage = document.getElementById('ASMPortal_portal_page_TelematicsPage_blue');
if('<%=tasTab.containsResult()%>'=='true' && telePage && singleView)
	telePage.innerHTML = "<font color='yellow'><u>" + telePage.innerHTML + "</u></font>";	
</script>