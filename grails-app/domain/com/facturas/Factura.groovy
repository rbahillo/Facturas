package com.facturas

import com.clientes.Cliente;
import com.concepto.Concepto;
import com.impuestos.Iva;

class Factura {
	
	Integer nFactura;
	Date fecha;
	Cliente cliente;
	static hasMany = [conceptos: Concepto]
	double iva;
	double total;
	
    static constraints = {
    }
	
	public double getTotal(){
		
		double res = 0;
		conceptos.each {
			res+=it.valor
		}
		if(res!=0){
			res=res+((res*iva.valor)/100)
		}
		return res;
	}
}
