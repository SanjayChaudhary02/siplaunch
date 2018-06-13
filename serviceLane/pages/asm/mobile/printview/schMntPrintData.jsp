
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


	<table style="height:100%;width:100%;" cellpadding=0 cellspacing=0>
	<tr>
		<td width=100% class="servIntText">
			<h:outputText escape="false" value="#{scheduleMntData.scheduledMaintenanceNormal.taskDescription}" />
		</td>
	</tr>
	<tr>
		<td width=100%>
	<h:dataTable var="taskItem"
		value="#{scheduleMntData.scheduledMaintenanceNormal.scheduledMaintenanceTaskVOList}"
		styleClass="rcom_service" cellpadding="0" cellspacing="0" columnClasses="firstCol,secondCol">		
		<h:column >			
			<h:panelGroup rendered="#{taskItem.eyeNotes != null}">
				<h:outputLabel					
					styleClass="eyeIcon" style="cursor:pointer" onclick="javascript:showHelpTxt('#{taskItem.eyeNotes}',event); return false;">
					<img src="/serviceLane/resources/images/schMnt/eye_icon.png" style="height:12px;" />
				</h:outputLabel>
				<h:outputLabel rendered="#{taskItem.eyeNotes != null}" styleClass="bullet_icon bulletIcon">
					<img src="/serviceLane/resources/images/schMnt/Bullet.png" />
				</h:outputLabel>
			</h:panelGroup>
			<h:outputLabel rendered="#{taskItem.eyeNotes == null}">
				<img src="/serviceLane/resources/images/schMnt/Bullet.png" />
			</h:outputLabel>
		</h:column>
		<h:column>			
			<h:panelGroup>				
				<h:outputLabel rendered="#{taskItem.eyeNotes != null}"
					style="cursor:pointer" styleClass="note_link" onclick="javascript:showHelpTxt('#{taskItem.eyeNotes}',event); return false;">
					<h:outputText value="#{taskItem.taskDescription}" styleClass="serv_note"/>
				</h:outputLabel>
				<h:outputText value="#{taskItem.taskDescription}"
					rendered="#{taskItem.eyeNotes == null}" />
				<h:outputText escape="false"
					value="<a name='##{taskItem.notes[0].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{taskItem.notes[0].superScript})</a>"
					rendered="#{not empty taskItem.notes[0]}" />
			
				<h:outputText escape="false" value=","
					rendered="#{not empty taskItem.notes[1]}" style="font-size:8px;font-weight:normal;"/>
				<h:outputText escape="false"
					value="<a name='##{taskItem.notes[1].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{taskItem.notes[1].superScript})</a>"
					rendered="#{not empty taskItem.notes[1]}" />				
			</h:panelGroup>
			<h:panelGroup styleClass="Note_content"
				rendered="#{taskItem.eyeNotes != null}">
				<h:outputText value="#{taskItem.eyeNotes}" />
			</h:panelGroup>
		</h:column>
	</h:dataTable>
	</td>
	</tr>
	<tr>
		<td width=100%>
		<h:panelGrid rendered="#{scheduleMntData.scheduledMaintenanceNotes != null}" width="100%">
			<h:outputText escape="false" value="<p class='service_notes'>#{scheduleMntData.scheduledMaintenanceNotes}</p>" />
		</h:panelGrid>
		</td>
	</tr>
	<tr>
		<td width=100% class="soc_text">
			<h:outputText escape="false" rendered="#{not empty scheduleMntData.specialIperatingConditions}" value="#{scheduleMntData.specialOperatingCondtionsTitle.taskDescription}
				<a name='##{scheduleMntData.specialOperatingCondtionsTitle.notes[0].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{scheduleMntData.specialOperatingCondtionsTitle.notes[0].superScript})</a>" />
		</td>
	</tr>
	<tr>
	<td width=100%>
	<h:dataTable var="opConditionRow"
		value="#{scheduleMntData.specialIperatingConditions}"
		rendered="#{not empty scheduleMntData.specialIperatingConditions}"
		styleClass="opr_conditions" cellpadding="0" cellspacing="0">
		<h:column>
						<h:panelGroup styleClass="dummy" style="font-weight:bold">
						<h:outputLabel rendered="#{not empty opConditionRow.eyeNotes}"								
								styleClass="splHeadEyeIcon" style="cursor:pointer" onclick="javascript:showHelpTxt('#{opConditionRow.eyeNotes}',event); return false;">
								<img src="/serviceLane/resources/images/schMnt/eye_icon.png" style="height:12px;" />
						</h:outputLabel>
						<h:outputText style="text-decoration:underline;" escape="false"
							value="<a class='note_link'>#{opConditionRow.taskDescription}</a>"
							rendered="#{not empty opConditionRow.eyeNotes}"/>
						<h:outputText style="text-decoration:underline;"
							value="#{opConditionRow.taskDescription}"
							rendered="#{empty opConditionRow.eyeNotes}" />
						<h:outputText escape="false"
							value="<a name='##{opConditionRow.notes[0].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{opConditionRow.notes[0].superScript})</a>"
							rendered="#{not empty opConditionRow.notes[0]}" />
						
						<h:panelGroup styleClass="Note_content"
							rendered="#{not empty opConditionRow.eyeNotes}">
							<h:outputText escape="false" value="#{opConditionRow.eyeNotes}" />
						</h:panelGroup>
					</h:panelGroup>
			<h:dataTable var="taskItem"
				value="#{opConditionRow.scheduledMaintenanceTaskVOList}" columnClasses="firstCol,secondCol"
				styleClass="opr_section opr_conditions" cellpadding="1"
				cellspacing="0" >
				
			<h:column >			
				<h:panelGroup rendered="#{taskItem.eyeNotes != null}">
					<h:outputLabel						
						styleClass="eyeIcon" style="cursor:pointer" onclick="javascript:showHelpTxt('#{taskItem.eyeNotes}',event); return false;">
						<img src="/serviceLane/resources/images/schMnt/eye_icon.png" style="height:12px;" />
					</h:outputLabel>
					<h:outputLabel rendered="#{taskItem.eyeNotes != null}" styleClass="bullet_icon bulletIcon">
						<img src="/serviceLane/resources/images/schMnt/Bullet.png" />
					</h:outputLabel>
				</h:panelGroup>
				<h:outputLabel rendered="#{taskItem.eyeNotes == null}">
					<img src="/serviceLane/resources/images/schMnt/Bullet.png" />
				</h:outputLabel>
			</h:column>
			<h:column>			
				<h:panelGroup>				
					<h:outputLabel rendered="#{taskItem.eyeNotes != null}"
						style="cursor:pointer" styleClass="note_link" onclick="javascript:showHelpTxt('#{taskItem.eyeNotes}',event); return false;">
						<h:outputText value="#{taskItem.taskDescription}" styleClass="serv_note"/>
					</h:outputLabel>
					<h:outputText value="#{taskItem.taskDescription}"
						rendered="#{taskItem.eyeNotes == null}" />
					<h:outputText escape="false"
						value="<a name='##{taskItem.notes[0].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{taskItem.notes[0].superScript})</a>"
						rendered="#{not empty taskItem.notes[0]}" />
				
					<h:outputText escape="false" value=","
						rendered="#{not empty taskItem.notes[1]}" style="font-size:8px;font-weight:normal;"/>
					<h:outputText escape="false"
						value="<a name='##{taskItem.notes[1].linkText}_#{scheduleMntData.recCount}' class='sup_link' style='font-size:8px;font-weight:normal;'>(#{taskItem.notes[1].superScript})</a>"
						rendered="#{not empty taskItem.notes[1]}" />				
				</h:panelGroup>
				<h:panelGroup styleClass="Note_content"
					rendered="#{taskItem.eyeNotes != null}">
					<h:outputText value="#{taskItem.eyeNotes}" />
				</h:panelGroup>
			</h:column>
			</h:dataTable>
		</h:column>
	</h:dataTable>

	 
	<tr>
		<td width=100% class="noteText">
			<h:outputText value="Note:" rendered="#{not empty scheduleMntData.notesArray}" />
		</td>
	</tr>
	<tr>
		<td width=100%>
	<h:dataTable var="notesItem"
		value="#{scheduleMntData.notesArray}"
		rendered="#{not empty scheduleMntData.notesArray}"
		styleClass="service_task_note" cellpadding="0"
		style="padding-bottom: 10px;" cellspacing="0">
		<h:column>
		<h:outputText escape="false"
				value="<a id='#{notesItem.linkText}_#{scheduleMntData.recCount}' href='javascript:void(0)'/>" />
			<h:panelGroup styleClass="list_count">
				<h:outputText value="#{notesItem.superScript}." />
			</h:panelGroup>
		</h:column>
		<h:column>
			<h:panelGroup>
				<h:outputText value="#{notesItem.notes}" />
			</h:panelGroup>
		</h:column>
	</h:dataTable>
	</td>
	</tr>
	</td>
	</tr>
	</table>