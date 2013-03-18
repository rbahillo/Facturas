

class SessionFilters {
	def filters = {
		loginCheck(controller: 'admin', invert: true, action: '*') {
			before = {
				if(System.getProperty("grails.env").equals("prod")){
					def logged = session.getAttribute("admin")
					if(logged==null)
						logged=false
					System.out.print(controllerName)
					if (!logged) {
						flash.message = "Tienes que estar logado para hacer esa operacion"
						redirect(controller:"admin", action: 'index')
						return false
					}
				}
				else
					return true
			}
		}
	}

}
