package com.admin

import java.util.Date;

class AdminUser {
	
	String user;
	String password;
	Date last_logged;

    static constraints = {
		user(maxSize:512, blank: true, nullable : false)
		password(maxSize:512, blank: true, nullable : false)
    }
}
