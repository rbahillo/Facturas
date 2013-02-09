<%@ page import="com.clientes.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nif', 'error')} required">
	<label for="nif">
		<g:message code="cliente.nif.label" default="Nif" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nif" required="" value="${clienteInstance?.nif}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'empresa', 'error')} required">
	<label for="empresa">
		<g:message code="cliente.empresa.label" default="Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="empresa" required="" value="${clienteInstance?.empresa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellidos', 'error')} required">
	<label for="apellidos">
		<g:message code="cliente.apellidos.label" default="Apellidos" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidos" required="" value="${clienteInstance?.apellidos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="cliente.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${clienteInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'cp', 'error')} required">
	<label for="cp">
		<g:message code="cliente.cp.label" default="Cp" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cp" required="" value="${clienteInstance?.cp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'poblacion', 'error')} required">
	<label for="poblacion">
		<g:message code="cliente.poblacion.label" default="Poblacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="poblacion" required="" value="${clienteInstance?.poblacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'provincia', 'error')} required">
	<label for="provincia">
		<g:message code="cliente.provincia.label" default="Provincia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="provincia" required="" value="${clienteInstance?.provincia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'pais', 'error')} ">
	<label for="pais">
		<g:message code="cliente.pais.label" default="Pais" />
		
	</label>
	<g:textField name="pais" value="${clienteInstance?.pais}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${clienteInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'movil', 'error')} ">
	<label for="movil">
		<g:message code="cliente.movil.label" default="Movil" />
		
	</label>
	<g:textField name="movil" value="${clienteInstance?.movil}"/>
</div>

