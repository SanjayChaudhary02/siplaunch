<%@ page language="java" contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ page import="com.tms.t3.framework.log.LogHelper"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>

<table>
<tr>
<td>
<img src="/serviceLane/resources/jsp/images/SLaneError.jpg" alt="Error Portlet" />
</td>
<td style="vertical-align:top;">
<b>Uh oh!.. Service lane has a flat tire. We apologize for any inconvenience. Please try to load the screen again.</b><br/>
	If you are repeatedly getting this error, TMS Dealers please call 1-877-DL-DAILY, GST Dealers call 1-800-933-3416 and SET
	Dealers call 1-800-982-6057. Alternately you may send an email using the Feedback link provided at the bottom of this page.
</td>
</tr>
</table>
 <%
        LogHelper.logJspError("Error logged by JSP page", exception);
        LogHelper.logJspError("Source Exception URI is :::" + request.getRequestURI());
  %>

<% response.setStatus(200); %>