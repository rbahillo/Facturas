
<%@ page import="com.concepto.Concepto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'concepto.label', default: 'Concepto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-concepto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-concepto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="concepto" title="${message(code: 'concepto.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'concepto.valorUnitario.label', default: 'Valor Unitario')}" />
					
						<th><g:message code="concepto.iva.label" default="Iva" /></th>
					
						<g:sortableColumn property="total" title="${message(code: 'concepto.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="unidades" title="${message(code: 'concepto.unidades.label', default: 'Unidades')}" />
					
						<g:sortableColumn property="valorIva" title="${message(code: 'concepto.valorIva.label', default: 'Valor Iva')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoInstanceList}" status="i" var="conceptoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoInstance.id}">${fieldValue(bean: conceptoInstance, field: "concepto")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "valorUnitario")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "iva")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "unidades")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "valorIva")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
