window.PLATZI = {
  init() {
    console.log('Make with love by Platzi');
    PLATZI.misc.selectizeByScope('body')
  },
  tasks: {
    index: {
      setup() {
        console.log('In the index page');
      }
    }
  },
  misc: {
    selectizeByScope(selector) {
      $(selector).find('.selectize').each(function(i, el) {
        $(el).selectize();
        /*alert('Selectize applied(?)');*/
      });
    }
  }
};

$(document).on('turbolinks:load', () => PLATZI.init());