-- Clojures
vim.g.rainbow_active = 1
vim.g.paredit_electric_return = 1
vim.g.paredit_smartjump = 1
vim.g.paredit_matchlines = 1000

vim.api.nvim_exec([[
  autocmd FileType BufNewFile,BufRead *.bb set ft=clojure
]], false)

vim.g.rainbow_conf = {
  guifgs = {
    'SeaGreen3',
    'firebrick3',
    'RoyalBlue3',
  }
}

vim.g.clojure_maxlines = 150

--  Align strings the pretty way
vim.g.clojure_align_multiline_strings = 1

--  Why not?!?
-- vim.g.clojure_fold = 1
vim.g.clojure_special_indent_words = 'render,deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'
vim.g.clojure_fuzzy_indent = 1
vim.g.clojure_fuzzy_indent_patterns = {
  '^do',
  '^this-as',
  '^initial-state',
  '^with',
  '^def',
  '^let',
  '^if-let*',
  '^when-let*',
  '^select',
  '^insert',
  '^create',
  '^update',
  '^delete',
  '^before',
  '^before-all',
  '^after',
  '^after-all',
  '^around',
  '^describe',
  '^it',
  '^ANY',
  '^GET',
  '^POST',
  '^PUT',
  '^PATCH',
  '^DELETE',
  '^OPTIONS',
  '^table',
  '^drop',
  '^fact',
  '^dom/{.*}',
  '^did',
  '^will',
  '^match',
  '^render',
  '^with-pre-wrap',
  '^with-post-wrap',
  '^deftask',
  '^go-loop',
  '^wired{.*}',
  '^taps',
  '^defclass',
  '^defui',
  '^query',
  '^ident'
}
