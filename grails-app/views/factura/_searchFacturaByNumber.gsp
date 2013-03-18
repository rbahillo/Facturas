<g:form controller="factura" action="searchByNFactura" >
<div style="width:100%;">
	<label for="factura" style="width: 300px;text-align: right;margin-top:10px"> <g:message
			code="factura.search.label" default="Buscar Facturas por número de factura" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="nFactura" style="width: 300px;;margin-top:10px"/>
	<g:submitButton class="buttonsSearch" style="top: 236px; left: 199px;color:white;" 
		name="searchFactura" value="${message(code: 'factura.search.label', default: 'Buscar')} "/>
</div>
</g:form>


