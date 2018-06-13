<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

 ques{
	 	
	 	color : black;
	 	
	 }
	 ans{
	 	padding-left : 2px;
	 	color : red;
	 	font-weight : bold;
	 }
.redBackground{
		background-color : #F08080;
		vertical-align : top;	
	}
	.greyBackground{
		background-color : #E8E8E8;
		vertical-align : top;		
	}
	.greenBackground{
		background-color : #90EE90;
		vertical-align : top;	
	}	
	.redBackgroundTable{
		border : 1px solid red;
	}
	.greyBackgroundTable{
		border : 1px solid #D0D0D0;
	}
	.greenBackgroundTable{
		border : 1px solid green;
	}
	.response{
		color: #990000;
		padding-left:15px;
		font-weight : bold;
	}
</style>


<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />

<h:form id="custSurveyFormPrint">

<!--Data Population -  Data table to get Sub Item Name -->
<h:dataTable styleClass="custSurveyTable" width="100%" value="#{paramValues.moduleName}" rendered="#{not  empty customerSurveyControllerBean.customerSurveyDetailsVOList}" var="moduleName" cellpadding="0" cellspacing="0">
	<h:column>	
	  <h:panelGroup layout="block" rendered="#{moduleName == msg['print.title.custsurvey']}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">	  	
		<h:dataTable  width="100%" value="#{paramValues.moduleName}" var="format" cellpadding="0" cellspacing="0">			
			<h:column>			
			<h:panelGroup layout="block" rendered="#{format == 'custShortForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
				<c:forEach var="surveyVo" items="#{customerSurveyControllerBean.customerSurveyDetailsVOList}">
					<h:outputText escape="false" value=" 
						<div class='#{facesContext.viewRoot.id}CUSTSURMIN' style='display:inline;'>
		          		<table class='#{surveyVo.customerSurveyVO.style}Table' cellpadding='3' cellspacing='0' width='#{customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\"}?100%:90%'>
		          					<thead>
									<tr class='#{surveyVo.customerSurveyVO.style}' >
										"/>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\"}">
											<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Guest</b></th>"/>
										</c:if>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
											<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Customer</b></th>"/>
										</c:if>
										<h:outputText escape="false" value="
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Response Date</b></th>
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Dealer</b></th>
										"/>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\"}">
											<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Service Consultant</b></th>"/>
										</c:if>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
											<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Service Advisor</b></th>"/>
										</c:if>
										<h:outputText escape="false" value="
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='15%'><b>Technician</b></th>
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Repair Date</b></th>
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>RO #</b></th>
										"/>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
											<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Mileage</b></th>"/>
										</c:if>
										<h:outputText escape="false" value="
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Overall Satisfaction</b></th>
										<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='5%'><b></b></th>
								</tr>
								<tr style='height:30px;'>
									<td align='center' width='10%'>#{surveyVo.customerSurveyVO.custFName}&nbsp;#{surveyVo.customerSurveyVO.custLName}</td>
									<td align='center' width='10%'>#{surveyVo.customerSurveyVO.responseDate}</td>
									<td style='color:blue;' align='center' width='10%'>#{surveyVo.customerSurveyVO.servicingDealerName} (#{surveyVo.customerSurveyVO.servicingDealerCode})</td>
									<td align='center' width='10%'>#{surveyVo.customerSurveyVO.serviceAdvisorName}</td>
									<td align='center' width='15%'>#{surveyVo.customerSurveyVO.serviceTechnicianName}</td>
									<td align='center' width='10%'>#{surveyVo.customerSurveyVO.roDate}</td>
									<td align='center' width='10%'>#{surveyVo.customerSurveyVO.roNumber}</td>
									"/>
									<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
										<h:outputText escape="false" value="<td align='center' width='10%'>#{surveyVo.customerSurveyVO.vehicleMileage}</td>"/>
									</c:if>
									<h:outputText escape="false" value="
									<td class='cond' align='center' width='10%'>#{surveyVo.customerSurveyVO.overallSatisfaction}</td>
									<td align='center' width='5%'>
									"/>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\" }">
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionLexus == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionLexus == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
										</c:if>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\"}">
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionToyota == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionToyota == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
										</c:if>
										<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionScion == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
											<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionScion == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
										</c:if>
									<h:outputText escape="false" value="
									
								</td>
								</tr>
								</thead>
								
					">
					</h:outputText>
					<h:outputText value="</table> </div> </br>" escape="false"/>
				</c:forEach>				
			</h:panelGroup>
			<h:panelGroup layout="block" rendered="#{format == 'custLongForm'}" style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">					
						<c:forEach var="surveyVo" items="#{customerSurveyControllerBean.customerSurveyDetailsVOList}">
							<h:outputText escape="false" value=" 
				
							<div class='#{facesContext.viewRoot.id}CUSTSURMAX' style='display:inline;'>
					          		<table class='#{surveyVo.customerSurveyVO.style}Table' cellpadding='3' cellspacing='0' width='#{customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}?100%:90%'>
					          					<thead>
												<tr class='#{surveyVo.customerSurveyVO.style}' >
													"/>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\"}">
														<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Guest</b></th>"/>
													</c:if>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
														<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Customer</b></th>"/>
													</c:if>
													<h:outputText escape="false" value="
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Response Date</b></th>
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Dealer</b></th>
													"/>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\"}">
														<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Service Consultant</b></th>"/>
													</c:if>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
														<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Service Advisor</b></th>"/>
													</c:if>
													<h:outputText escape="false" value="
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='15%'><b>Technician</b></th>
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Repair Date</b></th>
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>RO #</b></th>
													"/>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
														<h:outputText escape="false" value="<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='10%'><b>Mileage</b></th>"/>
													</c:if>
													<h:outputText escape="false" value="	
													<th class='#{surveyVo.customerSurveyVO.style}tr'  align='center' width='10%'><b>Overall Satisfaction</b></th>
													<th class='#{surveyVo.customerSurveyVO.style}tr' align='center' width='5%'><b></b>
														
													</th>
												</tr>
												<tr style='height:30px;'>
													<td align='center' width='10%'>#{surveyVo.customerSurveyVO.custFName}&nbsp;#{surveyVo.customerSurveyVO.custLName}</td>
													<td align='center' width='10%'>#{surveyVo.customerSurveyVO.responseDate}</td>
													<td style='color:blue;' align='center' width='10%'>#{surveyVo.customerSurveyVO.servicingDealerName} (#{surveyVo.customerSurveyVO.servicingDealerCode})</td>
													<td align='center' width='10%'>#{surveyVo.customerSurveyVO.serviceAdvisorName}</td>
													<td align='center' width='15%'>#{surveyVo.customerSurveyVO.serviceTechnicianName}</td>
													<td align='center' width='10%'>#{surveyVo.customerSurveyVO.roDate}</td>
													<td align='center' width='10%'>#{surveyVo.customerSurveyVO.roNumber}</td>
													"/>
													<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}">
														<h:outputText escape="false" value="<td align='center' width='10%'>#{surveyVo.customerSurveyVO.vehicleMileage}</td>"/>
													</c:if>
													<h:outputText escape="false" value="
													<td class='cond' align='center' width='10%'>#{surveyVo.customerSurveyVO.overallSatisfaction}</td>
													<td align='center' width='5%'>
													"/>
															<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\" }">
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionLexus == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionLexus == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
															</c:if>
															<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" }">
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionToyota == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionToyota == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
															</c:if>
															<c:if test="${customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\" }">
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionScion == 2}" value="/resources/images/customerSurveySad.jpg"></h:graphicImage>
																<h:graphicImage height="30px" width="30px" rendered="#{surveyVo.customerSurveyVO.overallSatisfactionScion == 1}" value="/resources/images/customerSurveySmile.jpg"></h:graphicImage>
															</c:if>
													<h:outputText escape="false" value="
												
												</td>
												</tr>
												</thead>
										
												<tr>
												"/>
												<h:outputText  rendered="#{customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\" || customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\"}" escape="false" value="
													<td colspan='10'><table width='100%'>
												"></h:outputText>
												<h:outputText  rendered="#{customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\"}" escape="false" value="
													<td colspan='9'><table width='100%'>
												"></h:outputText>
														<h:panelGroup >
															<c:forEach var="surveyResponse" items="#{surveyVo.surveyResponses}">
																<h:outputText escape="false" value="
																	<tr>
																		<td><font color='black'>#{surveyResponse.quesNo}. #{surveyResponse.quesTxt}</font></td>
																	</tr>
																	<tr class='response'>
																		<td>#{surveyResponse.quesResponse}</td>
																	</tr>
																"></h:outputText>
														
															</c:forEach>
														</h:panelGroup>
															
														<h:outputText escape="false" value="
														</table>
													</td>
												</tr>
											</table>
										</div>
										</br>
									"></h:outputText>
						</c:forEach>
			</h:panelGroup>			
			</h:column>
			</h:dataTable>	
		  </h:panelGroup>			
		</h:column>
	</h:dataTable>
