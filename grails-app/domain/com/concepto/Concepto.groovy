package com.concepto

class Concepto {
	
	String concepto;
	double valor;

    static constraints = {
		concepto(blank:false)
		valor(blank:false)
    }
}
