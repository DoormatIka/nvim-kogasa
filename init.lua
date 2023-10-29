local set = vim.opt
local api = vim.api
local keyset = vim.keymap.set
local global = vim.g

set.ft = xxd
set.updatetime = 300
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = false
set.number = true
set.clipboard = "unnamedplus"
set.cursorline = true
set.cursorlineopt = "both"

vim.opt.termguicolors = true
vim.wo.wrap = false
vim.wo.linebreak = false

global.mapleader = ";"
set.pyxversion = 3
global.clipboard = {
  ['name'] = 'WslClipboard',
  ['copy'] = {
    ["+"] = 'clip.exe',
    ["*"] = 'clip.exe',
  },
  ['paste'] = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  ['cache_enabled'] = 0,
}

-- startup commands
local bufread_commands = api.nvim_create_augroup("BufRead", { clear = true })
api.nvim_create_autocmd("BufRead", {
  command = "Neotree",
  group = bufread_commands
})

-- resize -10 for resizing
-- vresize for vertical

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

local completion_opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1): v:lua.check_back_space() ? "<TAB>" : coc#refresh()',  completion_opts)
keyset("i", "<C-Space>", "coc#refresh()", {silent = true, expr = true})
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], completion_opts)
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
keyset("t", "<Esc>", "<C-\\><C-n>")
vim.cmd([[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ CheckBackSpace() ? "\<TAB>" :
              \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])

-- scroll floating documentations/windows
---@diagnostic disable-next-line: redefined-local
local floating_opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-Down>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-Down>"', floating_opts)
keyset("n", "<C-Up>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-Up>"', floating_opts)
keyset("i", "<C-Down>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', floating_opts)
keyset("i", "<C-Up>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', floating_opts)
keyset("v", "<C-Down>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', floating_opts)
keyset("v", "<C-Up>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', floating_opts)

-- snippet trigger (Ctrl+J)
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

local code_actions_opts = {silent = true, nowait = true}
-- show commands kinda like vscode
keyset("n", "<leader>c", ":<C-u>CocList commands<cr>", code_actions_opts)

-------------- PLUGINS ---------------
require("plugins")

-- colorizer
require'colorizer'.setup()

-- tailwindCSS
vim.cmd([[
	au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']
]]) 

-- <leader> = ";"
local builtin = require("telescope.builtin")
keyset("n", "<leader>ff", builtin.find_files, {})
keyset("n", "<leader>fg", builtin.live_grep,  {})
keyset("n", "<leader>fb", builtin.buffers,    {})
keyset("n", "<leader>fh", builtin.help_tags,  {})
keyset("n", "<leader>fw", function() vim.cmd("Telescope projects") end, {})
-- windows settings
vim.o.winwidth = 15
vim.o.winminwidth = 10
vim.o.equalalways = false
-- windows keybinds
keyset("n", "<C-w>z", "<Cmd>WindowsEqualize<CR>")
keyset("n", "<C-w>p", "<Cmd>WindowsMaximize<CR>")

-- theme
vim.cmd("colorscheme rose-pine")
