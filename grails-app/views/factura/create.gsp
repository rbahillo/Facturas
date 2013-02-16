<%@ page import="com.facturas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<r:require module="jquery-ui"/>
    	<jqui:resources theme="darkness" />
    	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    	<script type="text/javascript">
        $(document).ready(function()
        {
          $("#datepicker").datepicker({

        	  dateFormat : 'dd/mm/yyyy', //este formato lo uso xq asi se guarda en mi DB!! tu lo puedes cambiar como mas te guste
        	  showAnim : 'slideDown',
        	  changeMonth: true, //muestra una lista de los meses
        	  changeYear: true, //muestra una lista de los años
        	  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        	  monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        	  dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'],
        	  dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        	  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        	  weekHeader: 'Sm'
        	  });
        })
    </script>
	</head>
	<body>
		<a href="#create-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-factura" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
