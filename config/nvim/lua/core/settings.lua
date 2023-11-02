-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Helpers
-----------------------------------------------------------
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

local function list(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({value, str}, sep) or value
end

-----------------------------------------------------------
-- General
-----------------------------------------------------------

cmd("syntax on")
cmd("syntax sync minlines=3000")
cmd("filetype plugin indent on")

g.terraform_fmt_on_save = 1
g.terraform_align = 1

opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------

opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.wrap = false              -- stop wrapping
opt.termguicolors = true
opt.mouse=""
opt.cmdheight=2

-- remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 500         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

opt.tags = opt.tags + 'external.tags'

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.tabstop = 2           -- 1 tab == 4 spaces
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
-- cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd[[
  autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0
]]

-- 2 spaces for selected filetypes
cmd[[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua setlocal shiftwidth=2 tabstop=2
]]

cmd[[
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
]]

-- IndentLine
g.indentLine_enabled = 0       -- set indentLine character

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = list {
  'menuone',
  'noselect',
  'noinsert'
}

opt.shortmess = 'cFIWO' 	-- don't show completion messages


-----------------------------------------------------------
-- More visual
-----------------------------------------------------------

opt.list = true
opt.listchars = list {
  "tab: ──",
  "space:·",
  "nbsp:␣",
  "trail:•",
  "eol:↵",
  "precedes:«",
  "extends:»"
}

opt.fillchars = list {
  "vert:▏",
  "diff:╱"
}

opt.sessionoptions = list {
  "blank",
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize"
}

opt.diffopt = list {
  "algorithm:histogram",
  "internal",
  "indent-heuristic",
  "filler",
  "closeoff",
  "iwhite",
  "vertical"
}