<h:panelGroup rendered="#{not empty customerSurveyControllerBean.vinVo &&  not empty customerSurveyControllerBean.vinVo.vinNumber && (customerSurveyControllerBean.customerSurveyDetailsVOList == null ||  empty customerSurveyControllerBean.customerSurveyDetailsVOList) && not customerSurveyControllerBean.lexusDealer }">
	<h:outputText value="#{msg['portlets.survey.noResponseNote'] } "></h:outputText><h:outputText value="#{customerSurveyControllerBean.vinVo.vinNumber}"></h:outputText>
	<h:outputText rendered="#{person.dealerCode != null}" value=" at the dealership: "/>
	<h:outputText style="color:blue;" value="#{customerSurveyControllerBean.personDealerName} (#{person.dealerCode})" rendered="#{not empty customerSurveyControllerBean.personDealerName && not empty person.dealerCode}"></h:outputText>
</h:panelGroup>
<h:panelGroup rendered="#{not empty customerSurveyControllerBean.vinVo &&  not empty customerSurveyControllerBean.vinVo.vinNumber  && (customerSurveyControllerBean.customerSurveyDetailsVOList == null ||  empty customerSurveyControllerBean.customerSurveyDetailsVOList) && (customerSurveyControllerBean.lexusDealer && customerSurveyControllerBean.lexusSurveyOn)}">
	<h:outputText value="#{msg['portlets.survey.noResponseNote'] } "></h:outputText><h:outputText value="#{customerSurveyControllerBean.vinVo.vinNumber}"></h:outputText>
	<h:outputText rendered="#{person.dealerCode != null}" value=" at the dealership: "/>
	<h:outputText style="color:blue;" value="#{customerSurveyControllerBean.personDealerName} (#{person.dealerCode})"  rendered="#{not empty customerSurveyControllerBean.personDealerName && not empty person.dealerCode}"></h:outputText>
