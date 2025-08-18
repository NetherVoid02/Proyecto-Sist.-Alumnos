//Rellenar el tbody de alumnos
document.addEventListener("DOMContentLoaded", () => {
  const tbody = document.querySelector("#alumnosTable tbody");

fetch("/alumnos")
  .then(res => res.json())
  .then(data => {
    data.forEach(alumno => {
      const fila = document.createElement("tr");
      fila.className = "hover:bg-gray-100"; // color de fondo al pasar el mouse

      fila.innerHTML = `
        <td class="px-4 py-2 text-sm text-gray-700">${alumno.id_alumno}</td>
        <td class="px-4 py-2 text-sm text-gray-700">${alumno.legajo}</td>
        <td class="px-4 py-2 text-sm text-gray-700">${alumno.nombre}, ${alumno.apellido.toUpperCase()}</td>
        <td class="px-4 py-2 text-sm text-gray-700">${alumno.dni}</td>
        <td class="px-4 py-2 flex gap-2 justify-center">
          <button
             class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 h-9 rounded-md px-3 text-green-600 hover:text-green-800 hover:bg-green-100"
             onclick='abrirFormularioEdicion(${JSON.stringify(alumno)})'>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-square-pen h-4 w-4">
                 <path d="M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                 <path d="M18.375 2.625a1 1 0 0 1 3 3l-9.013 9.014a2 2 0 0 1-.853.505l-2.873.84a.5.5 0 0 1-.62-.62l.84-2.873a2 2 0 0 1 .506-.852z"></path>
                </svg>Editar
          </button>
          <button
              class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 h-9 rounded-md px-3 text-blue-600 hover:text-blue-800 hover:bg-blue-100"
              onclick='verMasAlumno(${JSON.stringify(alumno)})'>
               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-file-text h-4 w-4">
                 <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z"></path>
                 <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
                 <path d="M10 9H8"></path>
                 <path d="M16 13H8"></path>
                 <path d="M16 17H8"></path>
               </svg>Ver mas
          </button>
        </td>`;
      tbody.appendChild(fila);
    });
  })
  .catch(error => {
    console.error("Error al cargar los alumnos:", error);
  });
});
function verMasAlumno(alumno) {
  const detalleDiv = document.getElementById("detalleAlumno");

  detalleDiv.innerHTML = `
    <p><strong>ID:</strong> ${alumno.id_alumno}</p>
    <p><strong>Legajo:</strong> ${alumno.legajo}</p>
    <p><strong>Nombre y Apellido:</strong> ${alumno.nombre}, ${alumno.apellido.toUpperCase()}</p>
    <p><strong>DNI:</strong> ${alumno.dni}</p>
    <p><strong>CUIL:</strong> ${alumno.cuil}</p>
    <p><strong>Email:</strong> ${alumno.email || "—"}</p>
    <p><strong>Teléfono:</strong> ${alumno.fecha_nacimiento || "—"}</p>
    <p><strong>Dirección:</strong> ${alumno.direccion || "—"}</p>
    <p><strong>Hermanos:</strong> ${alumno.hermanos}</p>
    <p><strong>Link documentacion:</strong> ${alumno.link_docu}</p>
    <p><strong>Nombre tutor:</strong> ${alumno.tutor_nombre}, ${alumno.tutor_apellido.toUpperCase()|| "—"}</p>
    <p><strong>DNI Tutor:</strong> ${alumno.tutor_dni || "—"}</p>
    <p><strong>CUIL Tutor:</strong> ${alumno.tutor_cuil || "—"}</p>
    <p><strong>Telefono tutor:</strong> ${alumno.tutor_telefono || "—"}</p>
    <p><strong>Email tutor:</strong> ${alumno.tutor_email || "—"}</p>
    <p><strong>Direccion tutor:</strong> ${alumno.tutor_direccion || "—"}</p>
  `;

   mostrarModal(document.getElementById("modalVerMas"));
}


//Maneja la data de la creacion de alumno
document.getElementById("formAlumno").addEventListener("submit", async function(e) {
  e.preventDefault();

  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());

// Convertir el coso de variantes
  data.hermanos = data.hermanos === "true";
  data.legajo = Number(data.legajo);
  data.dni = Number(data.dni);
  data.cuil = Number(data.cuil);
  data.tutor_dni = Number(data.tutor_dni);
  data.tutor_cuil = Number(data.tutor_cuil);

  try {
    const response = await fetch("/alumnos", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data)
    });

    if (!response.ok) throw new Error("Error al insertar alumno con tutor");

    alert("Alumno y tutor insertados correctamente");
    location.reload();
  } catch (error) {
    console.error("Error:", error);
    alert("Error al agregar alumno y tutor");
  }
});

//funcion que abre el modal con el formulario rellenado con la funcion global de formulariosDinamicos.js
function abrirFormularioEdicion(alumno) {
  llenarFormulario("formAlumnoEditar", alumno);
  mostrarModal(document.getElementById("modalEditarAlumno"));
}
//proceso de buscar alumno para editar
configurarBuscadorEntidad({
  inputId: "inputDniBuscar",
  botonId: "btnBuscarAlumno",
  endpoint: "/alumnos",
  campoBusqueda: "dni",
  callbackAbrirModal: abrirFormularioEdicion
});


document.getElementById("formAlumnoEditar").addEventListener("submit", async function(e) {
  e.preventDefault();

  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());

  data.legajo = Number(data.legajo);
  data.dni = Number(data.dni);
  data.cuil = Number(data.cuil);
  data.tutor_dni = Number(data.tutor_dni);
  data.tutor_cuil = Number(data.tutor_cuil);
  data.hermanos = data.hermanos === "true";

  try {
    const response = await fetch(`/alumnos/${data.id_alumno}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data)
    });

    if (!response.ok) throw new Error("Error al actualizar alumno");

    alert("Alumno actualizado correctamente");
    location.reload();
  } catch (error) {
    alert("Error al actualizar");
    console.error(error);
  }
});
