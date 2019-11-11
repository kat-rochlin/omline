import $ from 'jquery';
import 'select2';
import "select2/dist/css/select2.css"

const initSelect2 = () => {
  $('#user_nationality').select2({ width: '100%' });
};

const multiSelect2 = () => {
  $(document).ready(function() {
      $('.js-example-basic-multiple').select2({
        placeholder: {
          id: '-1', // the value of the option
          text: 'Select an option'
        }
      });
  });
};

export { initSelect2 };
export { multiSelect2 };
