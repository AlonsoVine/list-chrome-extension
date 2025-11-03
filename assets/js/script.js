document.addEventListener("DOMContentLoaded", () => {
  // Defino los elementos del DOM para modificarlos sutilmente
  let formTarea = document.getElementById("formTarea");
  let nombreTarea = document.getElementById("nombreTarea");
  let ulTareas = document.getElementById("listaTareas");

  // Cargamos la lista de tareas de localstorage o un array vacio
  let listaTareas = JSON.parse(localStorage.getItem("tareas")) || [];

  // Guardamos la lista en Localstorage
  function guardarLista() {
    localStorage.setItem("tareas", JSON.stringify(listaTareas));
  }

  // Pintamos la lista don las tareas que tengas
  function pintar() {
    //eliminamos el contenido de la lista cada vez que pintamos
    ulTareas.innerHTML = "";

    //recorremos la lista de tareas pintando cada una de ellas
    listaTareas.forEach((t, i) => {
      // Creo el elemento de la lista y del boton.
      let li = document.createElement("li");
      let delLi = document.createElement("button");
      // Le asigno al elemento li el valor de la nueva tarea.
      li.innerText = t;
      // Le asigno un texto al botón de borrar li y lo adjunto dinámicamente al li.
      delLi.innerText = "Eliminar";
      delLi.addEventListener("click", () => {
        // Eliminamos la tarea y volvemos a pintar las demás(eliminas la de la posicion i )
        listaTareas.splice(i, 1);
        guardarLista();
        pintar();
      });
      li.appendChild(delLi);
      // Publico el nuevo elemento de la lista, lo añado al DOM.
      ulTareas.appendChild(li);
    });
  }

  // Escuchamos por si se intenta registrar una nueva tarea
  formTarea.addEventListener("submit", (event) => {
    // Evitamos que recarge la página.
    event.preventDefault();
    // Definimos una nueva tarea
    let nuevaTarea = nombreTarea.value;

    // Evitamos introducir tareas vacias.
    if (nombreTarea.value.trim() === "") return;

    // Guardo la tarea en el array de tareas
    listaTareas.push(nuevaTarea);

    // Guardamos la lista de tareas en localstorage
    guardarLista();
    pintar();
    formTarea.reset();
  });

  //pintamos al cargar la página
  pintar();
});
