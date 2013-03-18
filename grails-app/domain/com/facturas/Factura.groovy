package com.facturas

import java.text.SimpleDateFormat;

import com.clientes.Cliente;
import com.concepto.Concepto;
import com.impuestos.Iva;

class Factura {
	
	Integer nFactura;
	Date fecha;
	Cliente cliente;
	static hasMany = [conceptos: Concepto]
	double iva;
	double subTotal;
	double total;
	String titulo
	
    static constraints = {
		titulo(nullable:true)
    }
	
	public double getIva(){
		double res = 0;
		conceptos.each {
			res+=it.valorIva
		}
		return res
	}
	
	public double getSubTotal(){
		
		double res = 0;
		conceptos.each {
			res+=it.total
		}
		return res;
	}
	
	public double getTotal(){
		
		double res = 0;
		conceptos.each {
			res+=(it.total+it.valorIva)
		}
		return res;
	}
	
	public List<Concepto> getConceptoList(){
		
		List<Concepto> res = new ArrayList<Concepto>();
		conceptos.each {
			res.add(it)
		}
		return res;
	}
	
	public Map<Double, Double> getIvaMap(){
		Map<Double, Double> res= new HashMap<Double, Double>();
		conceptos.each {
			Double tipoIva = it.iva.valor
			def iva=res.get(tipoIva)
			if(iva==null)
				iva=0
			iva+=it.valorIva	
			res.put(tipoIva, iva)
		}
		return res
	}
	
	public String getYear(){
		SimpleDateFormat formatNowYear = new SimpleDateFormat("yyyy");
		String currentYear = "yyyy"
		if(fecha!=null)
			currentYear = formatNowYear.format(fecha);
		return currentYear;
	}
}
