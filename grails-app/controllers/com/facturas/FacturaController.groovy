package com.facturas

import java.text.SimpleDateFormat;

import org.springframework.dao.DataIntegrityViolationException

import com.clientes.Cliente;
import com.concepto.Concepto
import com.impuestos.Iva;


class FacturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[facturaInstanceList: Factura.list(params), facturaInstanceTotal: Factura.count()]
    }
	
	def clientByID(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def cliente = Cliente.get(params.clienteId)
		def facturaInstanceList=Factura.findAllByCliente(cliente)
		
		render(view: "list", model:[facturaInstanceList: facturaInstanceList, facturaInstanceTotal: facturaInstanceList.size()])
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [facturaInstanceList: Factura.list(params), facturaInstanceTotal: Factura.count()]
    }

    def create() {
		def facturaInstance = new Factura(params)
		facturaInstance.fecha=new Date()
		def nFactura=getMaxNFactura(facturaInstance.fecha)
		facturaInstance.nFactura=nFactura
		session.setAttribute("factura", facturaInstance)
		session.setAttribute("create", true)
        [facturaInstance: facturaInstance]
    }
	
	def actualizaConceptos() {
		def facturaInstance = session.getAttribute("factura")
		if(facturaInstance==null)
			facturaInstance=new Factura(params)
		session.setAttribute("factura", facturaInstance)
		def create = session.getAttribute("create")
		session.setAttribute("imprimir", false)
		if(create!=null && create)
			render(view: "create", model: [facturaInstance: facturaInstance])
		else
			render(view: "edit", model: [facturaInstance: facturaInstance])
	}
	
	def addCliente(){
		String clientId = params.clientId;
		def clienteInstance = Cliente.get(new Integer(clientId))
		def facturaInstance = (Factura)session.getAttribute("factura")
		facturaInstance.cliente=clienteInstance
		session.setAttribute("imprimir", false)
	}
	
	def addTitulo(){
		String titulo = params.titulo;
		def facturaInstance = (Factura)session.getAttribute("factura")
		facturaInstance.titulo=titulo
		session.setAttribute("imprimir", false)
	}
	
	def updateNFacturaFecha(){
		String fechaS = params.fecha;
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
		def fecha = formatoDelTexto.parse(fechaS);
		def facturaInstance = (Factura)session.getAttribute("factura")
		facturaInstance.fecha=fecha
		def nFactura=getMaxNFactura(facturaInstance.fecha)
		session.setAttribute("imprimir", false)
		render nFactura+"/"+facturaInstance.year
	}
	
	def addConcepto(){
		double unitario = new Double(params.valorUnitario);
		double unidades = new Double(params.unidades);
		String conceptoS = params.concepto;
		if(unitario==0){
			flash.message = message(code: 'addConcept.failed.value.message', args: [])
		}
		else if(conceptoS==null || conceptoS.length()==0){
			flash.message = message(code: 'addConcept.failed.content.message', args: [])
		}
		else if(unidades==0){
			flash.message = message(code: 'addConcept.failed.value.message', args: [])
		}
		else{
			int ivaId = new Integer(params.ivaId);
			Iva iva = Iva.get(ivaId);
			
			def concepto = new Concepto(params)
			concepto.unidades=unidades
			def valorTotalIva =(unitario*unidades*iva.valor)/100
			def valorUnitarioIva =(unitario*iva.valor)/100
			if(params.included=='true'){
				concepto.total=unitario*unidades-(valorTotalIva)
				concepto.valorUnitario=unitario-(valorUnitarioIva)
			}
			else{
				concepto.total=unitario*unidades+(valorTotalIva)
				concepto.valorUnitario=unitario+(valorUnitarioIva)
			}
			concepto.valorIva=valorTotalIva
			concepto.iva=iva
			def facturaInstance = (Factura)session.getAttribute("factura")
			session.setAttribute("imprimir", false)
			facturaInstance.addToConceptos(concepto)
		}
	}
	
	def editConcepto(){
		double unitario = new Double(params.valorUnitario.replace(",", "."));
		double unidades = new Double(params.unidades);
		String conceptoS = params.concepto;
		if(unitario==0){
			flash.message = message(code: 'addConcept.failed.value.message', args: [])
		}
		else if(conceptoS==null || conceptoS.length()==0){
			flash.message = message(code: 'addConcept.failed.content.message', args: [])
		}
		else if(unidades==0){
			flash.message = message(code: 'addConcept.failed.value.message', args: [])
		}
		else{
			int ivaId = new Integer(params.ivaId);
			Iva iva = Iva.get(ivaId);
			def id = new Integer(params.idx)
			
			def concepto = new Concepto(params)
			concepto.unidades=unidades
			def valorTotalIva =(unitario*unidades*iva.valor)/100
			def valorUnitarioIva =(unitario*iva.valor)/100
			if(params.included=='true'){
				concepto.total=unitario*unidades-(valorTotalIva)
				concepto.valorUnitario=unitario-(valorUnitarioIva)
			}
			else{
				concepto.total=unitario*unidades+(valorTotalIva)
				concepto.valorUnitario=unitario+(valorUnitarioIva)
			}
			concepto.valorIva=valorTotalIva
			concepto.iva=iva
			def facturaInstance = (Factura)session.getAttribute("factura")
			facturaInstance.conceptos.eachWithIndex {conceptoIt, idx ->
				if(idx==id){
					facturaInstance.removeFromConceptos(conceptoIt)
				}
			}
			session.setAttribute("imprimir", false)
			facturaInstance.addToConceptos(concepto)
		}
	}
	
	def deleteConcepto(){
		def id = new Integer(params.idx)
		def facturaInstance = (Factura)session.getAttribute("factura")
		facturaInstance.conceptos.eachWithIndex {conceptoIt, idx ->
			if(idx==id){
				facturaInstance.removeFromConceptos(conceptoIt)
			}
		}
		session.setAttribute("imprimir", false)
	}

    def save() {
        def facturaInstance = (Factura)session.getAttribute("factura")
		def clientId = params.get("cliente.id")
		def cliente = Cliente.get(clientId)
		facturaInstance.cliente=cliente
        if (!facturaInstance.save(flush: true)) {
            render(view: "create", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
		session.setAttribute("imprimir", true)
        redirect(action: "show", id: facturaInstance.id)
    }

    def show(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }
		session.setAttribute("factura", facturaInstance)
		session.setAttribute("create", false)
        render(view: "edit", model: [facturaInstance: facturaInstance])
    }
	

    def edit(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }
		session.setAttribute("factura", facturaInstance)
		session.setAttribute("create", false)
		session.setAttribute("imprimir", true)
        [facturaInstance: facturaInstance]
    }

    def update(Long id, Long version) {
        def facturaInstance = session.getAttribute("factura")
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facturaInstance.version > version) {
                facturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'factura.label', default: 'Factura')] as Object[],
                          "Another user has updated this Factura while you were editing")
                render(view: "edit", model: [facturaInstance: facturaInstance])
                return
            }
        }

        def clientId = params.get("cliente.id")
		def cliente = Cliente.get(clientId)
		facturaInstance.cliente=cliente

        if (!facturaInstance.save(flush: true)) {
            render(view: "edit", model: [facturaInstance: facturaInstance])
            return
        }
		session.setAttribute("imprimir", true)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }

    def delete(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        try {
            facturaInstance.delete(flush: true)
			session.setAttribute("imprimir", true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getMaxNFactura(Date fecha){
		def c = Factura.createCriteria()
		Calendar cal = Calendar.getInstance();
		cal.setTime(fecha);
		def firstDayOfYear = new GregorianCalendar(cal.get(Calendar.YEAR), 0, 1)
		def lastDayOfYear = new GregorianCalendar(cal.get(Calendar.YEAR), 11, 31)
		def max = c.list {
						and{
							ge("fecha", firstDayOfYear.getTime())
							le("fecha", lastDayOfYear.getTime())
						 }
						 order('nFactura','desc')
		}
		def nFactura = 1
		if(max!=null && max.size()!=0)
			nFactura=max.get(0).nFactura+1
		return nFactura
	}
	
	def searchByNFactura(Integer max){
		params.max = Math.min(max ?: 10, 100)
		def nFacturaS = params.get("nFactura")
		def nFactura, year
		(nFactura, year) =  nFacturaS.split ('/')
		def firstDayOfYear = new GregorianCalendar(new Integer(year), 0, 1)
		def lastDayOfYear = new GregorianCalendar(new Integer(year), 11, 31)
		def c = Factura.createCriteria()
		def facturaInstanceList = c.list {
			and{
				ge("fecha", firstDayOfYear.getTime())
				le("fecha", lastDayOfYear.getTime())
				eq("nFactura", new Integer(nFactura))
			 }
			 order('nFactura','desc')
		}
		if(facturaInstanceList!=null && facturaInstanceList.size()!=0){
			def facturaInstance=facturaInstanceList.get(0)
			render(view: "edit", model: [facturaInstance: facturaInstance])
		}
		else{
			flash.message = message(code: 'factura.nFactura.noEncontrado')
			render(view: "list", model:[facturaInstanceList: Factura.list(params), facturaInstanceTotal: Factura.count()])
		}
		
		
	}
	
}
