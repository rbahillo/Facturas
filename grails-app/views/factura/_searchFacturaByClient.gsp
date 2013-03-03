<g:form controller="factura" action="clientByID" >
<div style="width:100%;">
	<label for="cliente" style="width: 300px;text-align: right;margin-top:10px"> <g:message
			code="factura.search.bycliente.label" default="Buscar Facturas de un cliente" /> <span
		class="required-indicator">*</span>
	</label>
	<g:hiddenField name="clienteId"></g:hiddenField>
	<g:textField name="clienteNoUpdate" style="width: 300px;;margin-top:10px"/>
	<g:submitButton class="buttonsSearchDisabled" style="top: 236px; left: 199px;color:white;" 
		name="searchByClient" value="${message(code: 'factura.search.label', default: 'Buscar')} " disabled="disabled" />
</div>
</g:form>


