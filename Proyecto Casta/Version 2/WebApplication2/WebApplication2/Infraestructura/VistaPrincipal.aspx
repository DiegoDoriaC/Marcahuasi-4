<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VistaPrincipal.aspx.cs"
    Inherits="WebApplication2.Infraestructura.VistaPrincipal" %>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sistema de Registro de Turistas</title>

        <link href="../stilos/bootstrap.min.css" rel="stylesheet" />
        <script src="../javascript/bootstrap.bundle.min.js"></script>
        <script src="../scripts/sweetalert2.all.min.js"></script>
        <script src="../Scripts/qz-tray.js"></script>
        
        <link href="../modalBuscar/bootstrap.min.css" rel="stylesheet"/>
        <script src="../modalBuscar/bootstrap.bundle.min.js"></script>
        <style>

            :root {
                --primary-color: #0f4c81;
                --primary-hover: #0a355c;
                --bg-light: #f4f7f6;
                --text-main: #111827;
                --text-muted: #4b5563;
                --card-bg: #ffffff;
                --border-color: #94a3b8;
                --focus-ring: rgba(15, 76, 129, 0.25);
                --font-base: system-ui, -apple-system, sans-serif;
            }

            body.dark-mode {
                --primary-color: #3b82f6;
                --primary-hover: #60a5fa;
                --bg-light: #121212;
                --text-main: #f8fafc;
                --text-muted: #cbd5e1;
                --card-bg: #1e1e1e;
                --border-color: #475569;
                --focus-ring: rgba(59, 130, 246, 0.35);
            }

            body {
                background-color: var(--bg-light);
                color: var(--text-main);
                font-family: var(--font-base);
                font-size: 18px;
                transition: background-color 0.3s ease, color 0.3s ease;
                margin: 0;
            }

            .navbar-custom {
                background-color: #0f4c81 !important;
                padding: 15px 0;
            }

            body.dark-mode .navbar-custom {
                background-color: #000000 !important;
            }

            .navbar-brand {
                font-size: 30px;
                margin-left: 20px;
                font-weight: 700;
                letter-spacing: 0.5px;
            }

            .theme-btn {
                border-radius: 50%;
                width: 45px;
                height: 45px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
            }

            .card {
                background-color: var(--card-bg);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
                margin-bottom: 2rem;
                transition: all 0.3s ease;
            }

            .card-header {
                background-color: rgba(0, 0, 0, 0.03);
                border-bottom: 1px solid var(--border-color);
                padding: 1.25rem 1.5rem;
            }

            body.dark-mode .card-header {
                background-color: rgba(255, 255, 255, 0.05);
            }

            .card-header h5 {
                font-size: 1.4rem;
                font-weight: 700;
                margin: 0;
                color: var(--text-main);
            }

            .card-body,
            .card-bodyD {
                padding: 2rem;
            }

            .form-label {
                font-size: 1.15rem;
                font-weight: 600;
                color: var(--text-main);
                margin-bottom: 0.6rem;
            }

            .form-control,
            .form-select {
                font-size: 1.15rem;
                padding: 0.8rem 1rem;
                border: 2px solid var(--border-color);
                border-radius: 8px;
                background-color: var(--card-bg);
                color: var(--text-main);
                transition: all 0.2s;
                box-shadow: none;
            }

            .form-control:focus,
            .form-select:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 5px var(--focus-ring);
                outline: none;
            }

            .form-control:read-only {
                background-color: rgba(0, 0, 0, 0.05);
            }

            body.dark-mode .form-control:read-only {
                background-color: rgba(255, 255, 255, 0.05);
            }

            .btn {
                font-size: 1.15rem;
                font-weight: 600;
                padding: 0.8rem 1.5rem;
                border-radius: 8px;
                transition: all 0.2s;
            }

            .btn-success {
                background-color: #16a34a;
                border-color: #16a34a;
                color: white;
            }

            .btn-success:hover {
                background-color: #15803d;
                border-color: #15803d;
                transform: translateY(-2px);
            }

            body.dark-mode .btn-success {
                background-color: #22c55e;
                color: #000;
            }

            body.dark-mode .btn-success:hover {
                background-color: #16a34a;
                color: white;
            }

            .table {
                color: var(--text-main);
                font-size: 1.1rem;
            }

            .table thead {
                background-color: var(--primary-color);
                color: white;
            }

            body.dark-mode .table thead {
                background-color: #000000;
            }

            .table-bordered th,
            .table-bordered td {
                border: 1px solid var(--border-color);
            }

            .table th {
                padding: 1rem;
                font-size: 1.15rem;
                font-weight: 600;
                border: none;
            }

            .table td {
                padding: 1rem;
                vertical-align: middle;
            }

            #mostrarInicioSesion {
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.75);
                z-index: 9999;
                display: flex;
                align-items: center;
                justify-content: center;
                backdrop-filter: blur(4px);
            }

            #mostrarInicioSesion.show {
                opacity: 1;
                visibility: visible;
            }

            .login-container {
                background-color: var(--card-bg);
                border: 1px solid var(--border-color);
                border-radius: 16px;
                padding: 3rem;
                width: 100%;
                max-width: 480px;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                transform: translateY(20px);
                transition: transform 0.3s ease;
            }

            #mostrarInicioSesion.show .login-container {
                transform: translateY(0);
            }

            .login-header {
                margin-bottom: 30px;
                text-align: left;
            }

            .login-header h1 {
                font-size: 2.2rem;
                font-weight: 700;
                color: var(--text-main);
                margin-bottom: 0.5rem;
            }

            .login-header p {
                font-size: 1.2rem;
                color: var(--text-muted);
                text-align: left;
            }

            .login-field {
                margin-bottom: 1.2rem;
            }

            .login-field label {
                display: block;
                font-size: 1.15rem;
                font-weight: 600;
                color: var(--text-main);
                margin-bottom: 0.5rem;
            }

            .login-field input {
                width: 100%;
                padding: 1rem 1.2rem;
                font-size: 1.15rem;
                background-color: var(--card-bg);
                border: 2px solid var(--border-color);
                border-radius: 8px;
                color: var(--text-main);
                transition: all 0.2s ease;
            }

            .login-field input:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 5px var(--focus-ring);
                outline: none;
            }

            .submit-btn {
                width: 100%;
                padding: 1.1rem;
                background-color: var(--primary-color);
                color: #ffffff;
                border: none;
                border-radius: 8px;
                font-size: 1.2rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.2s;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .submit-btn:hover {
                background-color: var(--primary-hover);
                transform: translateY(-2px);
            }

            #cerrarBtn {
                background-color: transparent;
                color: var(--text-main);
                border: 2px solid var(--border-color);
            }

            #cerrarBtn:hover {
                background-color: rgba(0, 0, 0, 0.05);
                transform: none;
            }

            body.dark-mode #cerrarBtn {
                border-color: var(--border-color);
            }

            body.dark-mode #cerrarBtn:hover {
                background-color: rgba(255, 255, 255, 0.05);
            }

            .bordeCeleste {
                border: 1px solid #94a3b8
            }

            .floating-support {
                position: fixed;
                bottom: 20px;
                left: 20px;
                background-color: var(--primary-color);
                color: #ffffff;
                padding: 12px 20px;
                border-radius: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 1.15rem;
                font-weight: 600;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                z-index: 1000;
                transition: transform 0.2s, background-color 0.2s;
                cursor: default;
            }

            .floating-support:hover {
                background-color: var(--primary-hover);
                transform: translateY(-3px);
            }

            body.dark-mode .floating-support {
                background-color: #1e1e1e;
                color: #e2e8f0;
                border: 1px solid var(--border-color);
            }
            .floating-buscar {
                position: fixed;
                bottom: 80px;
                left: 20px;
                background-color: var(--primary-color);
                color: #ffffff;
                padding: 12px 20px;
                border-radius: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 1.15rem;
                font-weight: 600;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                z-index: 1000;
                transition: transform 0.2s, background-color 0.2s;
                cursor: default;
            }

            .floating-buscar:hover {
                background-color: var(--primary-hover);
                transform: translateY(-3px);
                cursor:pointer;
            }

            body.dark-mode .floating-buscar {
                background-color: #1e1e1e;
                color: #e2e8f0;
                border: 1px solid var(--border-color);
            }

            .floating-user {
                position: fixed;
                bottom: 20px;
                right: 20px;
                background-color: var(--card-bg);
                color: var(--text-main);
                border: 1px solid var(--border-color);
                padding: 12px 20px;
                border-radius: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 1.15rem;
                font-weight: 600;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                z-index: 1000;
                transition: transform 0.2s, background-color 0.2s;
                cursor: default;
            }

            .floating-user:hover {
                transform: translateY(-3px);
            }

            body.dark-mode .floating-user {
                background-color: #1e1e1e;
                color: #e2e8f0;
                border: 1px solid var(--border-color);
            }

            .support-icon {
                flex-shrink: 0;
                width: 28px;
                height: 28px;
            }

            .btn-edit {
                border: none;
                background: transparent;
                color: var(--primary-color);
                padding: 0.4rem 0.6rem;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border-radius: 6px;
                transition: all 0.2s;
            }

            .btn-edit:hover {
                background-color: rgba(0, 0, 0, 0.05);
                color: var(--primary-hover);
            }

            body.dark-mode .btn-edit:hover {
                background-color: rgba(255, 255, 255, 0.1);
            }
        </style>

        <script>

            function soloNumeros(e) {
                var char = e.key;
                return /^[0-9]$/.test(char);
            }

            function iniciarSession() {
                document.getElementById('mostrarInicioSesion').classList.add("show");
            }

            function ocultarInicioSesion() {
                document.getElementById('mostrarInicioSesion').classList.remove("show");
            }

            function imprimirExito() {
                Swal.fire({
                    title: "¡Registro exitoso!",
                    text: "Se ha registrado exitosamente",
                    icon: "success",
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true
                })
                setTimeout(function () {
                    window.location.href = "VistaPrincipal.aspx";
                }, 2000)
            }

            function actualizarExito() {
                Swal.fire({
                    title: "¡Actualizacion exitosa!",
                    text: "Se ha actualizado exitosamente",
                    icon: "success",
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true
                })
                setTimeout(function () {
                    window.location.href = "VistaPrincipal.aspx";
                }, 2000)
            }

            function errorTicket(texto) {
                Swal.fire({
                    icon: "error",
                    title: "Oops... Algo salió mal",
                    html: `<small style="font-size:20px">` + texto + `</small>`
                });
            }
            function errorBuscar(texto) {
                Swal.fire({
                    icon: "error",
                    title: "Oops... Ingrese todos los datos",
                    html: `<small style="font-size:20px">` + texto + `</small>`
                });
            }
            //-------------------------------mensaje de error al buscar turista--------------------------
            function MensajeErrorBuscar() {
                const Nombre = document.getElementById('txtNombre')?.value;
                const Apellido = document.getElementById('txtApellido')?.value;

                let mensajeError = "";
                if (Nombre.trim() == "")
                    mensajeError += "*Ingrese el nombre";
                if (Apellido.trim() == "")
                    mensajeError += "*Ingrese el apellido";

                if (mensajeError != "") {
                    errorBuscar(mensajeError);
                    return;
                }
            }

            //-------------------------------configuracion para la impresion terminca--------------------------
            async function imprimirDirecto() {
                const Nombre = document.getElementById('txtNombre')?.value;
                const Apellido = document.getElementById('txtApellido')?.value;
                const cboNacionalidad = document.getElementById('ddlNacionalidad');
                const Nacionalidad = cboNacionalidad.options[cboNacionalidad.selectedIndex].text;

                let precio = 0;
                if (Nacionalidad == "Nacional") precio = document.getElementById('hdPrecioNacional').value;
                else if (Nacionalidad == "Extranjero") precio = document.getElementById('hdPrecioInternacional').value;
                else precio = document.getElementById('hdPrecioEstudiante').value;

                let mensajeError = "";
                if (Nombre.trim() == "")
                    mensajeError += "*Ingrese el nombre ";
                if (Apellido.trim() == "")
                    mensajeError += "*Ingrese el apellido";

                if (mensajeError != "") {
                    errorTicket(mensajeError);
                    return;
                }

                try {

                    if (!qz.websocket.isActive()) {
                        try {
                            await qz.websocket.connect();
                        } catch (err) {
                            console.error("No se pudo conectar a QZ Tray:", err);
                            return;
                        }
                    }

                    const config = qz.configs.create("POS-58");
                    const data = [
                        "\x1B\x40",

                        "\x1B\x21\x20",
                        "COMITE COMUNAL DE TURISMO\n",
                        "S. P. DE CASTA\n",

                        "\x1B\x61\x00",
                        "--------------------------------\n",

                        `Nombres: \n ${Nombre}\n`,
                        `Apellidos: \n ${Apellido}\n`,
                        `Nacionalidad: \n ${Nacionalidad}\n`,
                        `Precio: S / ${precio}\n`,
                        `Fecha: ${new Date().toLocaleDateString()} ${new Date().toLocaleTimeString()}\n`,

                        "--------------------------------\n",

                        "\n\n\n",

                        "\x1D\x56\x00"
                    ]

                    await qz.print(config, data);
                    qz.websocket.disconnect();
                    registrarTicket();

                } catch (error) {
                    errorTicket("Error al imprimir, ningún dato fue registrado");
                }
            }


            async function actualizarDirecto() {
                const Nombre = document.getElementById('txtEditNombre')?.value;
                const Apellido = document.getElementById('txtEditApellido')?.value;
                const cboNacionalidad = document.getElementById('ddlEditNacionalidad');
                const Nacionalidad = cboNacionalidad.options[cboNacionalidad.selectedIndex].text;

                let precio = 0;
                if (Nacionalidad == "Nacional") precio = document.getElementById('hdPrecioNacional').value; 
                else if (Nacionalidad == "Extranjero") precio = document.getElementById('hdPrecioInternacional').value; 
                else precio = document.getElementById('hdPrecioEstudiante').value;

                let mensajeError = "";
                if (Nombre.trim() == "")
                    mensajeError += "*Ingrese el nombre ";
                if (Apellido.trim() == "")
                    mensajeError += "*Ingrese el apellido";

                if (mensajeError != "") {
                    errorTicket(mensajeError);
                    return;
                }

                try {
                    if (!qz.websocket.isActive()) {
                        try {
                            await qz.websocket.connect();
                        } catch (err) {
                            console.error("No se pudo conectar a QZ Tray:", err);
                            return;
                        }
                    }

                    const config = qz.configs.create("POS-58");
                    const data = [
                        "\x1B\x40",

                        "\x1B\x21\x20",
                        "COMITE COMUNAL DE TURISMO\n",
                        "S. P. DE CASTA\n",

                        "\x1B\x61\x00",
                        "--------------------------------\n",

                        `Nombres: \n ${Nombre}\n`,
                        `Apellidos: \n ${Apellido}\n`,
                        `Nacionalidad: \n ${Nacionalidad}\n`,
                        `Precio: S / ${precio}\n`,
                        `Fecha: ${new Date().toLocaleDateString()} ${new Date().toLocaleTimeString()}\n`,

                        "--------------------------------\n",

                        "\n\n\n",

                        "\x1D\x56\x00"
                    ]

                    await qz.print(config, data);
                    qz.websocket.disconnect();
                    volverAImprimir();
                } catch (error) {
                    errorTicket("Error al imprimir, ningún dato fue actualizado");
                }
            }
            //----------------------------------------------------fin-------------------------------------
            function registrarTicket() {
                document.getElementById('Accion').value = "REGISTRAR";
                document.forms[0].submit();
            }

            function asignarPrecio() {
                const ddlNacionalidad = document.getElementById("ddlNacionalidad");
                const precioInput = document.getElementById("txtPrecio");

                if (ddlNacionalidad && precioInput) {
                    const nacionalidad = ddlNacionalidad.value;
                    switch (nacionalidad) {
                        case "N":
                            precioInput.value = document.getElementById('hdPrecioNacional').value;
                            break;
                        case "E":
                            precioInput.value = document.getElementById('hdPrecioInternacional').value;
                            break;
                        case "S":
                            precioInput.value = document.getElementById('hdPrecioEstudiante').value;
                            break;
                        default:
                            precioInput.value = "0.00";
                    }
                }
            }

            function abrirModalEdicion(boton) {
                var fila = boton.closest('tr');
                if (!fila) return;

                var nombre = fila.cells[0].innerText.trim();
                var apellido = fila.cells[1].innerText.trim();

                var dropDownListOriginal = fila.querySelector('select');
                var nacionalidad = dropDownListOriginal ? dropDownListOriginal.value : 'N';

                document.getElementById('txtEditNombre').value = nombre;
                document.getElementById('txtEditApellido').value = apellido;

                var ddlModalNacionalidad = document.querySelector('select[id*="ddlEditNacionalidad"]');
                if (ddlModalNacionalidad) {
                    ddlModalNacionalidad.value = nacionalidad;
                }

                var myModal = new bootstrap.Modal(document.getElementById('modalEdicion'));
                myModal.show();
            }

            function volverAImprimir() {
                document.getElementById('Accion').value = "ACTUALIZAR";
                document.forms[0].submit();
            }

            function bloquearActualizacion() {
                document.querySelectorAll(".btn-edit").forEach(btn => {
                    btn.removeAttribute("onclick");
                    btn.style.color = "red";
                });
            }
            function buscarTurista() {

                let nombre = document.getElementById("txtNombre").value;
                let apellido = document.getElementById("txtApellido").value;

                let tbody = document.querySelector("#tablaTuristas tbody");

                tbody.innerHTML = `
                <tr>
                    <td>1</td>
                    <td>${nombre}</td>
                    <td>${apellido}</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
            `;
            }
            function limpiarBusquedaTurista() {
                document.getElementById("txtNombres").value = "";
                document.getElementById("txtApellidos").value = "";
                document.getElementById("lblResultadoBusqueda").style.display = "none";

                var grid = document.getElementById("gvBuscarTurista");
                if (grid) {
                    grid.style.display = "none";
                }
            }


            document.addEventListener('DOMContentLoaded', () => {
                const dniInput = document.getElementById('dni');
                const form = document.querySelector('form');

                asignarPrecio()

                if (dniInput) {
                    dniInput.addEventListener('input', function () {
                        this.value = this.value.replace(/\D/g, '');
                    });

                    form.addEventListener('submit', function (e) {
                        if (dniInput.value.length !== 8) {
                            e.preventDefault();
                            alert('El DNI debe tener 8 números');
                            dniInput.focus();
                        }
                    });
                }
            });

        </script>
    </head>
    <body>
        <iframe id="iframeImpresion" style="display: none;"></iframe>

        <form id="form1" runat="server">

            <!----------- CABECERA Inicio ----------->
            <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Marcahuasi Tours</a>

                    <div class="d-flex align-items-center ms-auto gap-3">

                        <span class="navbar-text text-white d-none d-md-block" style="font-size: 24px; opacity: 0.9;">
                            Sistema de Registro
                        </span>

                        <div>
                            <button id="Login" runat="server" onclick="iniciarSession()"
                                class="btn btn-outline-light px-4" type="button"
                                style="margin-right:20px">Login</button>
                        </div>
                    </div>
                </div>
            </nav>
            <!----------- CABECERA Fin ----------->

            <!----------- MODAL INICIO SESION Inicio ----------->
            <div id="mostrarInicioSesion">
                <div class="login-container">
                    <div class="login-header">
                        <h1>Acceso</h1>
                        <p>Ingresa tu DNI y contraseña</p>
                    </div>
                    <div id="loginForm">
                        <div class="login-field">
                            <label for="txtDni">Documento de Identidad (DNI)</label>
                            <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" placeholder="Ej. 12345678"
                                maxlength="8" autocomplete="off" onkeypress="return soloNumeros(event)" />
                        </div>
                        <div class="login-field">
                            <label for="txtPassword">Contraseña</label>
                            <asp:TextBox ID="txtPassword" TextMode="password" runat="server" CssClass="form-control"
                                placeholder="Tu contraseña" autocomplete="new-password" />
                        </div>

                        <asp:Button ID="btnLogin" runat="server" CssClass="submit-btn" Text="Iniciar Sesión"
                            OnClick="IngresarLogin" />

                        <button type="button" class="submit-btn" id="cerrarBtn" onclick="ocultarInicioSesion()">
                            Cerrar Ventana
                        </button>
                        <div id="statusMessage" class="message"></div>
                    </div>
                </div>
            </div>
            <!----------- MODAL INICIO SESION Fin ----------->

            <!----------- FORMULARIO REGISTRO Inicio ----------->
            <div class="container mt-4">
                <div class="card mb-5">
                    <div class="card-header">
                        <h5 style="margin-left:9px">Registro de Turista</h5>
                    </div>
                    <div class="card-bodyD">
                        <div class="row">
                            <div class="col-md-4 mb-4">
                                <label class="form-label" style="margin-left:6px">Nombre del Turista</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"
                                    placeholder="Ingrese nombre" />
                            </div>

                            <div class="col-md-4 mb-4">
                                <label class="form-label" style="margin-left:6px">Apellido del Turista</label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"
                                    placeholder="Ingrese apellido" />
                            </div>

                            <div class="col-md-4 mb-4">
                                <label class="form-label" style="margin-left:6px">Nacionalidad</label>
                                <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-select"
                                    onchange="asignarPrecio()">
                                    <asp:ListItem Text="Nacional" Value="N" Selected="True" />
                                    <asp:ListItem Text="Extranjero" Value="E" />
                                    <asp:ListItem Text="Estudiante" Value="S" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4 mb-4">
                                <label class="form-label" style="margin-left:6px">Precio del Ticket (S/)</label>
                                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ReadOnly="true" />
                            </div>
                        </div>
                        <div class="text-end" style="margin-top: -85px;">
                            <button id="btnGuardar" runat="server" onclick="imprimirDirecto()"
                                class="btn btn-success px-5 py-3" type="button">Registrar Turista</button>
                        </div>
                    </div>
                </div>

                <!--------------------------- TABLA ------------------->
                <div class="card">
                    <div class="card-header">
                        <h5 style="margin-left:9px">Último Ingreso Registrado</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvTuristas" runat="server"
                                CssClass="table table-bordered table-hover text-center bordeCeleste"
                                AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="Nombres" HeaderText="Nombres">
                                        <ItemStyle Width="190px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Apellidos" HeaderText="Apellidos">
                                        <ItemStyle Width="190px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Nacionalidad">
                                        <ItemStyle Width="150px" />
                                        <ItemTemplate>
                                            <asp:DropDownList ID="Nacionalidad" runat="server" CssClass="form-select"
                                                onchange="asignarPrecio()" Enabled="false"
                                                SelectedValue='<%# Bind("Nacionalidad") %>'>
                                                <asp:ListItem Text="Nacional" Value="N" />
                                                <asp:ListItem Text="Extranjero" Value="E" />
                                                <asp:ListItem Text="Estudiante" Value="S" />
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PrecioBoleta" HeaderText="Monto Pagado">
                                        <ItemStyle Width="70px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemStyle Width="20px" />
                                        <ItemTemplate>
                                            <button type="button" class="btn-edit"
                                                onclick="abrirModalEdicion(this)" title="Editar">
                                                <svg width="20" height="20" fill="currentColor"
                                                    class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path
                                                        d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                    <path fill-rule="evenodd"
                                                        d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                                </svg>
                                            </button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <!----------- FORMULARIO REGISTRO FIN ----------->

            <asp:HiddenField ID="Accion" runat="server" Value="" />
            <asp:HiddenField ID="IdIngresoEdit" runat="server" Value="" />
            <asp:HiddenField ID="hdPrecioNacional" runat="server" Value="0" />
            <asp:HiddenField ID="hdPrecioInternacional" runat="server" Value="0" />
            <asp:HiddenField ID="hdPrecioEstudiante" runat="server" Value="0" />

            <!-- Modal de Edición de Turista -->
            <div class="modal fade" id="modalEdicion" tabindex="-1" aria-labelledby="modalEdicionLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" style="padding: 20px">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalEdicionLabel">Editar Información</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="txtEditNombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="txtEditNombre" runat="server">
                            </div>
                            <div class="mb-3">
                                <label for="txtEditApellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="txtEditApellido" runat="server">
                            </div>
                            <div class="mb-3">
                                <label for="ddlEditNacionalidad" class="form-label">Nacionalidad</label>
                                <asp:DropDownList ID="ddlEditNacionalidad" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Nacional" Value="N" />
                                    <asp:ListItem Text="Extranjero" Value="E" />
                                    <asp:ListItem Text="Estudiante" Value="S" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" onclick="actualizarDirecto()">Volver a
                                imprimir</button>
                        </div>
                    </div>
                </div>
            </div>

                        <!----------- BUSCAR TURISTA INICIO ----------->
             <button type="button" class="btn btn-primary floating-buscar" data-bs-toggle="modal" data-bs-target="#modalBuscarTurista" onclick="limpiarBusquedaTurista()">
                Buscar Turista
            </button>
            <div class="modal fade" id="modalBuscarTurista" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Buscar Turista</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Nombres</label>
                                    <asp:TextBox ID="txtNombres"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="Ingrese nombres">
                                    </asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label>Apellidos</label>
                                    <asp:TextBox ID="txtApellidos" runat="server"  CssClass="form-control"  placeholder="Ingrese apellidos">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="text-end">
                                <asp:Button ID="btnBuscarTurista"  runat="server"  Text="Buscar" CssClass="btn btn-success" OnClick="btnBuscarTurista_Click" />
                            </div>
                            <hr />
                            <asp:Label ID="lblResultadoBusqueda" runat="server" style="display:none"></asp:Label>

                            <asp:GridView ID="gvBuscarTurista" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">

                                <Columns>
                                    <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                                    <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                                    <asp:BoundField DataField="Nacionalidad" HeaderText="Nacionalidad" />
                                    <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha_Registro" DataFormatString="{0:dd/MM/yyyy hh:mm tt}" HtmlEncode="false"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
 <!----------- BUSCAR TURISTA FIN ----------->

        </form>

        <!----------- SOPORTE TECNICO INICIO ----------->
        <div class="floating-support" title="Llámanos si necesitas ayuda">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="support-icon">
                <path d="M3 18v-6a9 9 0 0 1 18 0v6"></path>
                <path
                    d="M21 19a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3zM3 19a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H3z">
                </path>
            </svg>
            <span>Soporte: 932 306 660</span>
        </div>
        <!----------- SOPORTE TECNICO FIN ----------->


        <!----------- USUARIO LOGUEADO INICIO ----------->
        <div id="ContEmplAsig" runat="server" class="floating-user" title="Usuario conectado" visible="false">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="support-icon">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
            </svg>
            <span id="lblUsuarioLogueado" runat="server"></span>
        </div>
   
        <script>

</script>

    </body>

    </html>