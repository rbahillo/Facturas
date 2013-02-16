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
    height: 500,
    width: 600,
    title: 'Crear Concepto',
    modal: true,
    //open: function(event, ui) { $(".ui-dialog-titlebar").hide(); },
    close: function(){
        $("#dialogCreateConcepto").html('');
    }
});

$("#dialogEditConcepto").dialog({
    autoOpen: false,
    height: 500,
    width: 600,
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
	        valor: $('#valor').val(),
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
	        valor: $('#valor').val(),
	        idx: $('#idx').val(),
	        ivaId:  $('input:radio[name=ivaId]:checked').val(),
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
	


$("#saveConcept_btn").click(actualizarConcepto);
$("#updateConcept_btn").click(editarConceptoFromModal);
$("#deleteConcept_btn").click(borrarConcepto);
