

import '../plugins/init_mapbox'

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import flatpickr from "flatpickr";

import $ from 'jquery';
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/initSelect2';
import { multiSelect2 } from '../plugins/initSelect2';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { multiField } from '../plugins/initSelect2';
import { formDuplicate } from '../components/formDuplicate'
import { triggerClickOnEventForm } from '../plugins/trigger_click_on_event_form';

initFlatpickr();

window.initMapbox = initMapbox
//initMapbox();
initSelect2();
multiSelect2();
formDuplicate();
triggerClickOnEventForm();


const removeFlash = () => {
  document.querySelector(".custom-notice").remove()
}

setTimeout(removeFlash, 5000);


