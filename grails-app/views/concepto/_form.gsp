<%@ page import="com.concepto.Concepto" %>



<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="concepto.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="concepto" required="" value="${conceptoInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="concepto.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: conceptoInstance, field: 'valor')}" required=""/>
</div>

