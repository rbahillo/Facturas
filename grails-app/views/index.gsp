
<%@ page import="com.facturas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	
    	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="factura" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="cliente" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="iva" /></g:link></li>
			</ul>
		</div>
		<div id="list-factura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:render template="search" />
		</div>
	</body>
</html>
