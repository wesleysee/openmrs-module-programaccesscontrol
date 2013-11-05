<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="Manage Program Access Control" otherwise="/login.htm" redirect="/module/programaccesscontrol/program.list" />

<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="template/localHeader.jsp" %>

<br/>

<b class="boxHeader"><openmrs:message code="Program.list.title"/></b>
<div class="box">
	<c:if test="${fn:length(programList) == 0}">
		<tr>
			<td colspan="6"><openmrs:message code="general.none"/></td>
		</tr>
	</c:if>
	<c:if test="${fn:length(programList) != 0}">
		<table cellspacing="0" cellpadding="2">
			<tr>
				<th> <openmrs:message code="general.id"/> </th>
				<th> <openmrs:message code="general.name"/> </th>
				<th> <openmrs:message code="general.description"/> </th>
				<th> <openmrs:message code="programaccesscontrol.patientAccessControl"/> </th>
			</tr>
			<c:forEach var="program" items="${programList}">
				<tr>
					<c:if test="${program.retired}">
						<td colspan="6">
							<i><openmrs:message code="general.retired"/><strike>
								<a href="../../admin/programs/program.form?programId=${program.programId}">${program.name}</a>
							</strike></i>
						</td>
					</c:if>
					<c:if test="${!program.retired}">
						<td valign="top">
							${program.programId}
						</td>
						<td valign="top">
							<a href="../../admin/programs/program.form?programId=${program.programId}">${program.name}</a>
						</td>
						<td valign="top">
							${program.description}
						</td>
						<td valign="top">
							<a href="programAccessControlEdit.form?programId=${program.programId}"><openmrs:message code="programaccesscontrol.patientAccessControl.manage"/></a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>
