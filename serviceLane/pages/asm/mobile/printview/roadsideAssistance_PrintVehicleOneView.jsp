<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h:form id="roadsideAssistanceForm">
 <c:if test="${roadsideAssistanceContollerBean.vinVO.vinNumber != null && not empty roadsideAssistanceContollerBean.vinVO.vinNumber}">
	<h:panelGrid border="0" cellpadding="0" cellspacing="0" width="97%" style="text-align: right;">
	<h:panelGrid columns="2" columnClasses="headerColumn1,headerColumn2" style="width: 100%;">
		<h:outputLabel value="#{msg['portlets.roadsideAssistance.programSubscriptions']}" styleClass="headerlabel"></h:outputLabel>
		<h:panelGroup style="text-align: right; width: 100%;" rendered="#{roadsideAssistanceContollerBean.roadsideAssistanceVo != null && not empty roadsideAssistanceContollerBean.roadsideAssistanceVo.roadsideAssistanceList}">
			<h:outputLabel value="#{msg['portlets.warranty.description.mileage']}" style="font-weight:bold">&nbsp;</h:outputLabel>
			<h:outputText value="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.mileage}" rendered="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.mileage != '0'}"/>
			<h:outputText value="0" rendered="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.mileage == '0'}"/>
		</h:panelGroup>
	</h:panelGrid>
	
	<h:panelGroup layout="block" style="text-align: left;"
			rendered="#{roadsideAssistanceContollerBean.roadsideAssistanceVo != null && not empty roadsideAssistanceContollerBean.roadsideAssistanceVo.roadsideAssistanceList}">
				
				<h:dataTable id="roadsideAssistanceDetails"  rendered="#{not empty roadsideAssistanceContollerBean.roadsideAssistanceVo.roadsideAssistanceList}"
					var="roadsideAssistanceDetails" cellspacing="0" cellpadding="2" styleClass="roadsideAssistancetable"
					value="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.roadsideAssistanceList}"
					width="97%">
					<h:column headerClass="EffDate">
						<f:facet name="header" >
							<h:outputText 
								value="#{msg['portlets.asm.roadsideassist.provider']} " />
						</f:facet>
						<h:outputText value="#{roadsideAssistanceDetails.provider}" styleClass="Cntralign" />
					</h:column>
					<h:column headerClass="PrgmName">
						<f:facet name="header" >
							<h:outputText 
								value="#{msg['portlets.asm.roadsideassist.programname']}" />
						</f:facet>
						<h:outputText value="#{roadsideAssistanceDetails.programName}"  />
					</h:column>
					<h:column headerClass="PrgmDsc">
						<f:facet name="header" >
							<h:outputText
								value="#{msg['portlets.asm.roadsideassist.programdesc']}" />
						</f:facet>
						<h:outputText value="#{roadsideAssistanceDetails.programDescription}" rendered="#{roadsideAssistanceDetails.programDescription!=null}"/>
						<h:outputText value="Info not available" rendered="#{roadsideAssistanceDetails.programDescription==null}" />
					</h:column>
					<h:column headerClass="EffDate">
						<f:facet name="header">
							<h:outputText value="#{msg['portlets.asm.roadsideassist.effectivedate']}" />
						</f:facet>
						<h:outputText value="#{roadsideAssistanceDetails.effectiveDate}" styleClass="Cntralign"/>
					</h:column>
					<h:column headerClass="EffDate">
						<f:facet name="header">
							<h:outputText value="#{msg['portlets.asm.roadsideassist.expirationdate']}" />
						</f:facet>
						<h:outputText value="#{roadsideAssistanceDetails.expirationDate}" styleClass="Cntralign" />
					</h:column>
					<h:column headerClass="EffDate">
						<f:facet name="header">
							<h:outputText
								value="#{msg['portlets.asm.roadsideassist.status']}"/>
						</f:facet>
						<h:outputText 
								rendered="#{(roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' 
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin) && (roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage != null
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage > 100000)}" 
									value="INACTIVE" styleClass="Cntralign" style="font-weight: bolder;color: red;" />
						<h:outputText 
								rendered="#{(roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' 
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin) && (roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage != null
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage <= 100000)
											&& (roadsideAssistanceDetails.expired)}" 
									value="INACTIVE" styleClass="Cntralign" style="font-weight: bolder;color: red;" />
						<h:outputText 
								rendered="#{(roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' 
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin) && (roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage != null
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.lastKnownMileage <= 100000)
											&& !(roadsideAssistanceDetails.expired)}" 
									value="ACTIVE"  styleClass="Cntralign" style="font-weight: bolder;color: green;" />
						<h:outputText 
							rendered="#{!(roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' 
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin) &&
											(roadsideAssistanceDetails.status == 'Active' || roadsideAssistanceDetails.status == 'ACTIVE')}" 
								value="#{roadsideAssistanceDetails.status}" styleClass="Cntralign" style="font-weight: bolder;color: green;" />
						<h:outputText 
							rendered="#{!(roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' 
											&& roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin) &&
										(roadsideAssistanceDetails.status == 'Inactive' || roadsideAssistanceDetails.status == 'INACTIVE')}" 
							value="#{roadsideAssistanceDetails.status}"  styleClass="Cntralign" style="font-weight: bolder;color: red;" />
						
					</h:column>
				</h:dataTable>
				<h:panelGrid columns="3" rendered="#{roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' || roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' && roadsideAssistanceContollerBean.roadsideAssistanceVo.tcuvVin}">
			<h:outputLabel value="#{msg['portlets.asm.roadsideassist.lcpoVehicle']}" styleClass="LcpoLblNote"> &nbsp;&nbsp; </h:outputLabel>
			<h:outputText value="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.lcpoCustFirstName}" styleClass="FirstLastName"></h:outputText>
			<h:outputText value="#{roadsideAssistanceContollerBean.roadsideAssistanceVo.lcpoCustLastName}" styleClass="FirstLastName" ></h:outputText>
			</h:panelGrid>
			
			<table cellpadding="0" cellpadding="0" width="100%"
									class="rdTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.asm.roadsideassist.screennote']}"></h:outputLabel>
										</td>
									</tr>
			</table>
		<table cellpadding="0" cellpadding="0" width="100%"
								class="rdTableBorder">
								<tr>
									<td style="padding: 0px 25px 0px 10px; text-align: left">
										<ul>
											
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.gulfstates']}"></h:outputLabel>
											</li>
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.lexusroadside']}"></h:outputLabel>
											</li>
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.toyotaroadside']}"></h:outputLabel>
											</li>
										</ul>

									</td>
								</tr>
			</table>
			</h:panelGroup>
			</h:panelGrid>
			
	<h:panelGroup layout="block"
			style="padding-left:15px;" rendered="#{roadsideAssistanceContollerBean.roadsideAssistanceVo == null 
				|| ( roadsideAssistanceContollerBean.roadsideAssistanceVo != null && empty roadsideAssistanceContollerBean.roadsideAssistanceVo.roadsideAssistanceList)}">
		<br/>
		<h:outputLabel 	value="#{msg['portlets.asm.roadsideassist.nodata']}" styleClass="errormsg" style="font-weight:normal;">&nbsp;</h:outputLabel>
		<h:outputText value="#{roadsideAssistanceContollerBean.vinVO.vinNumber}" style="font-weight:bold;"/>
		
		<br/>
		<br/>
			<table cellpadding="0" cellpadding="0" width="100%"
									class="rdTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.asm.roadsideassist.screennote']}"></h:outputLabel>
										</td>
									</tr>
			</table>
		<table cellpadding="0" cellpadding="0" width="100%"
								class="rdTableBorder">
								<tr>
									<td style="padding: 0px 25px 0px 10px; text-align: left">
										<ul>
											
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.gulfstates']}"></h:outputLabel>
											</li>
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.lexusroadside']}"></h:outputLabel>
											</li>
											<li><h:outputLabel
													value="#{msg['portlets.asm.roadsideassist.screennote.toyotaroadside']}"></h:outputLabel>
											</li>
										</ul>

									</td>
								</tr>
			</table>
	</h:panelGroup> </br>
	<h:panelGroup style="padding-left:15px;" rendered="#{roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' ||roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' && roadsideAssistanceContollerBean.vinSearchResultVO.dofu == null && empty roadsideAssistanceContollerBean.vinSearchResultVO.dofu}" >
		<br/>
		<h:outputLabel 	value="#{msg['portlets.asm.roadsideassist.nodofu']}" style="margin:auto 0.80%;font-weight: normal;">&nbsp;</h:outputLabel>
		<h:outputText value="#{roadsideAssistanceContollerBean.vinVO.vinNumber}" /> </br>
		<h:outputLabel 	value="#{msg['portlets.asm.roadsideassist.nolcpodofu']}" style="margin:auto 0.80%;font-weight: normal;">&nbsp;</h:outputLabel>
	</h:panelGroup>
	<h:panelGroup style="padding-left:15px;" rendered="#{roadsideAssistanceContollerBean.vinSearchResultVO.division == 'Lexus' ||roadsideAssistanceContollerBean.vinSearchResultVO.division == 'LEXUS' && roadsideAssistanceContollerBean.vinSearchResultVO.dofu == null && empty roadsideAssistanceContollerBean.vinSearchResultVO.dofu && roadsideAssistanceContollerBean.roadsideAssistanceVo.certifiedDofuEmpty}" >
		<br/>
		<h:outputLabel 	value="#{msg['portlets.asm.roadsideassist.nodofu']}" style="margin:auto 0.80%;font-weight: normal;">&nbsp;</h:outputLabel>
		<h:outputText value="#{roadsideAssistanceContollerBean.vinVO.vinNumber}" /> </br>
		<h:outputLabel 	value="#{msg['portlets.asm.roadsideassist.nolcpodofu']}" style="margin:auto 0.80%;font-weight: normal;">&nbsp;</h:outputLabel>
	</h:panelGroup>
	
	<br/>
	<c:if test="${null != vinSearchResultVO and vinSearchResultVO.division != null}">
		<jsp:include page="/pages/asm/roadsideAssistance/roadsideAssistanceHistory.jsp"></jsp:include>
	</c:if>
