<%@ page import="com.facturas.Factura" %>
<%@ page import="org.codehaus.groovy.grails.commons.ApplicationHolder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	
    	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	</head>
	<body>
		<a href="#edit-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-factura" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${facturaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${facturaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post">
				<g:hiddenField name="id" value="${facturaInstance?.id}" />
				<g:hiddenField name="version" value="${facturaInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
				<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="submitForm(_action_update)"/>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			<g:if test="${session.getAttribute("imprimir")}">
				<fieldset class="buttons">
						<g:jasperForm jasper="factura" format="PDF" name="${facturaInstance?.nFactura}/${facturaInstance?.year}" class="factura" delimiter=" " description="${message(code: 'default.button.imprimir.label', default: 'Imprimir')}" controller="jasper" action="index">
							<input type="hidden" name="nombre" value="${facturaInstance?.cliente?.nombre}" />
							<input type="hidden" name="nFactura" value="${facturaInstance?.nFactura}/${facturaInstance?.year}" />
							<input type="hidden" name="dia" value="<g:formatDate format="dd/MM/yyyy" date="${facturaInstance?.fecha}"/>" />
							<input type="hidden" name="empresa" value="${facturaInstance?.cliente?.empresa}" />
							<input type="hidden" name="direccion" value="${facturaInstance?.cliente?.direccion}" />
							<input type="hidden" name="poblacion" value="${facturaInstance?.cliente?.poblacion}" />
							<input type="hidden" name="cp" value="${facturaInstance?.cliente?.cp}" />
							<input type="hidden" name="provincia" value="${facturaInstance?.cliente?.provincia}" />
							<input type="hidden" name="nif" value="${facturaInstance?.cliente?.nif}" />
							<input type="hidden" name="titulo" value="${facturaInstance?.titulo}" />
							<input type="hidden" name="subtotal" value="<g:formatNumber number="${facturaInstance?.subTotal}" format="0.00" />" />
							<g:each var="iva" status="i" in="${facturaInstance?.ivaMap.entrySet()}" var="iva">
								<input type="hidden" name="iva${i}" value="<g:formatNumber number="${iva.key}" format="0.00" />" />
								<input type="hidden" name="ivaValor${i}" value="<g:formatNumber number="${iva.value}" format="0.00" />" />
							</g:each>
							<input type="hidden" name="iva" value="<g:formatNumber number="${facturaInstance?.iva}" format="0.00" />" />
							<input type="hidden" name="total" value="<g:formatNumber number="${facturaInstance?.total}" format="0.00" />" />
							<input type="hidden" name="facturaId" value="${facturaInstance?.id}" />
							<input type="hidden" name="IMAGE_DIR" value="${ApplicationHolder.application.parentContext.servletContext.getRealPath("/images")}/"}/>
							<g:jasperButton format="pdf" jasper="factura" class="pdf" text="${message(code: 'default.button.imprimir.label', default: 'Imprimir')}"  />
						</g:jasperForm>
				</fieldset>
			</g:if>
		</div>
	</body>
</html>
