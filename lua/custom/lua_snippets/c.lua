local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  return
end

local guards = function()
  return vim.api.nvim_buf_get_name(0):match('^.+/(.+)%..+$'):upper() .. '_H'
end

-- vim.keymap.set("n", "<leader><leader>s", "<cmd> source ~/AppData/Local/nvchad/lua/user/luasnip.lua")

local i = luasnip.insert_node
local s = luasnip.snippet
local t = luasnip.text_node
local f = luasnip.function_node
local rep = require('luasnip.extras').rep

luasnip.add_snippets('c', {
  s({
    trig = '#ig',
    name = 'Include guards',
    dscr = 'Create include guards',
  }, {
    t { '#ifndef ' },
    f(guards, {}),
    t { '', '#define ' },
    f(guards, {}),
    t { '', '', '' },
    i(0),
    t { '', '', '#endif /* ' },
    f(guards, {}),
    t { ' */' },
  }),
  s({
    trig = 'test_setup_teardown_impl',
    name = 'Test setup and teardown implementation',
  }, {
    t {
      'static void TestSetup(void)',
      '{',
      '    #include "InitMocks.h"',
      '',
    },
    t { '    ' },
    i(1, 'prefixed_module_name'),
    t { '_Init(E_InitLevel_One);', '' },
    t { '    ' },
    rep(1),
    t { '_Init(E_InitLevel_Two);', '' },
    t { '    ' },
    rep(1),
    t { '_Init(E_InitLevel_Three);', '' },
    t { '}', '', 'static void TestTeardown(void)', '{', '    #include "VerifyDestroyMocks.h"', '}', '' },
  }),
  s({
    trig = 'test_setup_teardown_decl',
    name = 'Test setup and teardown declaration',
  }, {
    t {
      '/* setup for all tests (except init tests): init mocks and execute all init levels. */',
      'static void TestSetup(void);',
      '',
      '/* teardown for all tests (except init tests): verify and destroy mocks. */',
      'static void TestTeardown(void);',
      '',
    },
  }),
  s({
    trig = 'test_group',
    name = 'Test group setup including test group runner',
  }, {
    t { '/*-- ' },
    i(1, 'test group name'),
    t { ' --------------------------------------------------------*/', '' },
    t { '', 'TEST_GROUP(' },
    rep(1),
    t { ');', '' },
    t { '' },
    t { '', 'TEST_SETUP(' },
    rep(1),
    t { ')', '' },
    t { '{', '' },
    t { '', '    TestSetup();', '' },
    t { '}', '' },
    t { '', 'TEST_TEAR_DOWN(' },
    rep(1),
    t { ')', '' },
    t { '{', '' },
    t { '    TestTeardown();', '' },
    t { '}', '' },
    t { '', 'TEST(' },
    rep(1),
    t { ', ' },
    i(2, 'test name'),
    t { ')', '' },
    t { '{', '', '}', '' },
    t { '', 'TEST_GROUP_RUNNER(' },
    rep(1),
    t { ')', '' },
    t { '{', '' },
    t { '    RUN_TEST_CASE(' },
    rep(1),
    t { ', ' },
    rep(2),
    t { ');', '' },
    t { '}', '' },
  }),
  s({
    trig = 'header',
    name = 'C-header-file',
  }, {
    t { '/***********************************************************************', '' },
    t { ' * Copyright B. Braun Melsungen AG', '' },
    t { ' * Project: Software GrIPS', '' },
    t { ' **********************************************************************/', '' },
    t { '' },
    f(guards(), {}),
  }),
})
