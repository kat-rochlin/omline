import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';

const initFlatpickr = () => {


const startDateInput = document.getElementById('event_start_time');
const endDateInput = document.getElementById('event_end_time');


if (startDateInput) {
  flatpickr(startDateInput, {
    minDate: "today",
    enableTime: true,
    dateFormat: "Y-m-d h:i K",
  });

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      enableTime: true,
      dateFormat: "Y-m-d h:i K",
      });
  });
}};

export { initFlatpickr }
