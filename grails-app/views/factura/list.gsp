
<%@ page import="com.facturas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	<jqui:resources theme="darkness" />
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-factura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="searchFacturaByClient" />
			<br>
			<br>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="factura.cliente.label" default="Cliente" /></th>
						
						<g:sortableColumn property="titulo" title="${message(code: 'factura.titulo.label', default: 'Titulo')}" />
						
						<g:sortableColumn property="nFactura" title="${message(code: 'factura.nFactura.label', default: 'NF actura')}" />
					
						<g:sortableColumn property="iva" title="${message(code: 'factura.iva.label', default: 'Iva')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'factura.total.label', default: 'Total')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaInstance.id}">${fieldValue(bean: facturaInstance, field: "cliente.empresa")}</g:link></td>
						
						<td>${fieldValue(bean: facturaInstance, field: "titulo")}</td>
						
						<td>${fieldValue(bean: facturaInstance, field: "nFactura")}/${fieldValue(bean: facturaInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: facturaInstance, field: "iva")}</td>
					
						<td>${fieldValue(bean: facturaInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
