import $ from 'jquery';
import 'select2';
import "select2/dist/css/select2.css"

const initSelect2 = () => {
  $('#user_nationality').select2({ width: '100%' });
};

export { initSelect2 };
