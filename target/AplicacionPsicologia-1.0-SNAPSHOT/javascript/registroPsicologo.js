$(document).ready(function() {
  $("#registroFormPsicologo").submit(function(event) {
    event.preventDefault();
    
    var nombre = $("input[name='nombre']").val();
    var email = $("input[name='email']").val();
    var contrasena = $("input[name='contrasena']").val();
    var tipo = $("input[name='tipo']").val();
    var especialidad = $("input[name='especialidad']").val();
    var experiencia = $("input[name='experiencia']").val();
    
    $.post($(this).attr("action"), {
      nombre: nombre,
      email: email,
      contrasena: contrasena,
      tipo: tipo,
      especialidad: especialidad,
      experiencia: experiencia
    }, function(response) {
      if (response.redirect) {
        window.location.href = response.redirect;
      } else {
        alert(response.mensaje);
      }
    });
  });
});
