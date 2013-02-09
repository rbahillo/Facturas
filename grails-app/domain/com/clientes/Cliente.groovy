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

    static constraints = {
		nif(blank:false)
		empresa(blank:false)
		nombre(blank:false)
		apellidos(blank:false)
		direccion(blank:false)
		cp(blank:false)
		poblacion(blank:false)
		provincia(blank:false)
		pais(nullable:true)
		telefono(nullable:true)
		movil(nullable:true)
    }
}
