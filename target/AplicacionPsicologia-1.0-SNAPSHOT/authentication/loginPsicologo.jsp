<!DOCTYPE html>
<html lang="es">
    <head>
       <title>Iniciar sesión - Psicólogo</title>

        <meta charset="utf-8">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../javascript/loginPsicologo.js"></script>

        <style>
            .bg-image-vertical {
                position: relative;
                overflow: hidden;
                background-repeat: no-repeat;
                background-position: right center;
                background-size: auto 100%;
            }

            @media (min-width: 1025px) {
                .h-custom-2 {
                    height: 90%;
                }
            }
        </style>
    </head>
    <body>
        <section class="vh-100" style="background-color: #449DD1;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-white">

                        <div class="px-5 ms-xl-4">
                            <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #449DD1;"></i>
                            <span class="h1 fw-bold mb-0">App Psicologia</span>
                        </div>

                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                            <form id="loginFormPsicologo" action="/AplicacionPsicologia/LoginServlet" method="post" style="width: 23rem;">

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar Sesión</h3>

                                <div class="form-outline mb-4">
                                    <input type="email" name="email" required id="form2Example18" class="form-control form-control-lg" style="background-color: #150578; color: #f8f9fa;" />
                                    <label class="form-label" for="form2Example18">Correo electrónico</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" name="contrasena" required id="form2Example28" class="form-control form-control-lg" style="background-color: #150578; color: #f8f9fa;" />
                                    <label class="form-label" for="form2Example28">Contraseña</label>
                                </div>

                                <div class="pt-1 mb-4">
                                    <input type="hidden" name="tipo" value="psicologo">
                                    <input class="btn btn-info btn-lg btn-block" type="submit" value="Iniciar sesión" style="background-color: #192BC2;">
                                </div>

                                <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">¿Olvidaste tu contraseña?</a></p>
                                <p>¿Aún no tienes una cuenta? <a href="registroPsicologo.jsp" class="link-info" style="color: #0E0E52;">Regístrate aquí</a></p>

                            </form>


                        </div>

                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block">
                        <img src="../public/images/relleno.jpeg"
                             alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                    </div>
                </div>
            </div>
        </section>

        <div class="alert alert-warning alert-dismissible fade show fixed-top text-center d-none" role="alert" id="myAlert">
            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
            <button type="button" class="btn-close" aria-label="Close"></button>
        </div>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

    </body>
</html>
