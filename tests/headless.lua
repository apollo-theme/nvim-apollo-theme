local source = debug.getinfo(1, 'S').source:sub(2)
local root = vim.fs.dirname(vim.fs.dirname(source))
vim.opt.runtimepath:prepend(root)
vim.cmd.colorscheme('apollo')

local function color(hex)
  return tonumber(hex:sub(2), 16)
end

local function highlight(name, follow_links)
  return vim.api.nvim_get_hl(0, { name = name, link = follow_links == true })
end

assert(vim.g.colors_name == 'apollo', 'g:colors_name was not set')
assert(vim.o.background == 'dark', 'background was not set to dark')
assert(highlight('Normal').fg == color('#cfbc97'), 'Normal foreground mismatch')
assert(highlight('Normal').bg == color('#141617'), 'Normal background mismatch')
assert(highlight('CursorLineNr').fg == color('#fabd2f'), 'CursorLineNr mismatch')
assert(highlight('String').fg == color('#b8bb26'), 'String mismatch')
assert(highlight('DiagnosticError').fg == color('#fb4934'), 'DiagnosticError mismatch')
assert(highlight('DiagnosticInfo').fg == color('#83a598'), 'DiagnosticInfo mismatch')
assert(highlight('@variable.member', true).link == 'Identifier', '@variable.member link mismatch')
assert(highlight('@keyword.conditional', true).link == 'Conditional', '@keyword.conditional link mismatch')
assert(highlight('@markup.heading', true).link == 'Title', '@markup.heading link mismatch')
assert(vim.g.terminal_color_0 == '#1d2021', 'terminal color 0 mismatch')
assert(vim.g.terminal_color_7 == '#d5c4a1', 'terminal color 7 mismatch')
assert(vim.g.terminal_color_8 == '#665c54', 'terminal color 8 mismatch')
assert(vim.g.terminal_color_15 == '#fbf1c7', 'terminal color 15 mismatch')

vim.cmd('quitall!')
