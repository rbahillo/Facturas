package com.concepto

import com.impuestos.Iva;

class Concepto {
	
	String concepto;
	double unidades
	double valorUnitario;
	double total
	double valorIva;
	Iva iva;

    static constraints = {
		concepto(blank:false)
		valorUnitario(blank:false)
		iva(blank:false)
    }
}
