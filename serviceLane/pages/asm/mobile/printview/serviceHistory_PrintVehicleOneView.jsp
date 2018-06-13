<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">



#serviceHistoryData td > *:empty {
    display:none;
}

.serviceHistTable{
	padding:0;
	vertical-align: top;
}

</style>


<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />
	<c:set var="warrantyIncluded" value="false" scope="page"></c:set>
<c:forEach items="${paramValues.moduleName}" var="module">
	<c:if test="${module == msg['print.title.servicehistory.warranty']}">
		<c:set var="warrantyIncluded" value="true" scope="page"></c:set>
	</c:if>
</c:forEach>
<h:form id="serviceHistoryFormPrint">


<table style="width:100%;" cellpadding="0" cellspacing="0">
<tr><td>
<h:outputText escape="false"
			value="
					<div align='left'>
            			<table width='100%'>
                			<tr>
	" />
		<h:outputText escape="false"
			rendered="#{serviceHistoryControllerBean.serviceHistoryVO.warrantyAvailable}"
			value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.dataAvailable']}'>#{msg['portlets.label.warrantySource']}<b></b>
			</td>
			<td align='left' width='2%' title='#{msg['portlets.label.dataAvailable']}'><img
				src='/serviceLane/resources/images/tick.JPG'></td>
	"/>
	<h:outputText escape="false"
				rendered="#{serviceHistoryControllerBean.serviceHistoryVO.warrantyException}"
				value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.serviceUnavailable']}'>#{msg['portlets.label.warrantySource']}<b></b>
				</td>
				<td align='left' width='2%' title='#{msg['portlets.label.serviceUnavailable']}'><img
					src='/serviceLane/resources/images/serviceError.jpg'></td>
	"/>
	<h:outputText escape="false"
					rendered="#{!serviceHistoryControllerBean.serviceHistoryVO.warrantyAvailable && !serviceHistoryControllerBean.serviceHistoryVO.warrantyException}"
					value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.noDataAvailable']}'>#{msg['portlets.label.warrantySource']}<b></b>
					</td>
					<td align='left' width='2%' title='#{msg['portlets.label.noDataAvailable']}'><img
						src='/serviceLane/resources/images/noData.JPG'></td>
	"/>
	<h:outputText escape="false"
						rendered="#{serviceHistoryControllerBean.serviceHistoryVO.nshAvailable}"
						value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.dataAvailable']}'>#{msg['portlets.label.nshSource']}<b></b>
						</td>
						<td align='left' width='2%' title='#{msg['portlets.label.dataAvailable']}'><img
							src='/serviceLane/resources/images/tick.JPG'></td>
	"/>
	<h:outputText escape="false"
							rendered="#{serviceHistoryControllerBean.serviceHistoryVO.nshAccessDenied}"
							value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='Access not permitted for this user.'>#{msg['portlets.label.nshSource']}<b></b></td>
						<td align='left' width='2%' title='Access not permitted for this user.'><img src='/serviceLane/resources/images/noAccess.jpg'></td>
	" />
						<h:outputText escape="false"
							rendered="#{serviceHistoryControllerBean.serviceHistoryVO.nshException}"
							value="
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.serviceUnavailable']}'>#{msg['portlets.label.nshSource']}<b></b>
							</td>
							<td align='left' width='2%' title='#{msg['portlets.label.serviceUnavailable']}'><img
								src='/serviceLane/resources/images/serviceError.jpg'></td>
	"/>
	<h:outputText escape="false"
								rendered="#{!serviceHistoryControllerBean.serviceHistoryVO.nshAvailable && !serviceHistoryControllerBean.serviceHistoryVO.nshAccessDenied && !serviceHistoryControllerBean.serviceHistoryVO.nshException}"
								value=" 
						<td align='right' width='1%' valign='middle' style='font-weight:bold;' title='#{msg['portlets.label.noDataAvailable']}'>#{msg['portlets.label.nshSource']}<b></b>
								</td>
								<td align='left' width='2%' title='#{msg['portlets.label.noDataAvailable']}'><img
									src='/serviceLane/resources/images/noData.JPG'></td>
	"/>
	<h:outputText escape="false"
									value="
							<td align='right'>
                    </td>
                </tr>
              </table>
        </div>
	" />
	
</td>
</tr>	
</table>

	<h:panelGroup rendered="#{(serviceHistoryControllerBean.serviceHistoryVO.nshException || serviceHistoryControllerBean.serviceHistoryVO.nshAccessDenied) && (serviceHistoryControllerBean.serviceHistoryVO.nshErrorDesc != null && not empty serviceHistoryControllerBean.serviceHistoryVO.nshErrorDesc)}">
		<h:outputText value="</br>" escape="false"/>
		<h:outputText value="Message From NSH: " style="color:red;font-size:13px; font-weight: bold;"></h:outputText>
		<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.nshErrorDesc}" style="color:red;font-size:13px; font-weight: bold;"></h:outputText>
	</h:panelGroup>
		
