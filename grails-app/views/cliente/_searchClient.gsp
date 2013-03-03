<g:form controller="cliente" action="searchList" >
<div style="width:100%;">
	<label for="cliente" style="width: 300px;text-align: right;"> <g:message
			code="cliente.search.label" default="Buscar Clientes" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="clienteSearch" style="width: 300px;"/>
	<g:submitButton class="buttonsSearch" style="top: 236px; left: 199px;color:white;" 
		name="searchClient" value="${message(code: 'factura.search.label', default: 'Buscar')} " />
</div>
</g:form>