
<%@ page import="com.clientes.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.nif}">
				<li class="fieldcontain">
					<span id="nif-label" class="property-label"><g:message code="cliente.nif.label" default="Nif" /></span>
					
						<span class="property-value" aria-labelledby="nif-label"><g:fieldValue bean="${clienteInstance}" field="nif"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.empresa}">
				<li class="fieldcontain">
					<span id="empresa-label" class="property-label"><g:message code="cliente.empresa.label" default="Empresa" /></span>
					
						<span class="property-value" aria-labelledby="empresa-label"><g:fieldValue bean="${clienteInstance}" field="empresa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${clienteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="cliente.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${clienteInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="cliente.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${clienteInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.cp}">
				<li class="fieldcontain">
					<span id="cp-label" class="property-label"><g:message code="cliente.cp.label" default="Cp" /></span>
					
						<span class="property-value" aria-labelledby="cp-label"><g:fieldValue bean="${clienteInstance}" field="cp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.poblacion}">
				<li class="fieldcontain">
					<span id="poblacion-label" class="property-label"><g:message code="cliente.poblacion.label" default="Poblacion" /></span>
					
						<span class="property-value" aria-labelledby="poblacion-label"><g:fieldValue bean="${clienteInstance}" field="poblacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.provincia}">
				<li class="fieldcontain">
					<span id="provincia-label" class="property-label"><g:message code="cliente.provincia.label" default="Provincia" /></span>
					
						<span class="property-value" aria-labelledby="provincia-label"><g:fieldValue bean="${clienteInstance}" field="provincia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="cliente.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${clienteInstance}" field="pais"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="cliente.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${clienteInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.movil}">
				<li class="fieldcontain">
					<span id="movil-label" class="property-label"><g:message code="cliente.movil.label" default="Movil" /></span>
					
						<span class="property-value" aria-labelledby="movil-label"><g:fieldValue bean="${clienteInstance}" field="movil"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${clienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