<h:outputText value="</br>" escape="false"/>
		
	<h:panelGroup rendered="#{not empty vin.vinNumber && (serviceHistoryControllerBean.serviceHistoryVO.nshAvailable ||  
				serviceHistoryControllerBean.serviceHistoryVO.warrantyAvailable)}">
				<h:outputText  escape="false" value="</br>"/>
		<table width="100%" cellspacing="0" cellpadding="3" style="text-align: center;">
		<tr style="background-color:#FAAC58;padding: 2px 2px 2px 2px;" height="">
			<td width="20%"  style="font-weight: bold;border-width:1px 1px 1px 1px;border-style:solid;border-color:#000000;">
				<h:outputLabel value="#{msg['portlets.label.customerpay']}"></h:outputLabel>
			</td>
			<td width="20%" style="font-weight: bold;border-width:1px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputLabel value="#{msg['portlets.label.warrantypay']}"></h:outputLabel>
			</td>
			<td width="20%" style="font-weight: bold;border-width:1px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputLabel value="#{msg['portlets.label.dealerpay']}"></h:outputLabel>
			</td>
			<td width="20%" style="font-weight: bold;border-width:1px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputLabel value="#{msg['portlets.label.goodwillpay']}"></h:outputLabel>
			</td>
			<td width="20%" style="font-weight: bold;border-width:1px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputLabel value="#{msg['portlets.label.totalpay']}"></h:outputLabel>
			</td>
		</tr>
		<tr style="padding: 2px 2px 2px 2px;">
			<td width="20%"  style="border-width:0px 1px 1px 1px;border-style:solid;border-color:#000000;">
				<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.paymentSummary.customerPay}"></h:outputText>
			</td>
			<td width="20%" style="border-width:0px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.paymentSummary.warrantyPay}"></h:outputText>
			</td>
			<td width="20%" style="border-width:0px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.paymentSummary.dealerPay}"></h:outputText>
			</td>
			<td width="20%" style="border-width:0px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.paymentSummary.goodwillPay}"></h:outputText>
			</td>
			<td width="20%" style="border-width:0px 1px 1px 0px;border-style:solid;border-color:#000000;">
				<h:outputText value="#{serviceHistoryControllerBean.serviceHistoryVO.paymentSummary.totalPay}"></h:outputText>
			</td>
		</tr>
	</table>
	</h:panelGroup>
	<h:outputText value="</br>" escape="false"/>
<div id="serviceHistoryData">

