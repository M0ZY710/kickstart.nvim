local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

return {
  -- main function in C
  s('main', {
    t {
      '#include <stdio.h>',
      '#include <stdlib.h>',
      '',
      'int main(void) {',
      '    ',
      '    return EXIT_SUCCESS;',
      '}',
    },
  }),
}
