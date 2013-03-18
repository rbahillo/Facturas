import com.admin.AdminUser;
import com.impuestos.Iva;


class BootStrap {

    def init = { servletContext ->
		
		if(!Iva.count()){
			new Iva(descripcion: "Super Reducido", valor: 4, ivaPorDefecto:false).save(failOnError: true)
			new Iva(descripcion: "Reducido", valor:10, ivaPorDefecto:false).save(failOnError: true)
			new Iva(descripcion: "General", valor:21, ivaPorDefecto:true).save(failOnError: true)
		}
		if(!AdminUser.count()){
			new AdminUser(user:"Fe", password:"fevialda").save(true)
		}
    }
    def destroy = {
    }
}
