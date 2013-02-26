
<%@ page import="com.concepto.Concepto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'concepto.label', default: 'Concepto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-concepto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-concepto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list concepto">
			
				<g:if test="${conceptoInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="concepto.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:fieldValue bean="${conceptoInstance}" field="concepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.valorUnitario}">
				<li class="fieldcontain">
					<span id="valorUnitario-label" class="property-label"><g:message code="concepto.valorUnitario.label" default="Valor Unitario" /></span>
					
						<span class="property-value" aria-labelledby="valorUnitario-label"><g:fieldValue bean="${conceptoInstance}" field="valorUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.iva}">
				<li class="fieldcontain">
					<span id="iva-label" class="property-label"><g:message code="concepto.iva.label" default="Iva" /></span>
					
						<span class="property-value" aria-labelledby="iva-label"><g:link controller="iva" action="show" id="${conceptoInstance?.iva?.id}">${conceptoInstance?.iva?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="concepto.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${conceptoInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.unidades}">
				<li class="fieldcontain">
					<span id="unidades-label" class="property-label"><g:message code="concepto.unidades.label" default="Unidades" /></span>
					
						<span class="property-value" aria-labelledby="unidades-label"><g:fieldValue bean="${conceptoInstance}" field="unidades"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.valorIva}">
				<li class="fieldcontain">
					<span id="valorIva-label" class="property-label"><g:message code="concepto.valorIva.label" default="Valor Iva" /></span>
					
						<span class="property-value" aria-labelledby="valorIva-label"><g:fieldValue bean="${conceptoInstance}" field="valorIva"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conceptoInstance?.id}" />
					<g:link class="edit" action="edit" id="${conceptoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
