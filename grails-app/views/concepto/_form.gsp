<%@ page import="com.concepto.Concepto" %>



<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="concepto.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea  name="concepto" required="" value="${conceptoInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'unidades', 'error')} required">
	<label for="valor">
		<g:message code="concepto.unidades.label" default="Unidades" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unidades" value="${fieldValue(bean: conceptoInstance, field: 'unidades')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'valorUnitario', 'error')} required">
	<label for="valor">
		<g:message code="concepto.valorUnitario.label" default="ValorUnitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="valorUnitario" value="${fieldValue(bean: conceptoInstance, field: 'valorUnitario')}" required=""/>
</div>



<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'iva', 'error')} required">
	<label for="iva">
		<g:message code="concepto.iva.label" default="Iva" />
		<span class="required-indicator">*</span>
	</label>
	<g:set var="ivaSelected" value="${null}" />
	<g:if test="${conceptoInstance?.iva!=null}">
		<g:set var="ivaSelected" value="${conceptoInstance.iva.id}" />
	</g:if>
	<g:each in="${com.impuestos.Iva.list()}" status="i" var="ivaInstance">
			<span class="required-indicator">${fieldValue(bean: ivaInstance, field: "valor")}%</span>
			<g:if test="${ivaInstance.id==ivaSelected}">
				<g:radio name="ivaId" value="${fieldValue(bean: ivaInstance, field: "id")}" checked="true"/>	
			</g:if>
			<g:else>
				<g:if test="${ivaInstance.ivaPorDefecto&&ivaSelected==null}">
					<g:radio name="ivaId" value="${fieldValue(bean: ivaInstance, field: "id")}" checked="true"/>	
				</g:if>	
				<g:else>
					<g:radio name="ivaId" value="${fieldValue(bean: ivaInstance, field: "id")}"/>
				</g:else>
			</g:else>	
	</g:each>
</div>
<div class="fieldcontain required">
	<label for="included">
		<g:message code="concepto.iva.incluido" default="Iva Incluido" />
		<span class="required-indicator">*</span>
	</label>

	<span class="required-indicator"><g:message code="concepto.iva.incluido.si" default="Si" /></span>
	<g:radio name="included" value="true" checked="true"/>
	<span class="required-indicator"><g:message code="concepto.iva.incluido.no" default="No" /></span>
	<g:radio name="included" value="false" />
	
</div>
<g:hiddenField name="idx" value="${params.id}"/>

