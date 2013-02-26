
<%@ page import="com.clientes.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="searchClient" />
			<br>
			<br>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nif" title="${message(code: 'cliente.nif.label', default: 'Nif')}" />
					
						<g:sortableColumn property="empresa" title="${message(code: 'cliente.empresa.label', default: 'Empresa')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'cliente.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidos" title="${message(code: 'cliente.apellidos.label', default: 'Apellidos')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'cliente.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="cp" title="${message(code: 'cliente.cp.label', default: 'Cp')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nif")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "empresa")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "apellidos")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "cp")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
