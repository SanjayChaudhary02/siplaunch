<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="/serviceLane/pages/asm/serviceCampaign/serviceCampaignCSS.css" />
<script type="text/javascript"
	src="/serviceLane/pages/asm/serviceCampaign/serviceCampaignJS.js"></script>
	<script
	src="${facesContext.externalContext.requestContextPath}/framework/skins/t3/js/jquery.js"></script>
	
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />


	<h:form id="campaignForm">
		<h:panelGrid columns="1" width="100%"
			rendered="#{not empty serviceCampaignControllerBean.servicecampaignVinVo  && 
						not empty serviceCampaignControllerBean.servicecampaignVinVo.vinNumber && !serviceCampaignControllerBean.serviceCampaignsVO.campaignsPresent }">
			<h:panelGroup>
				<h:outputLabel
					value="#{msg['portlets.description.vehicleinformation']}" style="font-weight: normal;">&nbsp;</h:outputLabel>
				<h:outputText
					value="#{serviceCampaignControllerBean.servicecampaignVinVo}"
					style="font-weight: bold;" />
			</h:panelGroup>
		</h:panelGrid>
		
		<h:dataTable
			value="#{serviceCampaignControllerBean.serviceCampaignsVO.serviceCampaigns}"
			var="campaign" id="campaignList"
			rendered="#{serviceCampaignControllerBean.serviceCampaignsVO.campaignsPresent}" width="100%">
			<h:column>

				<h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3">
					<h:outputLabel value="#{msg['portlets.label.campaigndescription']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.campaignTitle}" />
				</h:panelGrid>
	           <h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3"
					rendered="#{!campaign.campaignStatusEmpty}">
					<h:outputLabel value="#{msg['portlets.label.campaignStatusDesc']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.campaignStatus}" />
				</h:panelGrid>
				 <h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3"
					rendered="#{campaign.expirationDate!=null}">
					<h:outputLabel value="#{msg['portlets.label.expirydate']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.expirationDate}" />
	
				</h:panelGrid>

				<h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3"
					rendered="#{campaign.campaignComplete}">
					<h:outputLabel value="#{msg['portlets.label.campaignstatus']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.campaignDescr}"
						style="font-weight: bold;" />

					<h:outputLabel value="#{msg['portlets.label.dateofservice']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.dateOfService}" />

					<h:outputLabel value="#{msg['portlets.label.dealername']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.dealerName}" style="color : blue;" />

					<h:outputLabel value="#{msg['portlets.label.dealercode']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.dealerCode}" style="color : blue;"/>

				</h:panelGrid>

				<h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn31"
					rendered="#{!campaign.campaignComplete and campaign.completionCode != '01' and campaign.completionCode != '10' and campaign.completionCode != '06'}">
					<h:outputLabel value="#{msg['portlets.label.campaignstatus']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.campaignDescr}"
						style="font-weight: bold;" />
				</h:panelGrid>
				<h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3"
					rendered="#{!campaign.campaignComplete and (campaign.completionCode == '01' or campaign.completionCode == '10' or campaign.completionCode == '06')}">
					<h:outputLabel value="#{msg['portlets.label.campaignstatus']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.campaignDescr}"
						style="font-weight: bold;" />
				</h:panelGrid>

				<h:panelGrid columns="3" width="100%"
					columnClasses="campaignTblColumn1, campaignTblColumn2, campaignTblColumn3"
					rendered="#{!campaign.detailMemoEmpty}">
					<h:outputLabel value="#{msg['portlets.label.campaignmemo']}">:&nbsp;</h:outputLabel>
					<h:outputLabel value=""></h:outputLabel>
					<h:outputText value="#{campaign.detailMemo}" />
				</h:panelGrid>


				<h:dataTable value="#{campaign.t3DocumentList}" var="document"
					id="docSpan"
					style="border-width:1px;border-color:#666666;border-style:solid;"
					cellspacing="2" cellpadding="2" border="0" width="100%"
					rendered="#{!campaign.documentListEmpty}">
					<h:column>
						<h:outputLink 
							onclick="return false;" style="cursor: default;">
							<h:outputText value="#{document.objectTitle}" />
						</h:outputLink>
					</h:column>
				</h:dataTable>


			<h:panelGrid columns="1" width="100%"
				rendered="#{campaign.certificateDetailVO != null}">
				<h:panelGroup style="width:90%;">
					<h:outputText value="Tech Cert Requirements:"
						style="font-weight:bold;"></h:outputText>
					<br />
					<br />
					<h:panelGroup layout="block" style="width:95%; padding-left:50px;"
						id="techPanel" styleClass="techPanel">
						<h:panelGroup
							rendered="#{campaign.certificateDetailVO.divison == \"Lexus\" || campaign.certificateDetailVO.divison == \"LEXUS\"}">
							<table class="techTable" cellspacing="0" cellpadding="0">
								<tr>

									<th align="Center"><h:outputText value="Certified"></h:outputText>
									</th>
									<th align="Center"><h:outputText value="Senior"></h:outputText></th>
									<th align="Center"><h:outputText value="Master"></h:outputText></th>
									<th><h:outputText value="Diagnostic Specialist"></h:outputText>
									</th>
									<th align="Center"><h:outputText value="Special Courses"></h:outputText>
									</th>
									<th align="Center"><h:outputText value="Addnl Info"></h:outputText>
									</th>
								</tr>


								<tr class="certDetailsRow">
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png" height="15px" width="15px"
											rendered="#{campaign.certificateDetailVO.certifiedAreaCodes != null && campaign.certificateDetailVO.certifiedAreaCodes != ''}"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasSenior}" height="15px" width="15px"></h:graphicImage></td>

									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasMaster }" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasDiagnosticsSplt }" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:outputText
											value="#{ campaign.certificateDetailVO.specialCources}"></h:outputText></td>
									<td class="techTableInfoRow" align="Center"><h:outputText
											value="#{ campaign.certificateDetailVO.additonalInfo}"></h:outputText></td>
								<tr>
							</table>
						</h:panelGroup>

						<h:panelGroup
							rendered="#{!(campaign.certificateDetailVO.divison == \"Lexus\" || campaign.certificateDetailVO.divison == \"LEXUS\")}">
							<table class="techTable" cellspacing="0" cellpadding="0">
								<tr>
									<th align="Center" rowspan="2"><h:outputText value="Maint"></h:outputText></th>
									<th align="Center" colspan="4"><h:outputText
											value="Certified"></h:outputText></th>
									<th align="Center" colspan="5"><h:outputText
											value="Expert"></h:outputText></th>
									<th align="Center" rowspan="2"><h:outputText
											value="Master"></h:outputText></th>
									<th align="Center" rowspan="2"><h:outputText value="MDT"></h:outputText></th>
									<th align="Center" rowspan="2"><h:outputText
											value="Special Courses"></h:outputText></th>
									<th align="Center" rowspan="2"><h:outputText
											value="Addnl Info"></h:outputText></th>
								</tr>

								<tr>


									<td align="Center"><h:outputText value="EG"></h:outputText></td>
									<td align="Center"><h:outputText value="DT"></h:outputText></td>
									<td align="Center"><h:outputText value="CH"></h:outputText></td>
									<td align="Center"><h:outputText value="EL"></h:outputText></td>

									<td align="Center"><h:outputText value="EG"></h:outputText></td>
									<td align="Center"><h:outputText value="DT"></h:outputText></td>
									<td align="Center"><h:outputText value="CH"></h:outputText></td>
									<td align="Center"><h:outputText value="EL"></h:outputText></td>
									<td align="Center"><h:outputText value="HY"></h:outputText></td>

								</tr>
								<tr class="certDetailsRow">
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasMaintenance}" height="15px" width="15px" ></h:graphicImage></td>

									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.certifiedCertVo.hasEG}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.certifiedCertVo.hasDT}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.certifiedCertVo.hasCH}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.certifiedCertVo.hasEL}" height="15px" width="15px"></h:graphicImage></td>

									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.expertCertVo.hasEG}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.expertCertVo.hasDT}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.expertCertVo.hasCH}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.expertCertVo.hasEL}" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.expertCertVo.hasHY}" height="15px" width="15px"></h:graphicImage></td>

									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasMaster }" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:graphicImage
											url="/resources/images/tickMark.png"
											rendered="#{campaign.certificateDetailVO.hasDiagnosticsSplt }" height="15px" width="15px"></h:graphicImage></td>
									<td class="techTableInfoRow" align="Center"><h:outputText
											value="#{ campaign.certificateDetailVO.specialCources}"></h:outputText></td>
									<td class="techTableInfoRow" align="Center"><h:outputText
											value="#{ campaign.certificateDetailVO.additonalInfo}"></h:outputText></td>
								<tr>
							</table>
						</h:panelGroup>

						<br />

						<h:panelGroup
							rendered="#{serviceCampaignControllerBean.displayTechList }">
							<h:panelGroup layout="block" id="viewEligibleTechLink"
								rendered="#{!campaign.expanded }" style="">
								<h:outputText style="text-align:right; color:blue;"
									value="[Show Eligible Techs]"></h:outputText>
							</h:panelGroup>
							<h:panelGroup layout="block" id="hideEligibleTechLink"
								rendered="#{campaign.expanded }">
								<h:outputText style="text-align:right; color:blue;"
									value="[Hide Eligible Techs]"></h:outputText>
								<h:panelGroup layout="block"
									rendered="#{campaign.technicianList == null}">
									<br />
									<br />

									<c:choose>
									
										<c:when
											test="${serviceCampaignControllerBean.lexusDealer && serviceCampaignControllerBean.vinSearchResultVO.division != 'LEXUS' }">
											
											
											<h:outputText style="text-align:right; color:red;"
												value="Lexus dealers are not authorized to perform campaign repairs on Toyota/Scion vehicles."></h:outputText>
										</c:when>
										<c:when
											test="${serviceCampaignControllerBean.toyotaDealer && ( serviceCampaignControllerBean.vinSearchResultVO.division == 'LEXUS' || serviceCampaignControllerBean.vinSearchResultVO.division == 'Lexus')}">
											
											<h:outputText style="text-align:right; color:red;"
												value="Toyota dealers are not authorized to perform campaign repairs on Lexus vehicles."></h:outputText>
										</c:when>
										<c:otherwise>
											<h:outputText style="text-align:right; color:red;"
												value="Unable to find technician information for the dealership: "></h:outputText>
											<h:outputText escape="false"
												style="text-align:right; color:red;"
												rendered="#{serviceCampaignControllerBean.person != null}"
												value="#{serviceCampaignControllerBean.person.dealerCode}&nbsp;"></h:outputText>
											

										</c:otherwise>
									</c:choose>
								</h:panelGroup>
							</h:panelGroup>


							<h:panelGroup layout="block" id="techDetailsDiv"
								rendered="#{campaign.technicianList != null}">
								<br />
								<h:dataTable var="techList" value="#{campaign.technicianList}"
									width="70%" rowClasses="techListRow1,techListRow2"
									styleClass="techListDataTable"
									columnClasses="rowData1,rowData2,rowData3,rowData4,rowData5">
									<h:column>
										<f:facet name="header">
											<h:outputText value="#" />
										</f:facet>
										<h:outputText value="#{techList.row }"></h:outputText>
									</h:column>
									<h:column>
										<f:facet name="header">
											<h:outputText value="Name" />
										</f:facet>

										<h:outputText value="#{techList.techName }"
											style="color:blue;"></h:outputText>

									</h:column>
									<h:column>
										<f:facet name="header">
											<h:outputText value="Last 4 of SPIN" />
										</f:facet>
										<h:outputText value="#{techList.trucatedSpin }"></h:outputText>
									</h:column>
									<h:column>
										<f:facet name="header">
											<h:outputText value="Experience" />
										</f:facet>
										<h:outputText escape="false"
											value="#{techList.experienceMonths }&nbsp; Months"></h:outputText>
									</h:column>
									<h:column>
										<f:facet name="header">
											<h:outputText value="Certification" />
										</f:facet>
										<h:outputText value="#{techList.certification }"></h:outputText>
									</h:column>
								</h:dataTable>

							</h:panelGroup>
						</h:panelGroup>
					</h:panelGroup>
				</h:panelGroup>
			</h:panelGrid>


				<h:panelGrid columns="1" width="100%" columnClasses="rowDivider">
					<h:graphicImage url="/resources/images/utils/clear.png" width="1"
						height="1"></h:graphicImage>
				</h:panelGrid>
			</h:column>
		</h:dataTable>
		</h:form>

