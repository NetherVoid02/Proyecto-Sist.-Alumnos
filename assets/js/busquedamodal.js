// Función para buscador dinamico nomas con parametros
function configurarBuscadorEntidad({ 
  inputId, 
  botonId, 
  endpoint, 
  campoBusqueda, 
  callbackAbrirModal 
}) {
  document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById(inputId);
    const boton = document.getElementById(botonId);

    if (!input || !boton) {
      console.error(`No se encontró el input o el botón con id: ${inputId}, ${botonId}`);
      return;
    }

    boton.addEventListener("click", async () => {
      const valor = input.value.trim();
      if (!valor) {
        alert(`Ingrese un valor válido para ${campoBusqueda}`);
        return;
      }

      try {
        const response = await fetch(endpoint);
        if (!response.ok) throw new Error(`Error al obtener datos de ${endpoint}`);

        const registros = await response.json();
        const entidad = registros.find(e => String(e[campoBusqueda]) === valor);

        if (!entidad) {
          alert(`No se encontró ningún registro con ${campoBusqueda} = ${valor}`);
          return;
        }

        // Llamar al callback que abre el modal con los datos encontrados
        callbackAbrirModal(entidad);

        //limpiar el input para que quede vaci o
        input.value = "";

      } catch (error) {
        console.error(`Error al buscar en ${endpoint}:`, error);
        alert("Error en la búsqueda");
      }
    });
  });
}
