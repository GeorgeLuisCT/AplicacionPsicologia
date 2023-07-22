
console.log("hola");
$(document).ready(function() {
  $("#registroFormPaciente").submit(function(event) {
    event.preventDefault();
    
    var nombre = $("input[name='nombre']").val();
    var email = $("input[name='email']").val();
    var contrasena = $("input[name='contrasena']").val();
    var tipo = $("input[name='tipo']").val();
    var edad = $("input[name='edad']").val();
    var genero = $("input[name='genero']").val();
    
        console.log("2");
    
    $.post($(this).attr("action"), {
      nombre: nombre,
      email: email,
      contrasena: contrasena,
      tipo: tipo,
      edad: edad,
      genero: genero
    }, function(response) {
        
            console.log(response);
      if (response.redirect) {
        window.location.href = response.redirect;
      } else {
        alert(response.mensaje);
      }
    });
  });
});
