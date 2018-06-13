<%@ page language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
	var="msg" />
<style>
.tfsTablewithBorder {
	border: 1px solid black;
}

.tableColumnBottomBorder {
	padding: 3px 3px;
	border-bottom: 1px solid black;
}

.tableColumnBorder {
	padding: 3px 3px;
	border: 1px solid black;
}
.tfstbl_wrapper
{
width:100%;
background-color:white;
font-family: Verdana,Arial,Helvetica,sans-serif;
font-size: 11px;
text-align: center;
}
</style>
<h:form id="tfsProductsPrintForm">

	<!--Data Population -  Data table to get Sub Item Name -->
	<h:dataTable width="100%" value="#{paramValues.moduleName}"
		var="moduleName" cellpadding="0" cellspacing="0">

		<h:column>
			<h:panelGroup layout="block"
				rendered="#{moduleName == msg['print.title.fsprod']}"
				style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
				<h:dataTable width="100%" value="#{paramValues.moduleName}"
					var="format" cellpadding="0" cellspacing="0">
					<h:column>
						<h:panelGroup layout="block"
							rendered="#{format == 'tfsShortForm'}"
							style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
							<c:if
								test="${tfsProductsControllerBean.tfsProductsVO != null && not empty tfsProductsControllerBean.tfsProductsVO.tfsProductsList}">
								<c:set
									value="${tfsProductsControllerBean.tfsProductsVO.tfsProductsList}"
									var="tfsProductsList"></c:set>
								<table class="tfstbl_wrapper">
									<tr>
										<td class="tfs_tbl" width="80%"><c:if
												test="${not empty tfsProductsList}">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0" class="tfsTableBorder">
													<tr>
														<td style="padding: 0px 25px 0px 10px; text-align: right;">
															<h:panelGroup>
																<h:inputHidden
																	value="#{tfsProductsControllerBean.tfsProductsVO.mileage}"></h:inputHidden>
																<h:outputLabel value="Last Known Mileage:"
																	style="font-weight:bold">&nbsp;</h:outputLabel>
																<h:outputLabel
																	value="#{tfsProductsControllerBean.tfsProductsVO.mileage}"></h:outputLabel>


															</h:panelGroup>

														</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td style="padding: 0px 25px 0px 10px;"><c:forEach
																items="#{tfsProductsControllerBean.tfsProductsVO.tfsProductsList}"
																var="item">

																<div class="${facesContext.viewRoot.id}TFSPRODMIN"
																	style="display: inline;">
																	<table id="tfsListForm" cellspacing="0" cellpadding="0"
																		width="100%" class="tfsTablewithBorder">
																		<tr style="background-color: #BDBDBD;">
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="Provider" /></td>
																			<td width="3%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.producttype']}" />
																			</td>
																			<td width="15%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productdesc']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productid']}" />
																			</td>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.plancode']}" />
																			</td>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productstatus']}" />
																			</td>
																			<td width="9%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.effectivedate']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.expirydate']}" />
																			</td>
																			<td width="8%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.expirationmileage']}" />
																			</td>
																			<c:if
																				test="${tfsProductsControllerBean.allowedUser }">
																				<td width="10%" class="tableColumnBottomBorder"
																					style="font-weight: bold;"><h:outputLabel
																						value="#{msg['portlets.tfsproducts.purchaser']}" />
																				</td>
																			</c:if>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.sellerdealercode']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.validitystatus']}" />
																			</td>
																			
																			<td width="2%" class="tableColumnBottomBorder"></td>
																			
																		</tr>

																		<tr>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.provider}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productType}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productDesc}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productId}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.planCode}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productStatus}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.effectiveDate}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.expiryDate}" /></td>
																			<td class="tableColumn"><c:choose>
																					<c:when test="${item.provider == 'SET' && item.expirationMileageInt == 99999999}">
																						<h:outputLabel value="Unlimited" />	
																					</c:when>
																					<c:when
																						test="${empty item.expirationMileage || item.expirationMileageInt == 0}">
																						<h:outputLabel value="N/A" />
																					</c:when>
																					<c:otherwise>
																						<h:outputLabel value="#{item.expirationMileage}" />
																					</c:otherwise>
																				</c:choose></td>
																			<c:if
																				test="${tfsProductsControllerBean.allowedUser }">
																				<td class="tableColumn"><c:if
																						test="${null != item.purchaserId}">
																						<b style="color: blue">${item.purchaser}</b>
																					</c:if> <c:if test="${null == item.purchaserId}">
																		${item.purchaser}
																</c:if></td>
																			</c:if>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.sellingDealerName} (#{item.sellingDealerCode})"
																					style="color:blue;font-weight:bold;" /></td>
																			<c:choose>
																				<c:when test="${item.productStatusCode == 'D'}">
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:when>
																				<c:when
																					test="${(empty item.expirationMileage || item.expirationMileageInt == 0) and  item.expired}">
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:when>
																				<c:when
																					test="${(empty item.expirationMileage || item.expirationMileageInt == 0) and  !item.expired}">
																					<td class="tableColumn"><h:outputLabel
																							value="Active"
																							style="color: #04B431;font-weight: bold" /></td>
																				</c:when>
																				<c:when
																					test="${(item.expirationMileageInt > 0) and  !item.expired and tfsProductsControllerBean.tfsProductsVO.lastKnownMileage <= item.expirationMileageInt}">
																					<td class="tableColumn"><h:outputLabel
																							value="Active"
																							style="color: #04B431;font-weight: bold" /></td>
																				</c:when>
																				<c:otherwise>
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:otherwise>
																			</c:choose>
																			<td class="tableColumn" >&nbsp;</td>
																		</tr>


																	</table>
																</div>

																<br />
															</c:forEach></td>
													</tr>

												</table>
											</c:if></td>
									</tr>
								</table>
								<table cellpadding="0" cellpadding="0" width="100%"
									class="tfsTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.tfsproducts.productAvailableNote']}">&nbsp;</h:outputLabel>

										</td>
									</tr>
								</table>
							</c:if>

							<c:if
								test="${tfsProductsControllerBean.tfsProductsVO == null || 
										(tfsProductsControllerBean.tfsProductsVO != null && empty tfsProductsControllerBean.tfsProductsVO.tfsProductsList)}">
								<table cellpadding="0" cellpadding="0" width="100%"
									class="tfsTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.tfsproducts.productNotAvailable']}"></h:outputLabel>
											<h:outputLabel
												value="#{tfsProductsControllerBean.vinVO.vinNumber}"></h:outputLabel>
										</td>
									</tr>
								</table>
							</c:if>
							<table cellpadding="0" cellpadding="0" width="100%" class="tfsTableBorder">
        	<tr>
	       			<td style="padding:0px 0px 0px 0px;text-align: left">
	       				<ul>
	       					<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList1']}" ></h:outputLabel>
	       					</li>
						<li>
	       						<h:outputText escape="false"  value="#{msg['portlets.tfsproducts.noteList.set.print']}" ></h:outputText>
	       					</li>
	       					<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList2']}" ></h:outputLabel>
	       					</li>
	       					<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList3']}" ></h:outputLabel>
	       					</li>
	       					
	       					<c:if test="${tfsProductsControllerBean.toyotaDivision }">
	       					<li>
								<h:outputText escape="false" value="#{msg['portlets.tfsproducts.noteList.safeguard']}" ></h:outputText>   							</li>
	       					</li>
	       					</c:if>
	       						<c:if test="${!tfsProductsControllerBean.toyotaDivision }">
	       							<li>
								<h:outputText escape="false" value="#{msg['portlets.tfsproducts.noteList.safeguardLexsus']}" ></h:outputText>   							</li>
	       					</li>
	       						</c:if>
	       				</ul>
	       				
	       			</td>
	       		</tr>
	       </table>
	       		
	       		<ul style="padding-left:28px;">
	       			<li>
	       				<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar2']}" ></h:outputLabel>
	       			</li>
	       			<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar3']}" ></h:outputLabel>
	       						<h:outputLabel value="(" ></h:outputLabel>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar3Red']}" style="color:red;" ></h:outputLabel>
	       						<h:outputLabel value=")." ></h:outputLabel>
	       			</li>
	       		</ul>
	       			
	       		
	       			
	      					<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar1']}" style="padding-left:12px;" ></h:outputLabel>  				


						</h:panelGroup>
						<h:panelGroup layout="block" rendered="#{format == 'tfsLongForm'}"
							style="font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;">
							<c:if
								test="${tfsProductsControllerBean.tfsProductsVO != null && not empty tfsProductsControllerBean.tfsProductsVO.tfsProductsList}">
								<c:set
									value="${tfsProductsControllerBean.tfsProductsVO.tfsProductsList}"
									var="tfsProductsList"></c:set>
								<table class="tfstbl_wrapper">
									<tr>
										<td class="tfs_tbl" width="80%"><c:if
												test="${not empty tfsProductsList}">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0" class="tfsTableBorder">
													<tr>
														<td style="padding: 0px 25px 0px 10px; text-align: right;">
															<h:panelGroup>
																<h:inputHidden
																	value="#{tfsProductsControllerBean.tfsProductsVO.mileage}"></h:inputHidden>
																<h:outputLabel value="Last Known Mileage:"
																	style="font-weight:bold">&nbsp;</h:outputLabel>
																<h:outputLabel
																	value="#{tfsProductsControllerBean.tfsProductsVO.mileage}"></h:outputLabel>


															</h:panelGroup>

														</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td style="padding: 0px 25px 0px 10px;"><c:forEach
																items="#{tfsProductsControllerBean.tfsProductsVO.tfsProductsList}"
																var="item">

																<div class="${facesContext.viewRoot.id}TFSPRODMAX"
																	style="display: inline;">
																	<table id="tfsListForm" cellspacing="0" cellpadding="0"
																		width="100%" class="tfsTablewithBorder">
																		<tr style="background-color: #BDBDBD;">
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="Provider" /></td>
																			<td width="3%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.producttype']}" />
																			</td>
																			<td width="15%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productdesc']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productid']}" />
																			</td>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.plancode']}" />
																			</td>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.productstatus']}" />
																			</td>
																			<td width="9%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.effectivedate']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.expirydate']}" />
																			</td>
																			<td width="8%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.expirationmileage']}" />
																			</td>
																			<c:if
																				test="${tfsProductsControllerBean.allowedUser }">
																				<td width="10%" class="tableColumnBottomBorder"
																					style="font-weight: bold;"><h:outputLabel
																						value="#{msg['portlets.tfsproducts.purchaser']}" />
																				</td>
																			</c:if>
																			<td width="10%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.sellerdealercode']}" />
																			</td>
																			<td width="5%" class="tableColumnBottomBorder"
																				style="font-weight: bold;"><h:outputLabel
																					value="#{msg['portlets.tfsproducts.validitystatus']}" />
																			</td>
																			<c:if test="${null != item.serviceInfoVOList }">
																				<td width="2%" class="tableColumnBottomBorder"
																					style="font-weight: bold;"></td>
																			</c:if>
																			<c:if test="${null == item.serviceInfoVOList }">
																				<td width="2%" class="tableColumnBottomBorder"
																					style="font-weight: bold;"></td>
																			</c:if>
																		</tr>

																		<tr>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.provider}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productType}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productDesc}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productId}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.planCode}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.productStatus}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.effectiveDate}" /></td>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.expiryDate}" /></td>
																			<td class="tableColumn"><c:choose>
																					<c:when test="${item.provider == 'SET' && item.expirationMileageInt == 99999999}">
																						<h:outputLabel value="Unlimited" />	
																					</c:when>
																					<c:when
																						test="${empty item.expirationMileage || item.expirationMileageInt == 0}">
																						<h:outputLabel value="N/A" />
																					</c:when>
																					<c:otherwise>
																						<h:outputLabel value="#{item.expirationMileage}" />
																					</c:otherwise>
																				</c:choose></td>
																			<c:if
																				test="${tfsProductsControllerBean.allowedUser }">
																				<td class="tableColumn"><c:if
																						test="${null != item.purchaserId}">
																						<b style="color: blue">${item.purchaser}</b>
																					</c:if> <c:if test="${null == item.purchaserId}">
																		${item.purchaser}
																</c:if></td>
																			</c:if>
																			<td class="tableColumn"><h:outputLabel
																					value="#{item.sellingDealerName} (#{item.sellingDealerCode})"
																					style="color:blue;font-weight:bold;" /></td>
																			<c:choose>
																				<c:when test="${item.productStatusCode == 'D'}">
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:when>
																				<c:when
																					test="${(empty item.expirationMileage || item.expirationMileageInt == 0) and  item.expired}">
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:when>
																				<c:when
																					test="${(empty item.expirationMileage || item.expirationMileageInt == 0) and  !item.expired}">
																					<td class="tableColumn"><h:outputLabel
																							value="Active"
																							style="color: #04B431;font-weight: bold" /></td>
																				</c:when>
																				<c:when
																					test="${(item.expirationMileageInt > 0) and  !item.expired and tfsProductsControllerBean.tfsProductsVO.lastKnownMileage <= item.expirationMileageInt}">
																					<td class="tableColumn"><h:outputLabel
																							value="Active"
																							style="color: #04B431;font-weight: bold" /></td>
																				</c:when>
																				<c:otherwise>
																					<td class="tableColumn" style="color: #04B404;">
																						<h:outputLabel value="Inactive"
																							style="color: #DF013A;font-weight: bold" />
																					</td>
																				</c:otherwise>
																			</c:choose>
																			<td width="2%" class="tableColumn">&nbsp;</td>
																		</tr>
																		<c:if test="${null != item.serviceInfoVOList }">
																			<tr>
																				<td colspan="13">

																					<table cellspacing="5" cellpadding="5" width="98%"
																						style="padding-left: 10px;">
																						<tr>
																							<td>
																								<table cellspacing="0" cellpadding="0"
																									width="100%" class="tfsTablewithBorder"
																									style="align: center;">
																									<tr style="background-color: #BDBDBD;">
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.desciption']}" />
																										</td>
																										<c:if test="${item.provider == 'SET'}">
																											<td class="tableColumnBottomBorder" style="font-weight:bold;">
																												<h:outputLabel value="#{msg['portlets.tfsproducts.expirydate']}" />
																											</td>
																											
																											<td class="tableColumnBottomBorder" style="font-weight:bold;">
																												<h:outputLabel value="#{msg['portlets.tfsproducts.expirationmileage']}" />
																											</td>
																											
																										</c:if>
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.status']}" />
																										</td>
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.opcode']}" />
																										</td>
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.dealer']}" />
																										</td>
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.dateServiced']}" />
																										</td>
																										<td class="tableColumnBottomBorder"
																											style="font-weight: bold;"><h:outputLabel
																												value="#{msg['portlets.tfsproducts.service.mileage']}" />
																										</td>

																									</tr>
																									<c:forEach items="#{item.serviceInfoVOList}"
																										var="serviceItem">
																										<tr>
																											<td class="tableColumnBorder"><h:outputLabel
																													value="#{serviceItem.serviceDescription}" />
																											</td>
																											<c:if test="${item.provider == 'SET'}">
																												<td  class="tableColumnBorder">
																													<h:outputLabel value="#{serviceItem.expiryDate}" />
																												</td>
																												
																												<td  class="tableColumnBorder">
																												<c:choose>
																													<c:when test="${serviceItem.expirationMileage == 99999999}">
																														<h:outputLabel value="Unlimited" />	
																													</c:when>
																													<c:when test="${empty serviceItem.expirationMileage || serviceItem.expirationMileage == 0}">
																														<h:outputLabel value="N/A" />	
																													</c:when>
																													<c:otherwise>
																														<h:outputLabel value="#{serviceItem.expirationMileage}" />
																													</c:otherwise>
																												</c:choose>
																												</td>
																												
																											</c:if>
																											<td class="tableColumnBorder"><h:outputLabel
																													value="#{serviceItem.statusDesc}" /></td>
																											<td class="tableColumnBorder"><h:outputLabel
																													value="#{serviceItem.opCode}" /></td>
																											<td class="tableColumnBorder"
																												style="font-weight: bold;"><h:outputLabel
																													rendered="#{serviceItem.servicingDealer != null}"
																													value="#{serviceItem.servicingDealerName} (#{serviceItem.servicingDealer})"
																													style="color:blue;" /> <h:outputLabel
																													rendered="#{serviceItem.servicingDealer == null}"
																													value="" style="color:blue;" /></td>
																											<td class="tableColumnBorder"><h:outputLabel
																													value="#{serviceItem.servicedDT}" /></td>
																											<td class="tableColumnBorder"><h:outputLabel
																													value="#{serviceItem.mileage}" /></td>
																										</tr>
																									</c:forEach>
																								</table>
																							</td>
																						</tr>
																					</table>

																				</td>

																			</tr>
																		</c:if>


																	</table>
																</div>

																<br />
															</c:forEach></td>
													</tr>



												</table>


											</c:if></td>
									</tr>
								</table>
								<table cellpadding="0" cellpadding="0" width="100%"
									class="tfsTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.tfsproducts.productAvailableNote']}">&nbsp;</h:outputLabel>

										</td>
									</tr>
								</table>
							</c:if>
							<c:if
								test="${tfsProductsControllerBean.tfsProductsVO == null || 
										(tfsProductsControllerBean.tfsProductsVO != null && empty tfsProductsControllerBean.tfsProductsVO.tfsProductsList)}">
								<table cellpadding="0" cellpadding="0" width="100%"
									class="tfsTableBorder">
									<tr>
										<td style="padding: 0px 25px 0px 10px; text-align: left">
											<h:outputLabel
												value="#{msg['portlets.tfsproducts.productNotAvailable']}"></h:outputLabel>
											<h:outputLabel
												value="#{tfsProductsControllerBean.vinVO.vinNumber}"></h:outputLabel>
										</td>
									</tr>
								</table>
							</c:if>
		 <table cellpadding="0" cellpadding="0" width="100%" class="tfsTableBorder">
        	<tr>
	       			<td style="padding:0px 0px 0px 0px;text-align: left">
	       				<ul>
	       					<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList1']}" ></h:outputLabel>
	       					</li>
	       					<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList2']}" ></h:outputLabel>
	       					</li>
	       					<li>
						<li>
								<h:outputText escape="false" value="#{msg['portlets.tfsproducts.noteList.set.print']}" ></h:outputText>   							</li>
	       					</li>	
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteList3']}" ></h:outputLabel>
	       					</li>
						<c:if test="${tfsProductsControllerBean.toyotaDivision }">
	       					<li>
								<h:outputText escape="false" value="#{msg['portlets.tfsproducts.noteList.safeguard.print']}" ></h:outputText>   							</li>
	       					</li>
	       					</c:if>
	       						<c:if test="${!tfsProductsControllerBean.toyotaDivision }">
	       							<li>
								<h:outputText escape="false" value="#{msg['portlets.tfsproducts.noteList.safeguardLexus.print']}" ></h:outputText>   							</li>
	       					</li>
	       						</c:if>
	       				</ul>
	       				
	       			</td>
	       		</tr>
	       </table>
	       		
	       		<ul style="padding-left:28px;">
	       			<li>
	       				<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar2']}" ></h:outputLabel>
	       			</li>
	       			<li>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar3']}" ></h:outputLabel>
	       						<h:outputLabel value="(" ></h:outputLabel>
	       						<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar3Red']}" style="color:red;" ></h:outputLabel>
	       						<h:outputLabel value=")." ></h:outputLabel>
	       			</li>
	       		</ul>
	       			
	       		
	       			
	      					<h:outputLabel value="#{msg['portlets.tfsproducts.noteStar1']}" style="padding-left:12px;" ></h:outputLabel>  				
	       		
						</h:panelGroup>

					</h:column>
				</h:dataTable>
			</h:panelGroup>

		</h:column>
	</h:dataTable>

</h:form>