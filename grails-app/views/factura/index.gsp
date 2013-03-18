
<%@ page import="com.facturas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list" controller="factura"><g:message code="default.list.facturas" default="Gestion de Facturas" /></g:link></li>
				<li><g:link class="list" action="list" controller="cliente"><g:message code="default.list.cliente" default="Gestion de Clientes"/></g:link></li>
				<li><g:link class="list" action="list" controller="iva"><g:message code="default.list.iva" default="Gestion de Impuestos" /></g:link></li>
				<li><g:link class="list" action="list" controller="adminUser"><g:message code="default.list.adminUser" default="Gestion de Usuarios" /></g:link></li>
			</ul>
		</div>
		<div id="list-factura" class="content scaffold-list" role="main">
			<h1><g:message code="default.searchs" default="Búsquedas Rápidas" /></h1>
			<br>
			<g:render template="searchFacturaByClient" />
			<br>
			<br>
			<g:render template="searchFacturaByNumber" />
			<br>
			<br>
			<g:render template="/cliente/searchClient" />
		</div>	
	</body>
</html>
