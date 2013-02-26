if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}


	 
$("#dialogCreateConcepto").dialog({
    autoOpen: false,
    height: 550,
    width: 650,
    title: 'Crear Concepto',
    modal: true,
    //open: function(event, ui) { $(".ui-dialog-titlebar").hide(); },
    close: function(){
        $("#dialogCreateConcepto").html('');
    }
});

$("#dialogEditConcepto").dialog({
    autoOpen: false,
    height: 550,
    width: 650,
    title: 'Editar Concepto',
    modal: true,
    //open: function(event, ui) { $(".ui-dialog-titlebar").hide(); },
    close: function(){
        $("#dialogEditConcepto").html('');
    }
});
 
$("#addConcept_btn").bind("click", function() {
    $.ajax({
        url:'/Facturas/concepto/createPlain',
        success: function(data){
            $("#dialogCreateConcepto").html(data);
            $("#dialogCreateConcepto").dialog("open");
        }
    });
});

function editarConcepto(id){
	var datosConcepto = {
	        id:id
	    }
	$.ajax({
        url:'/Facturas/concepto/editPlain',
        data:datosConcepto,
        success: function(data){
            $("#dialogEditConcepto").html(data);
            $("#dialogEditConcepto").dialog("open");
        }
    });
}
 


function actualizarConcepto(){
	var datosConcepto = {
	        concepto: $('#concepto').val(),
	        valorUnitario: $('#valorUnitario').val(),
	        unidades: $('#unidades').val(),
	        ivaId:  $('input:radio[name=ivaId]:checked').val(),
	        included: $('input:radio[name=included]:checked').val()
	    }
	$.ajax({
        url:'/Facturas/factura/addConcepto',
        data:datosConcepto,
        success: function(response){

        }
	});
	$('#dialogCreateConcepto').dialog('close');
	window.location='/Facturas/factura/actualizaConceptos';
}

function editarConceptoFromModal(){
	var datosConcepto = {
			concepto: $('#concepto').val(),
	        valorUnitario: $('#valorUnitario').val(),
	        unidades: $('#unidades').val(),
	        ivaId:  $('input:radio[name=ivaId]:checked').val(),
	        idx: $('#idx').val(),
	        included: $('input:radio[name=included]:checked').val()
	    }
	$.ajax({
        url:'/Facturas/factura/editConcepto',
        data:datosConcepto,
        success: function(response){

        }
	});
	$('#dialogCreateConcepto').dialog('close');
	window.location='/Facturas/factura/actualizaConceptos';
}

function borrarConcepto(){
	var datosConcepto = {
			idx: $('#idx').val()
	    }
	$.ajax({
        url:'/Facturas/factura/deleteConcepto',
        data:datosConcepto,
        success: function(response){

        }
	});
	$('#dialogCreateConcepto').dialog('close');
	window.location='/Facturas/factura/actualizaConceptos';
}

function updateTitulo(){
	var datosConcepto = {
			titulo: $('#titulo').val()
	    }
	$.ajax({
        url:'/Facturas/factura/addTitulo',
        data:datosConcepto,
        success: function(response){

        }
	});
	window.location='/Facturas/factura/actualizaConceptos';
}
	

  $("#datepicker").datepicker({
	  onSelect: function(date) {
		  var datosFecha = {
					fecha: date
			    }
		  $.ajax({
		        url:'/Facturas/factura/updateNFacturaFecha',
		        data:datosFecha,
		        success: function(response){
		        	$('#nFacturaS').val(response);
		        }
			});
      },
  dateFormat : 'dd/mm/yy', //este formato lo uso xq asi se guarda en mi DB!! tu lo puedes cambiar como mas te guste
  showAnim : 'slideDown',
  changeMonth: true, //muestra una lista de los meses
  changeYear: true, //muestra una lista de los años
  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
  monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
  dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'],
  dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
  weekHeader: 'Sm'
  });
  
 $("#cliente").autocomplete({
	  source: function(request, response){
	   $.ajax({
	    url: "/Facturas/cliente/search", // remote datasource
	    data: request,
	    success: function(data){
	     response(data); // set the response
	    },
	    error: function(){ // handle server errors
	     $.jGrowl("Unable to retrieve Clients", {
	      theme: 'ui-state-error ui-corner-all'   
	     });
	    }
	   });
	  },
	  minLength: 2, // triggered only after minimum 2 characters have been entered.
	  select: function(event, ui) { // event handler when user selects a company from the list.
	   $("#cliente\\.id").val(ui.item.id); // update the hidden field.
	   $("#cliente").val(ui.item.display + "-") // populate the employee field with the nasdaq symbol.
	   var datosCliente = {
	        clientId: ui.item.id
	    }
	   $.ajax({
	        url:'/Facturas/factura/addCliente',
	        data:datosCliente,
	        success: function(response){

	        }
		});
	  }
});
 
 $("#clienteNoUpdate").autocomplete({
	  source: function(request, response){
	   $.ajax({
	    url: "/Facturas/cliente/search", // remote datasource
	    data: request,
	    success: function(data){
	     response(data); // set the response
	    },
	    error: function(){ // handle server errors
	     $.jGrowl("Unable to retrieve Clients", {
	      theme: 'ui-state-error ui-corner-all'   
	     });
	    }
	   });
	  },
	  minLength: 2, // triggered only after minimum 2 characters have been entered.
	  select: function(event, ui) { // event handler when user selects a company from the list.
	   $("#clienteId").val(ui.item.id); // update the hidden field.
	   $("#cliente").val(ui.item.display + "-") // populate the employee field with the nasdaq symbol.
	   $("#searchByClient").removeClass("buttonsSearchDisabled").addClass("buttonsSearch");
	   $("#searchByClient").removeAttr('disabled');
	  }
});


$("#saveConcept_btn").click(actualizarConcepto);
$("#updateConcept_btn").click(editarConceptoFromModal);
$("#deleteConcept_btn").click(borrarConcepto);
$("#titulo").blur(updateTitulo);