<style>
td.campaignTblColumn1 {
	width: 13%;
	font-weight: bold;
	text-align: right;
	vertical-align: top;
	height: 5px;
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
	color: #FF0000;
	text-align: left;
	vertical-align: top;
}

td.rowDivider {
	border-bottom: 1px #cccccc solid;
}
</style>
<script language="javascript">
function ${facesContext.viewRoot.id}_show(id) {
		var container = '${facesContext.viewRoot.id}:campaignForm';
		var obj = document.getElementById(container+ ':'
				+ 'campaignList:' + id);
		if (obj != null && obj.style != null)
			obj.style.display = "block";
	}

function ${facesContext.viewRoot.id}_hide(id) {
		var container = '${facesContext.viewRoot.id}:campaignForm';
		var obj = document.getElementById(container + ':'
				+ 'campaignList:' + id);
		if (obj != null && obj.style != null)
			obj.style.display = "none";
	}
	
$(document).ready(function() {			
	    $('tr.certDetailsRow').find('td.techTableInfoRow').each(function() {			
	        if ($(this).html() == " ") $(this).css("background", "#b6b0b0");			
	        if ($(this).html() == "") $(this).css("background", "#b6b0b0");			
	        if ($(this).html() == "&nbsp;") $(this).css("background", "#b6b0b0");			
	    });			
	});
</script>