</c:if>
</h:form>

<style>
	.roadsideAssistancetable,.roadsideAssistancetable th,.roadsideAssistancetable td {
		border: 1px solid #000;
	}
	.roadsideAssistancetable{
		margin-top: 15px !important;
		margin: auto;
	}
	.roadsideAssistancetable th {
		background-color: #E8E8E8;
	}
	.PrgmName{
		text-align:center;
		width:15%;
	}
	.PrgmDsc{
		text-align:center;
		width:50%;
	}
	.EffDate{
		text-align:center;
	  	width:10%;
	}
	.Status{
		text-align:center;
		width:8%;
	}
	.Cntralign{
		width: 100%;
		float:left;
		text-align:center;
	}
	.LblNote{
		width:97%;
		margin:auto 1.5%;
		margin-top:5px;
		float:left;
	}
	.LblNote1{
		width:97%;
		margin:auto 1.5%;
		float:left;
	}
	
	.LcpoLblNote{
		width:100%;
		margin:auto 6%;
		margin-top:5px;
		float:left;
	}
	.FirstLastName{
	margin-top:5px;
	float:left;
	width:100%;
	}
	
	.headerlabel{
	font-size: 15px;
	font-weight: bold;
	text-decoration: underline;
	padding-left: 15px;
	}	
	
	.headerColumn1{
		width: 50%;
		text-align: left;
	}
	
	.headerColumn2{
		width: 50%;
		text-align: right;
	}
	
	</style>