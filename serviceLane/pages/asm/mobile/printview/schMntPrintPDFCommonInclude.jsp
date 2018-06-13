<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.web.context.WebApplicationContext,org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.tms.t3.asm.web.bean.ScheduleMaintenancePrintControllerBean"%>
<head>
<title>${msg['portlet.schMnt.print.title']}</title>
<link href="${facesContext.externalContext.requestContextPath}/resources/css/schMnt.css" rel="stylesheet" type="text/css" />
<script src="${facesContext.externalContext.requestContextPath}/framework/skins/t3/js/jquery.js"></script>
<script type="text/javascript" src="${facesContext.externalContext.requestContextPath}/resources/js/tooltip.js" ></script>    
<style type="text/css" media="print">
	.linkColumn {
			display: none;
	  		}	
</style>
</head>
<%

WebApplicationContext webAppctx = WebApplicationContextUtils
.getWebApplicationContext(request.getSession()
		.getServletContext());

ScheduleMaintenancePrintControllerBean smPrintControllerBean = (ScheduleMaintenancePrintControllerBean) webAppctx.getBean("schMntPrintControllerBean");
String type= request.getParameter("type");
System.out.println("IN jsp the type is --->>>>"+type);
if (null != type && type.equalsIgnoreCase("current")) {
	smPrintControllerBean.getCurrentSchMntDetails();
} else if (null != type && type.equalsIgnoreCase("currentplusminusone")) {
	smPrintControllerBean.getCurrPlusMinOneSchMntDetails();
} else if (null != type && type.equalsIgnoreCase("full")) {
	smPrintControllerBean.getFullSchMntDetails();
}


%>

<h:panelGrid
						columns="#{schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.current'? '1':'3'}"
						styleClass="Display_schedule" style="width:100%;"
						cellpadding="0" cellspacing="5" border="0"
						columnClasses="odd_service col1_service,even_service col2_service,odd_service col3_service">
						<c:forEach items="#{schMntPrintControllerBean.schMntDataList}"
							var="scheduleMntData" varStatus="status">
							<h:panelGroup>
								<c:if
									test="${status.count == 1 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.current' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.currentservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>

								<c:if
									test="${status.count == 1 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.currentPlusOne' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.currentservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>
								<c:if
									test="${status.count == 2 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.currentPlusOne' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.nextservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>

								<c:if
									test="${status.count == 1 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.currentPlusMinOne' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.previousservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>

								<c:if
									test="${status.count == 2 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.currentPlusMinOne' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.currentservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>

								<c:if
									test="${status.count == 3 && schMntPrintControllerBean.popUpPage.printPage == 'schMnt.printPage.currentPlusMinOne' }">
									<table width="100%" cellspacing="0" cellpadding="0"
										class="print_service">
										<thead>
											<tr>
												<th class="serviceintervalheader">${msg['portlet.schMnt.print.nextservice']}</th>
											</tr>
										</thead>
									</table>
								</c:if>

								<%@ include file="schMntPrintData.jsp"%>
							</h:panelGroup>
						</c:forEach>

					</h:panelGrid>
