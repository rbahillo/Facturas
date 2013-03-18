<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Victor Login</title>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'victorfavico.ico')}" type="image/x-icon"> 
        <link rel="stylesheet" type="text/css" href="/css/style.css" />
		<script src="/js/modernizr.custom.63321.js"></script>
		<g:javascript library="jquery" plugin="jquery" />
    	
    	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700|Handlee);
			body {
				background: rgb(252, 252, 252) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.5);
			}
		</style>
		<r:layoutResources />
    </head>
    <body>
        <div class="container">
			
			<header>
			
				<div id="grailsLogo" role="banner"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'victor_logo.jpg')}" alt="Grails"/></a></div>
				<g:if test="${flash.message}">
				<br>
				<div class="message" role="status">${flash.message}</div>
				</g:if>
			</header>
			
			<section class="main">
				
				<form class="form-5 clearfix" action="/admin/login">
				    <p>
				        <input type="text" id="username" name="username" placeholder="Usuario">
				        <input type="password" name="password" id="password" placeholder="Contraseña"> 
				    </p>
				    <button type="submit" name="submit">
				    	<i class="icon-arrow-right"></i>
				    	<span>Entrar</span>
				    </button>     
				</form>​​​​
			</section>
			
        </div>
		<!-- jQuery if needed -->
		
    </body>
</html>