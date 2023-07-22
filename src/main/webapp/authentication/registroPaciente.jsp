<!DOCTYPE html>
<html>
    <head>
        <title>Registro - Paciente</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../javascript/registroPaciente.js"></script>

        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #449DD1;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to bottom right, #449DD1, #449DD1);

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to bottom right, #449DD1, #449DD1);
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }
            .card-registration .select-arrow {
                top: 13px;
            }
        </style>

    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registrarse como paciente</h3>
                                <form id="registroFormPaciente" action="/AplicacionPsicologia/RegistroServlet" method="post">

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <input type="email" name="email" id="emailAddress" required class="form-control form-control-lg" />
                                                <label class="form-label" for="lastName">Correo</label>
                                            </div>

                                        </div>

                                        <div class="col-md-6 mb-4 d-flex align-items-center">

                                            <div class="form-outline datepicker w-100">
                                                <input type="password" name="contrasena" required class="form-control form-control-lg" id="birthdayDate" />
                                                <label for="birthdayDate" class="form-label">Contraseña</label>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-outline">
                                                <input type="number" name="edad" class="form-control form-control-lg" />
                                                <label class="form-label" for="phoneNumber">Edad</label>
                                            </div>

                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <h6 class="mb-2 pb-1">Género </h6>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="genero" id="femaleGender" value="option1" checked />
                                                <label class="form-check-label" for="femaleGender">Femenino</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="genero" id="maleGender" value="option2" />
                                                <label class="form-check-label" for="maleGender">Masculino</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="genero" id="otherGender" value="option3" />
                                                <label class="form-check-label" for="otherGender">Otro</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <input type="hidden" name="tipo" value="paciente">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Registrar" />
                                    </div>

                                </form>

                            </div>

                            <h6>Ya tienes una cuenta? <a href="loginPaciente.jsp">Inicia sesión aquí</a></h6>


                        </div>
                    </div>
                </div>
            </div>
        </section>

        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null && !mensaje.isEmpty()) { %>
        <p><%= mensaje %></p>
        <% } %>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
    </body>
</html>
