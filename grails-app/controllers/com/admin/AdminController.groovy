package com.admin


class AdminController 
{

    def index = 
	{
		def logged = session.getAttribute("admin")
		if(logged==null)
			logged=false
		if(logged)
		{
			redirect(controller: "factura", action: "index")
		}
		else{
		render(view: "/admin/login")
		}
	}
	
	def logout =
	{
		session.setAttribute("admin", false)
		session.setAttribute("admin_username", "")
		
		redirect action:"index"
		
	}
	
	def login = 
	{
		flash.clear()
		def logged = false
		def admin = AdminUser.findByUserAndPassword(params.username,params.password)
		if(admin)
		{
			logged = true
			session.setAttribute("admin", true)
			session.setAttribute("admin_username", params.username)
			admin.setLast_logged(new Date())
			admin.save(false)
		}
			
		if(logged){	
			flash.message = "You are now logged in"
			redirect(controller: "factura", action: "index")
		}	
		else{
			flash.message = "Nombre de Usuario o Password no valido"
			redirect action:"index"
		}	
			
		
	}
}
