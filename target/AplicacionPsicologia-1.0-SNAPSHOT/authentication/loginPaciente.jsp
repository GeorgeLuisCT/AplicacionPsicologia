<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Iniciar sesión - Paciente</title>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../javascript/loginPaciente.js"></script>
    </head>
    <body>

        <section class="vh-100" style="background-color: #449DD1;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="../public/images/paciente relleno.jpeg"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; height: 100%;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form  id="loginFormPaciente" action="/AplicacionPsicologia/LoginServlet" method="post">

                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <i class="fas fa-cubes fa-2x me-3" style="color: #449DD1;"></i>
                                                <span class="h1 fw-bold mb-0">App Psicologia</span>
                                            </div>

                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Inicia Sesión como paciente</h5>

                                            <div class="form-outline mb-4">
                                                <input type="email" name="email" id="form2Example17" class="form-control form-control-lg" style="background-color: #150578; color: #f8f9fa;" />
                                                <label class="form-label" for="form2Example17">Correo electronico</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" name="contrasena" id="form2Example27" class="form-control form-control-lg" style="background-color: #150578; color: #f8f9fa;" />
                                                <label class="form-label" for="form2Example27">Contraseña</label>
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <input type="hidden" name="tipo" value="paciente">
                                                <input class="btn btn-dark btn-lg btn-block" type="submit" value="Iniciar sesión" style="background-color: #192BC2;">
                                            </div>

                                            <a class="small text-muted" href="#!">¿Olvidaste tu contraseña?</a>
                                            <p class="mb-5 pb-lg-2">¿Aún no tienes una cuenta? <a href="registroPaciente.jsp" style="color: #78C0E0;">Regi­strate aquí</a></p>
                                        
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="alert alert-warning alert-dismissible fade show fixed-top text-center d-none" role="alert" id="myAlert">
            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
            <button type="button" class="btn-close" aria-label="Close"></button>
        </div>


        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
    </body>
</html>