<!--Data Population -  Data table to get Sub Item Name -->
<h:dataTable styleClass="serviceHistTable" width="100%" value="#{paramValues.moduleName}" var="moduleName" cellpadding="0" cellspacing="0">
		<h:column>
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.servicehistory.warranty']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
						<h:dataTable styleClass="serviceHistTable" width="100%" value="#{paramValues.moduleName}" var="format" cellpadding="0" cellspacing="0">
							<h:column>
								<h:panelGroup layout="block" rendered="#{format == 'shortForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<!-- -----------------------------------------------------------Warranty ------------------------------------------------------------------ -->
						
								<c:forEach var="serviceHistory"
									items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">		
										<h:panelGroup
										rendered="#{serviceHistory.sourceType == 'WARRANTY'}">

										<h:outputText escape="false"
		value="
							
						
							<table style='border: 1px #9C9C9C solid; background: #EAEAEA'
								cellpadding='3' cellspacing='0' width='100%'>
								
								<tr style='background: #C0C0C0;'>
									<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
									<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
									<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.warrantyamount']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.claimNO']}</b></td>
									<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.payType']}</b></td>
									<td align='right' width='5%'>
									</td>
								</tr>
								
								<tbody class='HighLight'>
								<tr>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.repairCloseDate}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.sourceType}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.mileage}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5; color : blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.roNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.totalClaimAmountFormatted}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.claimNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{msg['portlets.label.warrantyPay']}</td>
									<td align='center' width='5%' colSpan=2
										style='border-bottom: 1px #A5A5A5'>&nbsp;</td>
								</tr>
								
								<tr >
									<td colspan='9'><b>#{msg['portlets.label.conditionDesc']}:</b> #{serviceHistory.causeDescription}</td>
								</tr>
								</tbody>
							</table>
							
						
						" />
									</h:panelGroup>
									
								</c:forEach>

					
					<!-- warranty end -->						

								</h:panelGroup>
								<h:panelGroup layout="block" rendered="#{format == 'longForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<c:forEach var="serviceHistory"
									items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">		
										<h:panelGroup
										rendered="#{serviceHistory.sourceType == 'WARRANTY'}">

										<h:outputText escape="false"
											value="
					
            			<table style='border: 1px #9C9C9C solid; background: #EAEAEA'
								cellpadding='3' cellspacing='0' width='100%'>
								<tr style='background: #C0C0C0'>
									<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
									<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
									<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.warrantyamount']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.claimNO']}</b></td>
									<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.payType']}</b></td>
								</tr>
								<tr>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.repairCloseDate}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.sourceType}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.mileage}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted; color : blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.roNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.totalClaimAmountFormatted}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.claimNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{msg['portlets.label.warrantyPay']}</td>
								</tr>
							 	<tr >
				                    <td><b>#{msg['portlets.label.claimNO']}:</b> #{serviceHistory.claimNumber}</td>	
				                    <td><b>#{msg['portlets.label.partNO']}:</b> #{serviceHistory.partNumber}</td>
				                 	<td colspan='3' align='center'><b>#{msg['portlets.label.partnumberdesc']}:</b>#{serviceHistory.partDescription}</td>				                   
				                    <td align='center' colspan='2'><b>#{msg['portlets.label.replacedPart']}:</b>#{serviceHistory.replacedPart}</td>
				                    <td align='center'><b>#{msg['portlets.label.goodwillindicator']}:&nbsp;</b>#{serviceHistory.goodwillIndicator}</td>					              			                   			                    
				                </tr>
				                <tr >
				                    <td><b>#{msg['portlets.label.opcode']}:</b> #{serviceHistory.opCodeNumber}</td>
				                    <td colspan='6'><b>#{msg['portlets.label.repair']}:</b>#{serviceHistory.opCodeDescription}</td>
				                </tr>
				                <tr >
				                    <td><b>#{msg['portlets.label.t1Label']}:</b>
				                     "/> <h:outputLabel value="#{serviceHistory.troubleCode1}" style="color: blue;"></h:outputLabel>
				                     <h:outputText escape="false"
											value="
				                    </td>
				                    <td><b>#{msg['portlets.label.t2Label']}:</b>
				                    "/>
				                    <h:outputLabel value="#{serviceHistory.troubleCode2}" style="color: blue;"></h:outputLabel>
									 <h:outputText escape="false"
											value="
				                    </td>
				                    <td><b>#{msg['portlets.label.t3Label']}:</b>
				                    "/>
				                    <h:outputLabel value="#{serviceHistory.troubleCode3}" style="color: blue;"></h:outputLabel>
				                     <h:outputText escape="false"
											value="
				                    </td>
				                    <td align='center' colspan='4'>&nbsp;</td>
				                </tr>
				                <tr >
				                    <td colspan='8'><b>#{msg['portlets.label.conditionDesc']}:</b>
				                     #{serviceHistory.causeDescription}</td>
				                </tr>
				                <tr >
				                    <td colspan='8'><b>#{msg['portlets.label.causeDesc']}:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
				                     #{serviceHistory.causeDescription}</td>
				                </tr>
				                <tr>
				                    <td colspan='8'><b>#{msg['portlets.label.remedyDesc']}:&nbsp;&nbsp;&nbsp;</b>
				                    #{serviceHistory.remedyDescription}</td>
				                </tr>
				                
							
			</table>" />
									</h:panelGroup>
									
								</c:forEach>
								</h:panelGroup>
							</h:column>
						</h:dataTable>
			</h:panelGroup>
			<!-- -------------------------------------Goodwill------------------------- -->
			<c:if test="${not fn:contains(warrantyIncluded,'true') }">
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.servicehistory.goodwill']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
						<h:dataTable styleClass="serviceHistTable" width="100%" value="#{paramValues.moduleName}" var="format" cellpadding="0" cellspacing="0">
							<h:column>
								<h:panelGroup layout="block" rendered="#{format == 'shortForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<!-- -----------------------------------------------------------Warranty ------------------------------------------------------------------ -->
						
								<c:forEach var="serviceHistory"
									items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">		
										<h:panelGroup
										rendered="#{serviceHistory.sourceType == 'WARRANTY' && serviceHistory.goodwillIndicator==\"Y\"}">

										<h:outputText escape="false"
		value="
							
						
							<table style='border: 1px #9C9C9C solid; background: #EAEAEA'
								cellpadding='3' cellspacing='0' width='100%'>
								
								<tr style='background: #C0C0C0;'>
									<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
									<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
									<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.warrantyamount']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.claimNO']}</b></td>
									<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.payType']}</b></td>
									<td align='right' width='5%'>
									</td>
								</tr>
								
								<tbody class='HighLight'>
								<tr>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.repairCloseDate}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.sourceType}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.mileage}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5; color : blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.roNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.totalClaimAmountFormatted}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{serviceHistory.claimNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5'>#{msg['portlets.label.warrantyPay']}</td>
									<td align='center' width='5%' colSpan=2
										style='border-bottom: 1px #A5A5A5'>&nbsp;</td>
								</tr>
								
								<tr >
									<td colspan='9'><b>#{msg['portlets.label.conditionDesc']}:</b> #{serviceHistory.causeDescription}</td>
								</tr>
								</tbody>
							</table>
							
						
						" />
									</h:panelGroup>
									
								</c:forEach>

					
					<!-- warranty end -->						

								</h:panelGroup>
								<h:panelGroup layout="block" rendered="#{format == 'longForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<c:forEach var="serviceHistory"
									items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">		
										<h:panelGroup
										rendered="#{serviceHistory.sourceType == 'WARRANTY' && serviceHistory.goodwillIndicator==\"Y\"}">

										<h:outputText escape="false"
											value="
					
            			<table style='border: 1px #9C9C9C solid; background: #EAEAEA'
								cellpadding='3' cellspacing='0' width='100%'>
								<tr style='background: #C0C0C0'>
									<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
									<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
									<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
									<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.warrantyamount']}</b></td>
									<td align='center' width='10%'><b>#{msg['portlets.label.claimNO']}</b></td>
									<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.payType']}</b></td>
								</tr>
								<tr>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.repairCloseDate}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.sourceType}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.mileage}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted; color : blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.roNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.totalClaimAmountFormatted}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{serviceHistory.claimNumber}</td>
									<td align='center' style='border-bottom: 1px #A5A5A5 dotted'>#{msg['portlets.label.warrantyPay']}</td>
								</tr>
							 	<tr >
				                    <td><b>#{msg['portlets.label.claimNO']}:</b> #{serviceHistory.claimNumber}</td>	
				                    <td><b>#{msg['portlets.label.partNO']}:</b> #{serviceHistory.partNumber}</td>
				                 	<td colspan='3' align='center'><b>#{msg['portlets.label.partnumberdesc']}:</b>#{serviceHistory.partDescription}</td>				                   
				                    <td align='center' colspan='2'><b>#{msg['portlets.label.replacedPart']}:</b>#{serviceHistory.replacedPart}</td>
				                    <td align='center'><b>#{msg['portlets.label.goodwillindicator']}:&nbsp;</b>#{serviceHistory.goodwillIndicator}</td>					              			                   			                    
				                </tr>
				                <tr >
				                    <td><b>#{msg['portlets.label.opcode']}:</b> #{serviceHistory.opCodeNumber}</td>
				                    <td colspan='6'><b>#{msg['portlets.label.repair']}:</b>#{serviceHistory.opCodeDescription}</td>
				                </tr>
				                <tr >
				                    <td><b>#{msg['portlets.label.t1Label']}:</b>
				                     "/> <h:outputLabel value="#{serviceHistory.troubleCode1}" style="color: blue;"></h:outputLabel>
				                     <h:outputText escape="false"
											value="
				                    </td>
				                    <td><b>#{msg['portlets.label.t2Label']}:</b>
				                    "/>
				                    <h:outputLabel value="#{serviceHistory.troubleCode2}" style="color: blue;"></h:outputLabel>
									 <h:outputText escape="false"
											value="
				                    </td>
				                    <td><b>#{msg['portlets.label.t3Label']}:</b>
				                    "/>
				                    <h:outputLabel value="#{serviceHistory.troubleCode3}" style="color: blue;"></h:outputLabel>
				                     <h:outputText escape="false"
											value="
				                    </td>
				                    <td align='center' colspan='4'>&nbsp;</td>
				                </tr>
				                <tr >
				                    <td colspan='8'><b>#{msg['portlets.label.conditionDesc']}:</b>
				                     #{serviceHistory.causeDescription}</td>
				                </tr>
				                <tr >
				                    <td colspan='8'><b>#{msg['portlets.label.causeDesc']}:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
				                     #{serviceHistory.causeDescription}</td>
				                </tr>
				                <tr>
				                    <td colspan='8'><b>#{msg['portlets.label.remedyDesc']}:&nbsp;&nbsp;&nbsp;</b>
				                    #{serviceHistory.remedyDescription}</td>
				                </tr>
				                
							
			</table>" />
									</h:panelGroup>
									
								</c:forEach>
								</h:panelGroup>
							</h:column>
						</h:dataTable>
			</h:panelGroup>
			</c:if>
			<!-- -------------------------- -->
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.servicehistory.nsh']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
						<h:dataTable styleClass="serviceHistTable" width="100%" value="#{paramValues.moduleName}" var="format" cellpadding="0" cellspacing="0">
							<h:column>
								<h:panelGroup layout="block" rendered="#{format == 'shortForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
														<!--------------------------------------------------------------- Data Loop ----------------------------------------------------------------------->
												<c:forEach var="serviceHistory"
															items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">
															<h:panelGroup rendered="#{serviceHistory.sourceType == 'NSH'}">
												<h:outputText escape="false"
								value="
												
												
												<table style='border:1px #9C9C9C solid;background: #EAEAEA' cellpadding='3' cellspacing='0' width='100%'>
													<tr style='background: #C0C0C0;'>
														<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
														<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
														<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
														<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
														<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
														<td align='center' width='10%'><b>#{msg['portlets.label.nshrototal']}</b></td>
														<td align='center' width='10%'><b>#{msg['portlets.label.ROOpen']}</b></td>
														<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.serviceAdvisor']}</b></td>
														<td align='right' width='5%'><b></b>
															
														</td>
													</tr>
													<tbody>
													<tr>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.repairCloseDate}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.sourceType}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.mileage}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5;color : blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.roNumber}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.totalCost}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.roOpenDate}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.serviceAdvisorName.lastName}#{not empty serviceHistory.serviceAdvisorName.lastName ? \",\" : \" \"}#{serviceHistory.serviceAdvisorName.firstName}</td>
														 <td align='center' style='border-bottom:1px #A5A5A5' width='5%' colSpan=2>&nbsp;</td>
													</tr>
													
												" />
								<c:if test="${serviceHistory.sourceType == 'NSH'}">
								<c:forEach var="recordhist"
									items="#{serviceHistory.repairConditionsList}">
									<h:outputText escape="false"
										value="
															<tr >
																<td colspan='8' style='border-bottom:1px #A5A5A5 '>
																  <table width='100%'>
																      <tr>
																          <td colspan='3'><b>#{msg['portlets.label.condition']} #{recordhist.position}- #{msg['portlets.label.opcodedescription']} </b>
																				#{recordhist.operation.opCodeDescriptionShort}
																			</td>
																			<td colspan='3' align='right'><b>#{msg['portlets.label.payType']}: </b>
																				#{recordhist.labourCodeDescription}
																			</td>
																			<td align='center' width='5%'>&nbsp;</td>
																 		</tr>
																	</table>
																</td>
															</tr>
												" />
									</c:forEach>
								</c:if>
								<h:outputText escape="false"
										value="</table>" />
											
								</h:panelGroup>
								</c:forEach>
								</h:panelGroup>
								<h:panelGroup layout="block" rendered="#{format == 'longForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
												<!--------------------------------------------------------------- Data Loop ----------------------------------------------------------------------->
										<c:forEach var="serviceHistory"
											items="#{serviceHistoryControllerBean.serviceHistoryVO.serviceCommonHistoryList}">
											<h:panelGroup rendered="#{serviceHistory.sourceType == 'NSH'}">
												<h:outputText escape="false"
													value="
							
								<table style='border:1px #9C9C9C solid;background: #EAEAEA' cellpadding='3' cellspacing='0' width='100%'>
									<tr style='background: #C0C0C0'>
										<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
										<td align='center' width='12%'><b>#{msg['portlets.label.source']}</b></td>
										<td align='center' width='12%'><b>#{msg['portlets.label.mileage']}</b></td>
										<td align='center' width='15%'><b>#{msg['portlets.label.dealer']}</b></td>
										<td align='center' width='14%'><b>#{msg['portlets.label.RONumber']}</b></td>
										<td align='center' width='10%'><b>#{msg['portlets.label.nshrototal']}</b></td>
										<td align='center' width='10%'><b>#{msg['portlets.label.ROOpen']}</b></td>
										<td align='center' width='10%' colSpan=2><b>#{msg['portlets.label.serviceAdvisor']}</b></td>
									</tr>
									
									<tr>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.repairCloseDate}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.sourceType}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.mileage}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted; color: blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.roNumber}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.totalCost}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.roOpenDate}</td>
										 <td align='center' style='border-bottom:1px #A5A5A5 dotted'>#{serviceHistory.serviceAdvisorName.lastName}#{not empty serviceHistory.serviceAdvisorName.lastName ? \",\" : \" \"}#{serviceHistory.serviceAdvisorName.firstName}</td>
									</tr>
								" />
												<c:if test="${serviceHistory.sourceType == 'NSH'}">
													<c:forEach var="recordhist"
														items="#{serviceHistory.repairConditionsList}">
														<h:outputText escape="false"
															value="
											<tr>
												<td colspan='7' style='border-bottom: 1px #A5A5A5 dotted'>
												<table width='100%'>
													<tr>
														<td colspan='3'><b>#{msg['portlets.label.condition']} #{recordhist.position}- 
														#{msg['portlets.label.opcode']}: </b>
														#{recordhist.operation.opCodeNumber}</td>
														<td colspan='4' align='right'><b>#{msg['portlets.label.payType']}:
														</b> #{recordhist.labourCodeDescription}
														<td align='center' width='5%'>&nbsp;</td>
													</tr>
													<tr>
														<td colSpan=8>
														<table width='100%'>
															<tr valign='top'>
																<td width=96px><b>#{msg['portlets.label.opcodedescription']}:</b></td>
																<td colspan='4' align='justify'>#{recordhist.operation.opCodeDescription}</td>
															</tr>
														</table>
														</td>
													</tr>
													<tr>
														<td colspan='8'>
								" />
														<h:outputText escape="false"
															rendered="#{recordhist.partInfo != null}"
															value="
														<table width='100%' >				
								" />
														<c:forEach var="partInfo" items="#{recordhist.partInfo}"
															varStatus="status">
															<c:if test="${status.count == 1}">
																<h:outputText escape="false"
																	value="
									<tr><td width='20%'><b>Claim #: </b>#{recordhist.claimNumber}</td>
								" />
															</c:if>
															<c:if test="${status.count > 1}">
																<h:outputText escape="false"
																	value="
									<tr><td width='20%'><b>&nbsp;</td>
								" />
															</c:if>
															<h:outputText escape="false"
																value="
																<td width='20%'><b>Part Qty: </b>#{partInfo.partQuantity}</td>
									                    		<td width='20%'><b>Part #: </b>#{partInfo.partNumber}</td>
									                   			<td><b>Part Desc: </b>#{partInfo.partDescription}</td></tr>
								" />
														</c:forEach>
														<h:outputText escape="false"
															rendered="#{recordhist.partInfo != null}"
															value="
															</tr>
														</table>
								" />
														<h:outputText escape="false"
															rendered="#{recordhist.partInfo == null}"
															value=" 
															<table width='100%'>
																<tr>
																	<td colspan='5' align='center'><b>#{msg['portlets.label.noPartInfo']}</b></td>
																</tr>
								</table>
															
								" />
								  <tr >
										<td colspan='9'>
										<table width="100%" style='border:1px solid black;border-spacing:0;text-align: center;'>
											<tr style='font-weight:bold;'>
											
												<td class="tblCol" width='20%'>Technician</td>
		                        				 <td class="tblCol" width='10%'>Hours</td>
		 								      <td class="tblCol" width='10%'>Labor</td>
		   									    <td class="tblCol"width='10%'>Parts</td>
										       <td class="tblCol" width='10%'>Sublet</td>
		     								  <td class="tblCol" width='10%'>Fluids</td>
										       <td class="tblCol" width='10%'>Body Shop</td>
		       									<td class="tblCol" width='20%'>Total Condition Amt</td>
											</tr>
										
						<tr>
												<td width='20%' class="tblCol" >${recordhist.operation.technicianName}</td>
												<td width='10%' class="tblCol" >${recordhist.totalConditionHours}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionLaborCost}</td>
												<td  width='10%' class="tblCol" >${recordhist.totalPartsCost}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionSubletCost}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionFluidCost} </td>
												<td width='10%' class="tblCol" >${recordhist.conditionShopCost} </td>
												<td width='20%' class="tblCol" >${recordhist.totalConditionCost} </td>
										   </tr>
										   </table>
											</td>
											
											</tr>
								
							
														<h:outputText escape="false"
															value="
													</table>
													</td>
												</tr>
								" />
													</c:forEach>
												</c:if>
												<h:outputText escape="false"
															value="
													</table>
											
												" />
								</h:panelGroup>
								</c:forEach>

								</h:panelGroup>
							</h:column>
						</h:dataTable>
			</h:panelGroup>
			<h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.servicehistory.oldernsh']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
						<h:dataTable styleClass="serviceHistTable" width="100%" value="#{paramValues.moduleName}" var="format" cellpadding="0" cellspacing="0">
							<h:column>
								<h:panelGroup layout="block" rendered="#{format == 'shortForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<h:panelGroup rendered="#{not empty serviceHistoryControllerBean.serviceHistoryVO.nshArchived}">
									<h:outputText value="Older Service History" style="font:bold; text-decoration:underline;"></h:outputText><br/><br/>
									<c:forEach var="serviceHistory"
									items="#{serviceHistoryControllerBean.serviceHistoryVO.nshArchived}">
																	
														<h:panelGroup rendered="#{serviceHistory.sourceType == 'NSH'}">
									<!-- -----------------------------------------------------------NSH Minimize--------------------------------------------------------------- -->
									
									<h:outputText escape="false"
										value="
														<table style='border:1px #9C9C9C solid;background: #EAEAEA' cellpadding='3' cellspacing='0' width='100%'>
															<tr style='background: #C0C0C0'>
																<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
																<td align='center' width='10%'><b>#{msg['portlets.label.source']}</b></td>
																<td align='center' width='10%'><b>#{msg['portlets.label.mileage']}</b></td>
																<td align='center' width='13%'><b>#{msg['portlets.label.dealer']}</b></td>
																<td align='center' width='12%'><b>#{msg['portlets.label.RONumber']}</b></td>
																<td align='center' width='10%'><b>#{msg['portlets.label.nshrototal']}</b></td>
																	<td align='center' width='10%'><b>#{msg['portlets.label.ROOpen']}</b></td>
																<td align='center' width='23%'><b>#{msg['portlets.label.serviceAdvisor']}</b></td>
																
															</tr>
															<tbody>
															<tr>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.repairCloseDate}</td>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.sourceType}</td>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.mileage}</td>
																 <td align='center' style='border-bottom:1px #A5A5A5; color: blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.roNumber}</td>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.totalCost}</td>
																  <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.roOpenDate}</td>
																 <td align='center' style='border-bottom:1px #A5A5A5'>#{serviceHistory.serviceAdvisorName.lastName}#{not empty serviceHistory.serviceAdvisorName.lastName ? \",\" : \" \"}#{serviceHistory.serviceAdvisorName.firstName}</td>
																 
															</tr>
															
														" />
										<c:if test="${serviceHistory.sourceType == 'NSH'}">
										<c:forEach var="recordhist"
											items="#{serviceHistory.repairConditionsList}">
											<h:outputText escape="false"
												value="
																	<tr >
																		<td colspan='7' style='border-bottom:1px #A5A5A5 '>
																		  <table width='100%'>
																		      <tr>
																		          <td colspan='3'><b>#{msg['portlets.label.condition']} #{recordhist.position}- #{msg['portlets.label.opcodedescription']} </b>
																						#{recordhist.operation.opCodeDescriptionShort}
																					</td>
																					<td colspan='3' align='right'><b>#{msg['portlets.label.payType']}: </b>
																						#{recordhist.labourCodeDescription}
																					</td>
																					<td align='center' width='5%'>&nbsp;</td>
																		 		</tr>
																			</table>
																		</td>
																	</tr>
														" />
										</c:forEach>
										</c:if>
										<h:outputText escape="false"
															value="
													</tbody>
												" />
										
									<h:outputText escape="false"
															value="
													</table>
												
												" />
									</h:panelGroup>
									</c:forEach>
									</h:panelGroup>
	
								</h:panelGroup>
								<h:panelGroup layout="block" rendered="#{format == 'longForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
									<h:panelGroup layout="block" rendered="#{not empty serviceHistoryControllerBean.serviceHistoryVO.nshArchived }">			
									<h:outputText value="Older Service History" style="font:bold; text-decoration:underline;text-align : left;"></h:outputText><br/><br/>
									<c:forEach var="serviceHistory"
										items="#{serviceHistoryControllerBean.serviceHistoryVO.nshArchived}">
										<h:panelGroup rendered="#{serviceHistory.sourceType == 'NSH'}">
										
											<h:outputText escape="false"
											value="
															<div class='#{facesContext.viewRoot.id}NSH' style='display:inline;'>
															<div class='#{facesContext.viewRoot.id}SERVHISTMAX' style='display:inline;'>
															<table style='border:1px #9C9C9C solid;background: #EAEAEA' cellpadding='3' cellspacing='0' width='100%'>
																<tr style='background: #C0C0C0'>
																	<td align='center' width='12%'><b>#{msg['portlets.label.ROClose']}</b></td>
																	<td align='center' width='10%'><b>#{msg['portlets.label.source']}</b></td>
																	<td align='center' width='10%'><b>#{msg['portlets.label.mileage']}</b></td>
																	<td align='center' width='13%'><b>#{msg['portlets.label.dealer']}</b></td>
																	<td align='center' width='12%'><b>#{msg['portlets.label.RONumber']}</b></td>
																	<td align='center' width='10%'><b>#{msg['portlets.label.nshrototal']}</b></td>
																	<td align='center' width='10%'><b>#{msg['portlets.label.ROOpen']}</b></td>
																	<td align='center' width='23%'><b>#{msg['portlets.label.serviceAdvisor']}</b></td>
																	
																</tr>
																<tbody class='HighLightNSH'>
																<tr>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.repairCloseDate}</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.sourceType}</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.mileage}</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5;color: blue;'>#{serviceHistory.dealerName} (#{serviceHistory.dealerCode})</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.roNumber}</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.totalCost}</td>
																	  <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.roOpenDate}</td>
																	 <td align='center' style='border-bottom:1px dotted #A5A5A5'>#{serviceHistory.serviceAdvisorName.lastName}#{not empty serviceHistory.serviceAdvisorName.lastName ? \",\" : \" \"}#{serviceHistory.serviceAdvisorName.firstName}</td>
																	 
																</tr>
															" />
										<c:if test="${serviceHistory.sourceType == 'NSH'}">
											<c:forEach var="recordhist"
												items="#{serviceHistory.repairConditionsList}">
												<h:outputText escape="false"
													value="
																		<tr>
																			<td colspan='7' style='border-bottom: 1px #A5A5A5 dotted'>
																			<table width='100%'>
																				<tr>
																					<td colspan='3'><b>#{msg['portlets.label.condition']} #{recordhist.position}- 
																					#{msg['portlets.label.opcode']}: </b>
																					#{recordhist.operation.opCodeNumber}</td>
																					<td colspan='4' align='right'><b>#{msg['portlets.label.payType']}:
																					</b> #{recordhist.labourCodeDescription}</td>
																					<td align='center' width='5%'>&nbsp;</td>
																				</tr>
																				<tr>
																					<td colSpan=8>
																					<table width='100%'>
																						<tr valign='top'>
																							<td width='96px'><b>#{msg['portlets.label.opcodedescription']}:</b></td>
																							<td colspan='4' align='justify'>#{recordhist.operation.opCodeDescription}</td>
																						</tr>
																					</table>
																					</td>
																				</tr>
																				<tr>
																					<td colspan='8'>
																					<table width='100%'>
																							
															" />
												<c:forEach var="partInfo" items="#{recordhist.partInfo}"
													varStatus="status">
													<c:if test="${status.count == 1}">
														<h:outputText escape="false"
															value="
																<tr><td width='20%'><b>Claim #: </b>#{recordhist.claimNumber}</td>
															" />
													</c:if>
													<c:if test="${status.count > 1}">
														<h:outputText escape="false"
															value="
																<tr><td width='20%'><b>&nbsp;</td>
															" />
													</c:if>
													<h:outputText escape="false"
														value="
																							<td width='20%'><b>Part Qty: </b>#{partInfo.partQuantity}</td>
																                    		<td width='20%'><b>Part #: </b>#{partInfo.partNumber}</td>
																                   			<td><b>Part Desc: </b>#{partInfo.partDescription}</td></tr>
															" />
												</c:forEach>
												<h:outputText escape="false"
													rendered="#{empty recordhist.partInfo}"
													value=" 
																						
																								<tr><td colspan='5' align='center'><b>#{msg['portlets.label.noPartInfo']}</b></td></tr>
																							
																						
															" />
													<tr >
									  
										<td colspan='9'>
										<table width="100%" style='border:1px solid black;border-spacing:0;text-align: center;'>
											<tr style='font-weight:bold;'>
											
												<td class="tblCol" width='20%'>Technician</td>
		                        				 <td class="tblCol" width='10%'>Hours</td>
		 								      <td class="tblCol" width='10%'>Labor</td>
		   									    <td class="tblCol"width='10%'>Parts</td>
										       <td class="tblCol" width='10%'>Sublet</td>
		     								  <td class="tblCol" width='10%'>Fluids</td>
										       <td class="tblCol" width='10%'>Body Shop</td>
		       									<td class="tblCol" width='20%'>Total Condition Amt</td>
											</tr>
										
						<tr>
												<td width='20%' class="tblCol" >${recordhist.operation.technicianName}</td>
												<td width='10%' class="tblCol" >${recordhist.totalConditionHours}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionLaborCost}</td>
												<td  width='10%' class="tblCol" >${recordhist.totalPartsCost}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionSubletCost}</td>
												<td width='10%' class="tblCol" >${recordhist.conditionFluidCost} </td>
												<td width='10%' class="tblCol" >${recordhist.conditionShopCost} </td>
												<td width='20%' class="tblCol" >${recordhist.totalConditionCost} </td>
										   </tr>
										   </table>
											</td>
											
											</tr>
												<h:outputText escape="false"
													value="
																					
																						</table>
																					</td>
																				</tr>
																				</table>
																				</td>
																			</tr>
															" />
											</c:forEach>
										</c:if>
										</tbody>
										</table>
										</div>
										</div>
										</h:panelGroup>
									</c:forEach>
									</h:panelGroup>
								</h:panelGroup>
							</h:column>
						</h:dataTable>
			</h:panelGroup>
		</h:column>
	</h:dataTable>
</div>
	
<h:panelGroup rendered="#{!serviceHistoryControllerBean.serviceHistoryVO.nshAvailable && !serviceHistoryControllerBean.serviceHistoryVO.warrantyAvailable && not empty vin.vinNumber}">
		<h:outputLabel value="#{msg['portlets.description.vehicleinformation']}">&nbsp;</h:outputLabel>
		<h:outputText value="#{vin.vinNumber}" style="font-weight: bold;" />
</h:panelGroup>
</h:form>

