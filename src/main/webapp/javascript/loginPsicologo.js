  $(document).ready(function() {
    $("#loginFormPsicologo").submit(function(event) {
      event.preventDefault();
      
      var email = $("input[name='email']").val();
      var contrasena = $("input[name='contrasena']").val();
      
      $.post($(this).attr("action"), { email: email, contrasena: contrasena, tipo: "psicologo" }, function(response) {
        if (response.redirect) {
          window.location.href = response.redirect;
        } else {
          var alert = $("#myAlert");
          alert.html(response.mensaje);
          alert.removeClass("d-none").addClass("show");
          setTimeout(function() {
            alert.removeClass("show").addClass("d-none");
          }, 3000);
        }
      });
    });
  });