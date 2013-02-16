package com.concepto

import com.impuestos.Iva;

class Concepto {
	
	String concepto;
	double valor;
	Iva iva;

    static constraints = {
		concepto(blank:false)
		valor(blank:false)
		iva(blank:false)
    }
}
