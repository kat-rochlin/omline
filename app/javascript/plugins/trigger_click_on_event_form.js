const triggerClickOnEventForm = () => {
  const to_render = document.querySelector("#form-to-render")
  if (to_render) {
    if (to_render.dataset.toRender == "true") {
      $('#create-event-btn').click();
    }
  }
}

export { triggerClickOnEventForm }
