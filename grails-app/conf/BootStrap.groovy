import com.impuestos.Iva;

class BootStrap {

    def init = { servletContext ->
		new Iva(descripcion: "Super Reducido", valor: 4).save(failOnError: true)
		new Iva(descripcion: "Reducido", valor:10).save(failOnError: true)
		new Iva(descripcion: "General", valor:21).save(failOnError: true)
    }
    def destroy = {
    }
}
