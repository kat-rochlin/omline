import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import $ from 'jquery';
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/initSelect2';
import { triggerClickOnEventForm } from '../plugins/trigger_click_on_event_form';

initMapbox();
initSelect2();
triggerClickOnEventForm();
