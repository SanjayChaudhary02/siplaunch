<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.bea.com/servers/portal/tags/netuix/render" prefix="render"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.tms.t3.asm.asmPortal.Constants"  %>
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy" var="msg"/>
<h:form id="campaignForm">
  		<c:set value="${spaCampaignControllerBean.serviceCampaignsVO}" var="serviceCampaignsVO"></c:set>
  		<h:panelGroup rendered="#{spaCampaignControllerBean.serviceCampaignsVO.campaignsPresent}">
  			<h:outputText value="#{msg['wt.staticText']}"></h:outputText>
  		</h:panelGroup>
      	
      	<c:if test="${serviceCampaignsVO.campaignsPresent}">
	      	<table cellspacing="0" cellpadding="0" width="100%" style="text-align: left;padding: 0px;vertical-align: top;">
	       	<tr><td colspan="3" width="100%" style="padding-bottom: 3px;">&nbsp;</td></tr>
	       	<c:forEach items="${serviceCampaignsVO.serviceCampaigns}" var="campaign">
	       		
	       		<tr>
	       			<td class="campaignTblColumn1" ><h:outputLabel value="#{msg['portlets.label.spaCampaigndescription']}">:&nbsp;</h:outputLabel></td>
	       			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	       			<td class="campaignTblColumn3">${campaign.campaignTitle}</td>
	       		</tr>
	       		<c:if test ="${campaign.automaticExpiry =='Y' and campaign.detailExpiryDate!=null }">
	       			<tr>
	       				<td class="campaignTblColumn1" ><h:outputLabel value="#{msg['portlets.label.primaryexpirationDate']}">:&nbsp;</h:outputLabel></td>
	       				<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	       				<td class="campaignTblColumn3">${campaign.detailExpiryDate}</td>
	       			</tr>
                        <tr>
                        	<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.secondaryexpirationDate']}">:&nbsp;</h:outputLabel></td>
                        	<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
                       	<td class="campaignTblColumn3">${campaign.secondarydate}  ${campaign.dofuMileage}</td>
                       	
 	       		</c:if> 

 	       		<c:if test="${campaign.automaticExpiry !='Y' and campaign.detailExpiryDate != null }">
 	       			<tr>
	       				<td class="campaignTblColumn1" ><h:outputLabel value="#{msg['portlets.label.spaCampaignexpirationDate']}">:&nbsp;</h:outputLabel></td>
	       				<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	       				<td class="campaignTblColumn3">${campaign.detailExpiryDate} </td>
	       				
	       			</tr>
 	       		</c:if>

 	       		<c:if test="${ campaign.automaticExpiry =='Y' and campaign.detailExpiryDate == null }">
 	       			<td class="campaignTblColumn1" ><h:outputLabel value="#{msg['portlets.label.spaCampaignexpirationDate']}">:&nbsp;</h:outputLabel></td>
	       			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	       			<td class="campaignTblColumn3">${campaign.secondarydate} ${campaign.dofuMileage}</td> 
	       		</c:if>
	       		
	       		<c:if test="${campaign.campaignComplete}">
	       			<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.spaCampaignstatus']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3"><b>${campaign.campaignDescr}</b></td>
	       			</tr>
	       			<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.spaDateofservice']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3">${campaign.dateOfService}</td>
	       			</tr>
					 	<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.dealername']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3">${campaign.dealerName}</td>
	       			</tr>
					 	<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.dealercode']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3">${campaign.dealerCode}</td>
	       			</tr>
					 		
	       		</c:if>
	       		<c:if test="${!campaign.campaignComplete and campaign.completionCode != '01' and campaign.completionCode != '06'}">
	       			<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.spaCampaignstatus']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn31"><b>${campaign.campaignDescr}</b></td>
	       			</tr>
	       		</c:if>
	       		<c:if test="${!campaign.campaignComplete and (campaign.completionCode == '01' or campaign.completionCode == '06')}">
	       			<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.spaCampaignstatus']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3"><b>${campaign.campaignDescr}</b></td>
	       			</tr>
	       		</c:if>
	       		<c:if test="${!campaign.detailMemoEmpty}">
	       			<tr>
	        			<td class="campaignTblColumn1"><h:outputLabel value="#{msg['portlets.label.campaignmemo']}">:&nbsp;</h:outputLabel></td>
	        			<td class="campaignTblColumn2"><h:outputLabel value=""></h:outputLabel></td>
	        			<td class="campaignTblColumn3">${campaign.detailMemo}</td>
	       			</tr>
	       		
	       		</c:if>
	       		<tr>
	       			<td colspan="3" width="100%">
	       				<c:if test="${!campaign.documentListEmpty}">
	        				<table id="${campaign.rowIndex}:docSpan" style="border-width:1px;border-color:#666666;border-style:solid;" cellspacing="2" cellpadding="2" border="0" width="100%">
	        					<c:forEach items="${campaign.t3DocumentList}" var="document">
	        						<tr>
	        							<td>
	        								<a href="#" onclick="return false;" style="cursor: default;">
	        									${document.objectTitle}
	        								</a>
	        							</td>
	        						
	        						</tr>
	        					</c:forEach>
	        				</table>
	       				</c:if>
	       			</td>
	       		</tr>
	       		<tr>
	       			<td colspan="3" width="100%" class="rowDivider" >
							<h:graphicImage url="/resources/images/utils/clear.png" width="1" height="1"></h:graphicImage>
						</td>
	       		</tr>
	       	</c:forEach>
	       </table>
      	</c:if>
      	<h:panelGrid columns="1" width="100%" rendered="#{not empty spaCampaignControllerBean.servicecampaignVinVo && 
      				not empty spaCampaignControllerBean.servicecampaignVinVo.vinNumber  && (empty spaCampaignControllerBean.serviceCampaignsVO  ||  !spaCampaignControllerBean.serviceCampaignsVO.campaignsPresent)}">
	      	<h:panelGroup>
					<h:outputLabel value="#{msg['portlets.description.vehicleinformation']}" style="font-weight: normal;">&nbsp;</h:outputLabel>
	      			<h:outputText value="#{spaCampaignControllerBean.servicecampaignVinVo}" style="font-weight: bold;"/>
	      	</h:panelGroup>
		</h:panelGrid>
 			
</h:form>
        	
<style>
td.campaignTblColumn1 { 
    width: 13%;
    font-weight: bold;
    text-align: right;
    vertical-align: top;
    height: 5px;
    padding-bottom: 3px;
    
    
}
td.campaignTblColumn2 {
	width: 2%;
	vertical-align: top;
}
td.campaignTblColumn3 { 
    width: 85%;
    text-align: left;
    vertical-align: top;
}

td.campaignTblColumn31 { 
    width: 85%;
    color:#FF0000;
    text-align: left;
    vertical-align: top;
}

td.rowDivider{
	border-bottom:1px #cccccc solid;
}

.scrollerCell {
    padding-right: 10px;
    padding-left: 10px;
}



</style>
 
<script language="javascript">

function getCustomerSupportDataForPrint(){
	var cspContainerId = '${facesContext.viewRoot.id}:campaignForm';
	var cspContainer = document.getElementById(cspContainerId);
	var dataContent = cspContainer.innerHTML;
	return dataContent;
}

function show(id) {
	var obj = document.getElementById(id);
	if (obj != null && obj.style != null)
		obj.style.display = "block";
}

function hide(id) {
	
	var obj = document.getElementById(id);
	if (obj != null && obj.style != null)
		obj.style.display = "none";
}

</script>
