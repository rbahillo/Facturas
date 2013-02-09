package com.concepto

import org.springframework.dao.DataIntegrityViolationException

class ConceptoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [conceptoInstanceList: Concepto.list(params), conceptoInstanceTotal: Concepto.count()]
    }

    def create() {
        [conceptoInstance: new Concepto(params)]
    }

    def save() {
        def conceptoInstance = new Concepto(params)
        if (!conceptoInstance.save(flush: true)) {
            render(view: "create", model: [conceptoInstance: conceptoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'concepto.label', default: 'Concepto'), conceptoInstance.id])
        redirect(action: "show", id: conceptoInstance.id)
    }

    def show(Long id) {
        def conceptoInstance = Concepto.get(id)
        if (!conceptoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "list")
            return
        }

        [conceptoInstance: conceptoInstance]
    }

    def edit(Long id) {
        def conceptoInstance = Concepto.get(id)
        if (!conceptoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "list")
            return
        }

        [conceptoInstance: conceptoInstance]
    }

    def update(Long id, Long version) {
        def conceptoInstance = Concepto.get(id)
        if (!conceptoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (conceptoInstance.version > version) {
                conceptoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'concepto.label', default: 'Concepto')] as Object[],
                          "Another user has updated this Concepto while you were editing")
                render(view: "edit", model: [conceptoInstance: conceptoInstance])
                return
            }
        }

        conceptoInstance.properties = params

        if (!conceptoInstance.save(flush: true)) {
            render(view: "edit", model: [conceptoInstance: conceptoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'concepto.label', default: 'Concepto'), conceptoInstance.id])
        redirect(action: "show", id: conceptoInstance.id)
    }

    def delete(Long id) {
        def conceptoInstance = Concepto.get(id)
        if (!conceptoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "list")
            return
        }

        try {
            conceptoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'concepto.label', default: 'Concepto'), id])
            redirect(action: "show", id: id)
        }
    }
}
