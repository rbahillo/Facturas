<%@ page import="com.facturas.Factura" %>
<%@ page import="com.concepto.Concepto" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nFactura', 'error')} required" style="width:100%;float:left">
	<label for="nFactura" style="width:100px">
		<g:message code="factura.nFactura.label" default="NFactura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nFactura" type="number" value="${facturaInstance.nFactura}" required=""/>
	<label for="fecha">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" id="datepicker" value="${facturaInstance.fecha}" name="fecha">	
</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'cliente', 'error')} required" style="width:100%;float:left">
	<label for="cliente" style="width:100px">
		<g:message code="factura.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${com.clientes.Cliente.list()}" optionKey="id" required="" value="${facturaInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'conceptos', 'error')} " style="width:100%;">
	<label for="conceptos" style="width:100%;text-align:center;">
		<g:message code="factura.conceptos.label" default="Conceptos" />
	</label>
	<div class="box">
		<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="concepto" title="${message(code: 'concepto.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'concepto.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstance.conceptos}" status="i" var="conceptoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td onclick="editarConcepto(${(i)})">${fieldValue(bean: conceptoInstance, field: "concepto")}</td>
						<td>${fieldValue(bean: conceptoInstance, field: "valor")}</td>
					
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


<%--<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'iva', 'error')} required" style="width:100%;float:left">--%>
<%--	<label for="iva" style="width:100px">--%>
<%--		<g:message code="factura.iva.label" default="Iva" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="iva" name="iva.id" from="${com.impuestos.Iva.list()}" optionKey="id" required="" value="${facturaInstance?.iva?.id}" class="many-to-one"/>--%>
<%--</div>--%>


<%--<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'total', 'error')} required" style="width:100%;float:left">--%>
<%--	<label for="total" style="width:100px">--%>
<%--		<g:message code="factura.total.label" default="Total" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="total" value="${fieldValue(bean: facturaInstance, field: 'total')}" required=""/>--%>
<%--</div>--%>
