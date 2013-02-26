<%@ page import="com.facturas.Factura" %>
<%@ page import="com.concepto.Concepto" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nFactura', 'error')} required" style="width:100%;float:left">
	<label for="nFactura" style="width:100px">
		<g:message code="factura.nFactura.label" default="NFactura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="nFacturaS" name="nFacturaS" type="text" value="${facturaInstance.nFactura}/${facturaInstance.year}" required="" disabled="true"/>
	<label for="cliente" style="width:100px">
		<g:message code="factura.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="cliente.id" value="${facturaInstance?.cliente?.id}"></g:hiddenField> 
	<g:textField name="cliente" style="width: 300px;" value="${facturaInstance?.cliente?.display}"/>
</div>

	

<div class="fieldcontain required" style="width:100%;float:left">
	<label for="fecha" style="width:100px">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" id="datepicker" value="<g:formatDate format="dd/MM/yyyy" date="${facturaInstance?.fecha}"/>" name="fecha">
	<label for="nFactura" style="width:100px">
		<g:message code="factura.titulo.label" default="Titulo" />
	</label>
	<g:textField name="titulo" style="width: 300px;" value="${facturaInstance?.titulo}"/>
</div>

<div class="fieldcontain required" style="width:100%;float:left">
	
</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'conceptos', 'error')} " style="width:100%;">
	<label for="conceptos" style="width:100%;text-align:center;">
		<g:message code="factura.conceptos.label" default="Conceptos" />
	</label>
	<div class="boxa">
		<table>
				<thead>
					<tr>
						<g:sortableColumn property="unidades" title="${message(code: 'concepto.concepto.unidades', default: 'Unidades')}" />
					
						<g:sortableColumn property="concepto" title="${message(code: 'concepto.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'concepto.valorUnitario.label', default: 'Valor Unitario')}" />
						
						<g:sortableColumn property="total" title="${message(code: 'concepto.total.label', default: 'Total')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstance.conceptos}" status="i" var="conceptoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" onclick="editarConcepto(${(i)})">
					
						<td>${fieldValue(bean: conceptoInstance, field: "unidades")}</td>
						<td>${fieldValue(bean: conceptoInstance, field: "concepto")}</td>
						<td>${fieldValue(bean: conceptoInstance, field: "valorUnitario")}</td>
						<td>${fieldValue(bean: conceptoInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
	</div>
</div>

<fieldset class="buttons">
	<div id="dialogCreateConcepto"></div>
	<div id="dialogEditConcepto"></div>
	<div id="addConcept_btn" class="save">${message(code: 'factura.concepto.button.create.label', default: 'Create')}</div>
</fieldset>


<div class="fieldcontain required" style="width:100%;float:left;text-align:right">
	<label for="subtotal" style="width:100px">
		<g:message code="factura.subtotal.label" default="Subtotal" />
	</label>
	${fieldValue(bean: facturaInstance, field: "subTotal")}
</div>

<div class="fieldcontain required" style="width:100%;float:left;text-align:right">
	<label for="iva" style="width:100px">
		<g:message code="factura.iva.label" default="IVA" />
	</label>
	${fieldValue(bean: facturaInstance, field: "iva")}
</div>

<div class="fieldcontain required" style="width:100%;float:left;text-align:right">
	<label for="total" style="width:100px">
		<g:message code="factura.total.label" default="Total" />
	</label>
	${fieldValue(bean: facturaInstance, field: "total")}
</div>
