import '../plugins/init_mapbox'

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import $ from 'jquery';
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/initSelect2';
import { multiSelect2 } from '../plugins/initSelect2';
import { multiField } from '../plugins/initSelect2';
import { formDuplicate } from '../components/formDuplicate'
import { triggerClickOnEventForm } from '../plugins/trigger_click_on_event_form';

window.initMapbox = initMapbox

//initMapbox();
initSelect2();
multiSelect2();
//formDuplicate();
triggerClickOnEventForm();

const removeFlash = () => {
  document.querySelector(".custom-notice").remove()
}

setTimeout(removeFlash, 5000);

