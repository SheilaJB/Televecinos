// Función para mostrar la ventana emergente de confirmación
function confirmarEliminacion() {
    // Mostrar ventana emergente con mensaje de confirmación
    var confirmacion = confirm("¿Deseas banear a este usuario?");
    if (confirmacion) {
        // Si el usuario presiona 'Aceptar', eliminar el elemento de la tabla
        eliminarFila();
    } else {
        // Si el usuario presiona 'Cancelar', no hacer nada
        console.log("Cancelado");
    }
}

// Función para eliminar la fila de la tabla
function eliminarFila() {
    // Obtener la referencia a la fila que se va a eliminar
    var fila = event.target.closest("tr");
    // Eliminar la fila de la tabla
    fila.remove();
    console.log("Vecino baneado");
}
