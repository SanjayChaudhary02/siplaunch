<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
long time=System.currentTimeMillis();

System.out.println("start" + time);

String renderType = request.getParameter("RenderOutputType");
if(null != renderType && renderType.equalsIgnoreCase("pdf")){
	response.setContentType("application/pdf");
}else{
	response.setContentType("text/html; charset=UTF-8");
}
long end=System.currentTimeMillis();

System.out.println("end" + end);

System.out.println("page inital load" + (time-end));


%>

<c:set var="vinValue" value="${searchVinControllerBean.searchVinVO.vinNumber}" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta/>
</head>


<body>
<script type="text/javascript">
window.opener.close();
window.print();

window.onfocus = function (){
	self.close();
}
</script>



<f:view locale="#{person.language}">
	
	<f:verbatim>
		<style>
		.secondCol {
			vertical-align:top;
			padding-top:10px;
		}
		.colClass1{
		}
		.colClass2{
			float: right;
		}
		.bea-portal-book-page
		{
		    padding: 0px;
		    font-size: small;
		    font-family: Verdana, Arial, Helvetica, sans-serif; 
		    font-size: 11px small;
		    font-weight: normal;
		    text-decoration: none; 
		    color: #000000;
		}
		.panelStyle{
			border-left: #58ACFA 1px solid;
			border-right: #58ACFA 1px solid;
			border-bottom: #58ACFA 1px solid;
			padding:5px;	
		}
		.labelStyle{
			width: 5%;
			float: right;
			padding-right: 15px;
		}
		.headerStyle{
			color: white;
			background-color: #58ACFA;
			width: 100%;
			height: 5px;
			font-weight: bold;
			vertical-align: middle;
			border: #58ACFA 1px solid;
		}
		
		.warrantyStyle{
			color: black;
			background-color: #D8D8D8;
			width: 100%;
			height: 5px;
			font-weight: bold;
			vertical-align: middle;
			border: #000000 1px solid;
		}

	</style>
	<style type="text/css" media="print">
		@page {
			size:letter;			
			margin-top: 0.75cm;
			margin-left: 0.25cm;
			margin-bottom:1cm;
			margin-right: 0.25cm;
			border-top:1px black solid;
			border-bottom:1px black solid;
			padding-top:2px;
			padding-bottom:2px;			
			@top-left{
				content: "_____________________________________________________";
				background-image: url("${vehicleOneLinerDescription.pdfDivisionIconUrl}");  
                background-repeat:no-repeat;
				font-size: 13px;
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
				color:white;
			}
			@top-right{
				content: </f:verbatim><h:outputText value="'Vehicle Details for VIN: #{vin.vinNumber}';"/> <f:verbatim> 
				font-size: 11px;
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
			}
			@bottom-left {
				content: </f:verbatim><h:outputText value="'#{printTimeVO.printTimeText}';"/> <f:verbatim>
				font-size: 10px;
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
			}
			@bottom-right {
				content: '\0000a9</f:verbatim><h:outputText value="#{vehicleOneLinerDescription.year} Toyota Motor Sales, USA, Inc.';" escape="false"/> <f:verbatim>
				font-size: 10px;
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
			}
	 		@bottom-center {
			    content: "Page "counter(page)" of "counter(pages);;
			    font-family: Verdana, Arial, Helvetica, sans-serif;
			    font-size: 10px;
				font-weight: bold;
	  		}
	  		
		}
		.warrantySection{
			page-break-inside: avoid;
		}
		
		.section {
			page-break-inside: avoid;
	  		}
		
	</style>
	</f:verbatim>
	
	<table width="100%">
		<%@include file="printCommonInclude.jsp"%>
		
	</table>
	
	<% System.out.println("Time taken after printCommonInclude " + ((System.currentTimeMillis() - time)));%>
</f:view>
</body>
</html>