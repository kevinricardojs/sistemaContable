 $(document).ready(function() {
 	$('select:not(.no-select)').material_select();
 	//$('.modal').modal();

 	var dialog = document.querySelector('#dialog-edit');
 	var showDialogButton = document.querySelector('#dialog-edit-btn');
 	if (!dialog.showModal) {
 		dialogPolyfill.registerDialog(dialog);
 	}
 	showDialogButton.addEventListener('click', function() {
 		dialog.showModal();
 	});
 	dialog.querySelector('.close').addEventListener('click', function() {
 		dialog.close();
 	});

 	/*ajax contribuyentes*/
 	$('#dialog-edit-btn').click(function() {
 		var select_contribuyentes = $('#select_contribuyentes');
 		var select_establecimientos = $('#select_establecimientos');
 		var borrar = $('.borrar-option');
 		$(borrar).children('option').remove();
 		$(borrar).html("<option disabled selected> Selecciona una opción</option>");
 		$.post('/peticion_json/contribuyentes.json', function(data) {
 			if (data.length !== 0)
 			{
 				for (var i = data.length - 1; i >= 0; i--) {
 					id = data[i].id;
 					nit = data[i].nit;
 					nombre = data[i].nombre;
 					option = "<option value="+ id + ">" + nit + "  —  " + nombre +"</option>";
 					$(select_contribuyentes).append(option);
 				};
 			}
 			else
 			{

 				$(select_contribuyentes).append("<option value=''>No hay ningun Contribuyente</option>");
 			}
 		});
 		select_contribuyentes.change(function() {
 			var contribuyente_id = $('#select_contribuyentes option:selected').val();
 			$.post( "/peticion_json/establecimientos.json", { id: contribuyente_id}, function(data) {
 				if (data.length !== 0)
 				{
 					$(select_establecimientos).children('option').remove();
 					for (var i = data.length - 1; i >= 0; i--) {
 						console.log(i);
 						id = data[i].id
 						nombre = data[i].nombre
 						option = "<option value="+ id + ">" + nombre +"</option>"
 						$(select_establecimientos).append(option)
 					};
 				}
 				else
 				{

 					$(select_establecimientos).append("<option value=''>No hay ningun establecimiento</option>");
 				}
 			});
 		});
 	});
 	/**/
 });
 