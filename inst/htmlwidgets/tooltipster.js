HTMLWidgets.widget({

  name: 'tooltipster',

  type: 'output',

  initialize: function(el, width, height) {

    return {  };

  },

  renderValue: function(el, x, instance) {

    $(x.selector).tooltipster();

  },

  resize: function(el, width, height, instance) {

  }

});
