<%@ page import="com.facturas.Factura" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="factura.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${com.clientes.Cliente.list()}" optionKey="id" required="" value="${facturaInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'conceptos', 'error')} ">
	<label for="conceptos">
		<g:message code="factura.conceptos.label" default="Conceptos" />
		
	</label>
	<g:select name="conceptos" from="${com.concepto.Concepto.list()}" multiple="multiple" optionKey="id" size="5" value="${facturaInstance?.conceptos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'iva', 'error')} required">
	<label for="iva">
		<g:message code="factura.iva.label" default="Iva" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="iva" name="iva.id" from="${com.impuestos.Iva.list()}" optionKey="id" required="" value="${facturaInstance?.iva?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nFactura', 'error')} required">
	<label for="nFactura">
		<g:message code="factura.nFactura.label" default="NF actura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nFactura" type="number" value="${facturaInstance.nFactura}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="factura.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" value="${fieldValue(bean: facturaInstance, field: 'total')}" required=""/>
</div>

