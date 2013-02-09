
<%@ page import="com.facturas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-factura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list factura">
			
				<g:if test="${facturaInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="factura.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${facturaInstance?.cliente?.id}">${facturaInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.conceptos}">
				<li class="fieldcontain">
					<span id="conceptos-label" class="property-label"><g:message code="factura.conceptos.label" default="Conceptos" /></span>
					
						<g:each in="${facturaInstance.conceptos}" var="c">
						<span class="property-value" aria-labelledby="conceptos-label"><g:link controller="concepto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="factura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.iva}">
				<li class="fieldcontain">
					<span id="iva-label" class="property-label"><g:message code="factura.iva.label" default="Iva" /></span>
					
						<span class="property-value" aria-labelledby="iva-label"><g:link controller="iva" action="show" id="${facturaInstance?.iva?.id}">${facturaInstance?.iva?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.nFactura}">
				<li class="fieldcontain">
					<span id="nFactura-label" class="property-label"><g:message code="factura.nFactura.label" default="NF actura" /></span>
					
						<span class="property-value" aria-labelledby="nFactura-label"><g:fieldValue bean="${facturaInstance}" field="nFactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="factura.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${facturaInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${facturaInstance?.id}" />
					<g:link class="edit" action="edit" id="${facturaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
