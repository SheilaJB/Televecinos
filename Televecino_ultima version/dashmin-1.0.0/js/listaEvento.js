// Variable global para mantener el ID del evento a eliminar
var eventIdToDelete;

// Función para abrir el modal de confirmación
function confirmDelete(eventId) {
    // Guardar el ID del evento para su uso posterior
    eventIdToDelete = eventId;
    // Obtener la instancia del modal usando Bootstrap y mostrarlo
    $('#deleteConfirmationModal').modal('show');
}

// Event listener para el botón 'Aceptar' en el modal de confirmación
document.getElementById('confirmDeleteButton').addEventListener('click', function() {
    deleteEvent(eventIdToDelete);
});

// Función para eliminar el evento
function deleteEvent(eventId) {
    // Aquí iría el código para eliminar el evento del servidor
    console.log('Evento a eliminar:', eventId);
    // Por ejemplo, una petición AJAX o fetch
    // Suponiendo que usas fetch y tu API espera una petición DELETE:
    fetch('/api/eventos/' + eventId, {
        method: 'DELETE'
    })
    .then(response => {
        // Verifica si la respuesta del servidor es exitosa
        if (response.ok) {
            return response.json();
        }
        throw new Error('Algo salió mal al eliminar el evento.');
    })
    .then(data => {
        console.log('Evento eliminado:', data);
        // Ocultar el modal de confirmación
        $('#deleteConfirmationModal').modal('hide');
        // Aquí podrías actualizar el DOM para reflejar la eliminación, por ejemplo:
        // document.getElementById('eventRow-' + eventId).remove();
    })
    .catch(error => console.error('Error:', error));
};

function editEvent() {
    window.location.href = 'eventoPropio.html';
}

function viewEvent() {
    // Mostrar ventana emergente con mensaje de éxito
    window.location.href = 'EventoGenerales_C.html';
}