<%@ page import="com.concepto.Concepto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}?id=393" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="application"/>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	
		<g:set var="entityName" value="${message(code: 'concepto.label', default: 'Concepto')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<r:layoutResources />
	</head>
	<body>
		<div id="create-concepto" class="content scaffold-create" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${conceptoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${conceptoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${conceptoInstance?.id}" />
				<g:hiddenField name="version" value="${conceptoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<div id="updateConcept_btn" class="save">${message(code: 'default.button.update.label', default: 'Create')}</div>
					<div id="deleteConcept_btn" class="delete">${message(code: 'default.button.delete.label', default: 'Create')}</div>
				</fieldset>
			</g:form>
		</div>
		<r:layoutResources />
	</body>
</html>
