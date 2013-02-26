package com.clientes

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clienteInstanceList: Cliente.list(params), clienteInstanceTotal: Cliente.count()]
    }

    def create() {
        [clienteInstance: new Cliente(params)]
    }

    def save() {
        def clienteInstance = new Cliente(params)
        if (!clienteInstance.save(flush: true)) {
            render(view: "create", model: [clienteInstance: clienteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def show(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def edit(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def update(Long id, Long version) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clienteInstance.version > version) {
                clienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cliente.label', default: 'Cliente')] as Object[],
                          "Another user has updated this Cliente while you were editing")
                render(view: "edit", model: [clienteInstance: clienteInstance])
                return
            }
        }

        clienteInstance.properties = params

        if (!clienteInstance.save(flush: true)) {
            render(view: "edit", model: [clienteInstance: clienteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def delete(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        try {
            clienteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def searchList(){
		def query = {
			or {
				like("nif", "${params.clienteSearch}%") // term is the parameter send by jQuery autocomplete
				like("empresa", "${params.clienteSearch}%")
				like("nombre", "${params.clienteSearch}%")
				like("apellidos", "${params.clienteSearch}%")
			   }
		  }
		  def clist = Cliente.createCriteria().list(query) // execute  to the get the list of companies
		  render(view: "list", model:[clienteInstanceList: clist, clienteInstanceTotal: clist.size()])
	}
	
	def search(){
		def query = {
			or {
				like("nif", "${params.term}%") // term is the parameter send by jQuery autocomplete
				like("empresa", "${params.term}%")
				like("nombre", "${params.term}%")
				like("apellidos", "${params.term}%")
			   }
		  }
		  def clist = Cliente.createCriteria().list(query) // execute  to the get the list of companies
		  def clienteSelectList = [] // to add each company details
		  clist.each {
			   def clienteMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
			   clienteMap.put("id", it.id)
			   clienteMap.put("display", it.display)
			   clienteMap.put("label", it.display)
			   clienteMap.put("value", it.display)
			   clienteSelectList.add(clienteMap) // add to the arraylist
			}
		  render clienteSelectList as JSON
	}
}
