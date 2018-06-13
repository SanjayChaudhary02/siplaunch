<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String renderType = request.getParameter("RenderOutputType");
if(null != renderType && renderType.equalsIgnoreCase("pdf")){
	response.setContentType("application/pdf");
}else{
	response.setContentType("text/html; charset=UTF-8");
}
%>
<c:set var="vinValue" value="${searchVinControllerBean.searchVinVO.vinNumber}" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta/>
</head>


<body>
<script type="text/javascript">

var preview ='${param.preview}';
var quickPrint = '${param.quickPrint}';

if(preview == 'yes'){
	
}else{
    if (quickPrint != 'true') {
    	window.opener.close();
    }
	
	window.print();

	window.onfocus = function (){
		self.close();
	}
}

</script>



<f:view locale="#{person.language}">
<f:loadBundle basename="com.tms.t3.asm.web.properties.portalcopy"
 var="msg"/>
 
	<style type="text/css" media="print">
		
		thead { display: table-header-group; }
		tfoot { display: table-footer-group; }
	</style>
		
	
	<table width="100%" cellpadding=0 cellspacing=0>
		<thead>
				<tr>
					<td style="border-bottom: black 1px solid; padding-bottom: 5px;">
						<h:graphicImage id="toy_img" rendered="#{searchVinControllerBean.vinSearchResultVO.division == 'TOYOTA'}" url="/resources/images/Toyota_Logo.jpg" ></h:graphicImage>
						
						<h:graphicImage id="lex_img" rendered="#{searchVinControllerBean.vinSearchResultVO.division == 'LEXUS'}" url="/resources/images/Lexus_Logo.jpg" ></h:graphicImage>
						
						<h:graphicImage id="sci_img" rendered="#{searchVinControllerBean.vinSearchResultVO.division == 'SCION'}" url="/resources/images/Scion_Logo.jpg" ></h:graphicImage>
						
						
					</td>
					<td align="right" style="border-bottom: black 1px solid;">
						<h:outputLabel value="Vehicle Details for VIN:" style="font-size: 12px; font-family: arial;font-weight:normal"></h:outputLabel>
						<h:outputLabel value="#{vin.vinNumber}" style="font-size: 12px; font-family: arial; font-weight: bold;"></h:outputLabel>
					</td>
				</tr>
		</thead>
	<%@include file="printCommonInclude.jsp"%> 
	<tfoot>
			<tr>
				<td align="left" style="font-size: 12px; font-family: arial; font-weight: bold; border-top: black 1px solid;">
					${printTimeVO.printTimeText}
				</td>
				<td align="right" style="font-size: 12px; font-family: arial; font-weight: bold; border-top: black 1px solid;">&copy;${vehicleOneLinerDescription.year}&nbsp;Toyota Motor Sales, USA, Inc.</td>
			</tr>

	</tfoot>
	</table>
	
</f:view>
<script>
	document.getElementById("printLoading").style.display = 'none';
	document.getElementById("printOverlay").style.display = 'none';	
	
</script>
</body>
<style type="text/css">

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
label{font-weight: normal}

.panelStyle{
	border-left: #58ACFA 1px solid;
	border-right: #58ACFA 1px solid;
	border-bottom: #58ACFA 1px solid;
	padding: 5px;
	display: block;	
}
.labelStyle{
	width: 5%;
	float: right;
	padding-right: 15px;
}
td,th{padding: initial;}
.headerStyle{
	color: white;
	background-color: #58ACFA;
	width: 100%;
	height: 5px;
	font-weight: bold;
	vertical-align: middle;
	border: #58ACFA 1px solid;
}
.headerStyle label{padding-left: 5px;}
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
</html>