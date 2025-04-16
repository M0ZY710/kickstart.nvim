local ls = require 'luasnip'
local rep = require('luasnip.extras').rep
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

return {
  s('guard', {
    f(function()
      local filename = vim.fn.expand('%:t'):upper():gsub('%.', '_')
      return {
        '#ifndef ' .. filename,
        '#define ' .. filename,
        '',
        '',
        '#endif // ' .. filename,
      }
    end, {}),
  }),

  -- main function in C++
  s('main', {
    t {
      '#include <iostream>',
      '',
      'int main() {',
      '    std::cout << "Hello, world!" << std::endl;',
      '    return 0;',
      '}',
    },
  }),

  -- Interaktive C++ class
  s('class', {
    t 'class ',
    i(1, 'ClassName'),
    t { ' {', 'public:' },
    t { '', '    ' },
    f(function(args)
      return args[1][1] .. '()'
    end, { 1 }),
    t ';',
    t { '', '    ~' },
    rep(1),
    t '();',
    t { '', '', 'private:', '    ' },
    i(0),
    t { '', '};' },
  }),
}
