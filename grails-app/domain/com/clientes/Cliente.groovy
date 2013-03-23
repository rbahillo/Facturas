package com.clientes

class Cliente {
	
	static searchable = true
	
	String nif;
	String empresa;
	String nombre;
	String apellidos;
	String direccion;
	String cp;
	String poblacion;
	String provincia;
	String pais;
	String telefono;
	String movil;
	String fax
	Integer pagare

    static constraints = {
		nif(blank:false)
		empresa(blank:false)
		nombre(nullable:true)
		apellidos(nullable:true)
		direccion(blank:false)
		cp(nullable:true)
		poblacion(blank:false)
		provincia(blank:false)
		pais(nullable:true)
		telefono(nullable:true)
		movil(nullable:true)
		fax(nullable:true)
    }
	
	public String getDisplay(){
		StringBuffer sb = new StringBuffer()
		sb.append(nif)
		sb.append(",")
		sb.append(empresa)
		sb.append(",")
		sb.append(nombre)
		sb.append(",")
		sb.append(apellidos)
	}
}
