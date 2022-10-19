return function()
   require('nest').applyKeymaps {
     -- Disable Ex mode
     { 'Q', '<Nop>' },

     { '<CR>', '<Cmd>:noh<CR><CR>' },

     { '<c--><c-->', '<Cmd>Commentary<CR>' },
     -- Window navigate
     { '<c-h>', '<c-w>h' },
     { '<c-k>', '<c-w>k' },
     { '<c-j>', '<c-w>j' },
     { '<c-l>', '<c-w>l' },

     { 'j', 'gj' },
     { 'k', 'gk' },

     { '<c-p>', '<Cmd>Files<CR>' },
     { 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>' },

     { '/', '//g<Left><Left><Left>' },
     { 'ss', ':s//g<Left><Left>' },
     { '<leader>', {
         -- Ctags lookup for ruby modules
         { ']', 'viw<c-[>vB<c-]>' },
         -- Forget anything?
         { '??', '<Cmd>:vsplit ~/.dotfiles/config/nvim/lua/plugins/nest.lua <CR>' },
         { 's', '<Cmd>:vsplit<CR>' },
         -- Clojure Eval
         { 'ce', '<Cmd>:Eval<CR>' },

         { 'v', '<Cmd>NvimTreeToggle<CR>' },
         -- Search buffers
         { '<space>', '<Cmd>Telescope buffers<CR>' },

         -- Cheatsheet
         { 'cs', '<Cmd>:vsplit ~/.dotfiles/nvim/cheatsheet.md <CR>' },

         { 'd', {
             { 'd', '<Cmd>DiffviewOpen<CR>' },
             { 'c', '<Cmd>DiffviewClose<CR>' },
         }},
         { 'g', {
             { 'g', '<Cmd>Git<CR>' },
             { 'aa', '<Cmd>Git add --all<CR>' },
             { 'm', '<Cmd>Git merge<CR>' },
             { 'b', '<Cmd>Git blame<CR>' },
             { 'c', '<Cmd>Git commit<CR>' },
             { 'p', '<Cmd>Git push<CR>' },
         }},
         { 't', {
             { 'n', '<Cmd>:TestNearest<CR>' },
             { 't', '<Cmd>:TestFile<CR>' },
             { 'a', '<Cmd>:TestSuite<CR>' },
             { 'l', '<Cmd>:TestLast<CR>' },
             { 'g', '<Cmd>:TestVisit<CR>' },
         }},
         { 'f', {
             { 'y', '<Cmd>Telescope neoclip<CR>' },
             { 'D', '<Cmd>Telescope lsp_declaration<CR>' },
             { 'a', '<Cmd>Telescope lsp_code_actions<CR>' },
             { 'f', '<Cmd>Telescope find_files<CR>' },
             { 'l', '<Cmd>Telescope live_grep<CR>' },
             { 'g', {
                 { 'b', '<Cmd>Telescope git_branches<CR>' },
                 { 'c', '<Cmd>Telescope git_commits<CR>' },
                 { 's', '<Cmd>Telescope git_status<CR>' },
             }},
         }},
         { 'l', {
             { 'n', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>' },
             { 'p', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>' },
             { 'D', '<Cmd>Telescope lsp_declaration<CR>' },
             { 'd', '<Cmd>lua vim.lsp.buf.definition()<CR>' },
             { 'c', '<Cmd>lua vim.lsp.buf.code_actions()<CR>' },
             { 'r', '<Cmd>lua vim.lsp.buf.rename()<CR>' },
             { 's', '<Cmd>lua vim.lsp.buf.signature_help()<CR>' },
             { 'h', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
         }},
     }},

     { mode = 'v', {
         { 'ss', ':s//g<Left><Left>' },
     }}
   }
end
