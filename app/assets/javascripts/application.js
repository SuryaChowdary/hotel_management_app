//= require jquery3
//= require popper
//= require bootstrap/dist/js/bootstrap
import '@popperjs/core';

import { createPopper } from '@popperjs/core';

const popper = document.querySelector('.popper');
const reference = document.querySelector('.reference');

createPopper(reference, popper, {
  modifiers: [
    {
      name: 'offset',
      options: {
        offset: [0, 8],
      },
    },
  ],
});
