<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />
<openmrs:htmlInclude file="/scripts/jquery-ui/js/jquery-ui-1.7.2.custom.min.js" />
<openmrs:htmlInclude file="/moduleResources/radiology/js/datatables/jquery.dataTables.min.js" />

<%-- we cannot replace following script and include combination with openmrs:htmlinclude because we need the jsp compiler to resolve the spring message tags in the radiologyOrderList.js  --%>
<script type="text/javascript">
  
<%@ include file="/WEB-INF/view/module/radiology/resources/js/radiologyOrderList.js" %>
  
</script>

<openmrs:htmlInclude file="/moduleResources/radiology/js/sortNumbers.js" />
<openmrs:htmlInclude file="/moduleResources/radiology/css/jquery.dataTables.min.css" />
<openmrs:htmlInclude file="/moduleResources/radiology/css/details-control.dataTables.css" />

<div id="openmrs_msg" name="loading">
  <spring:message code="general.loading" />
</div>
<openmrs:hasPrivilege privilege="Add Radiology Orders">
  <br>
  <a href="radiologyOrder.form"><spring:message code="radiology.addOrder" /></a>
  <br>
</openmrs:hasPrivilege>
<br>
<span class="boxHeader"> <b><spring:message code="radiology.radiologyOrders" /></b> <a id="clearResults" href="#"
  style="float: right"> <spring:message code="radiology.clearResults" />
</a>
</span>
<div class="box">
  <table id="searchForm" cellspacing="10">
    <tr>
        <h2>CALLING FRAGMENt 1 through December 20</h2>
      <form id="radiologyOrderListForm">
        <td><label><spring:message code="radiology.patient" />:</label> <input name="patientQuery" type="text"
          style="width: 20em" title="<spring:message
						code="radiology.minChars" />" /></td>
        <td><label><spring:message code="radiology.startDate" />:</label> <input name="startDate" type="text"
          onclick="showCalendar(this)" /></td>
        <td><label><spring:message code="radiology.endDate" />:</label> <input name="endDate" type="text"
          onclick="showCalendar(this)" /></td>
        <td><input id="findButton" type="button" value="<spring:message code="radiology.find"/>" /></td>
        <td id="errorSpan"></td>
      </form>
    </tr>
  </table>
  <br>
  <div id="results"></div>
<h2>CALLING FRAGMENT - Refreshing POPOPOPOJKDDKK from October 1 through December 20</h2>
</div>
<br />