</h:panelGroup>

<ul>
<h:panelGroup rendered="#{not empty customerSurveyControllerBean.vinVo &&  not empty customerSurveyControllerBean.vinVo.vinNumber  && (customerSurveyControllerBean.customerSurveyDetailsVOList == null ||  empty customerSurveyControllerBean.customerSurveyDetailsVOList) && (customerSurveyControllerBean.lexusDealer && not customerSurveyControllerBean.lexusSurveyOn)}">
	<li><h:outputText value="#{msg['portlets.survey.tabFeatureNote'] }"></h:outputText>	</li>
	<li><h:outputText value="#{msg['portlets.survey.turnOFFNote'] }"></h:outputText>
		<h:outputLabel  value="#{customerSurveyControllerBean.formattedAdminNames}"></h:outputLabel>
		<h:outputText escape="false" value="&nbsp;#{msg['portlets.survey.accessNote'] }"></h:outputText>	
	</li>
</h:panelGroup>
<h:panelGroup rendered="#{customerSurveyControllerBean.vinSearchResultVO.division != null && not empty customerSurveyControllerBean.vinSearchResultVO.division && ((customerSurveyControllerBean.lexusDealer && customerSurveyControllerBean.vinSearchResultVO.division == \"LEXUS\")||(customerSurveyControllerBean.lexusDealer &&  (customerSurveyControllerBean.vinSearchResultVO.division == \"SCION\" || customerSurveyControllerBean.vinSearchResultVO.division == \"TOYOTA\")))}">
	<h:panelGroup rendered="#{customerSurveyControllerBean.lexusSurveyOn}">
	<li>
		<h:outputLabel  value="#{msg['portlets.survey.turnOFFContactNote'] } "></h:outputLabel>
		<h:outputLabel  value="#{customerSurveyControllerBean.formattedAdminNames}"></h:outputLabel>&nbsp;&nbsp;		
	</li>
	</h:panelGroup>	
</h:panelGroup>
<h:panelGroup rendered="#{customerSurveyControllerBean.vinSearchResultVO.division != null && not empty customerSurveyControllerBean.vinSearchResultVO.division && customerSurveyControllerBean.lexusDealer && customerSurveyControllerBean.lastUpdatedUserNote != null}">
	<li>
		<h:outputLabel value="#{customerSurveyControllerBean.lastUpdatedUserNote}"></h:outputLabel>
	</li>
</h:panelGroup>
</ul>
</h:form>