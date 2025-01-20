vim.g.mapleader = " "
require("andreasgoth.plugins") -- Must be below leader keymap

-------------------------------------------------------------------------------
-- General config
-------------------------------------------------------------------------------
--vim.cmd.colorscheme("andreasgoth")
--vim.g.colors_name = "andreasgoth"
vim.g.colors_name = "andreasgoth_light"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-------------------------------------------------------------------------------
-- Set
-------------------------------------------------------------------------------

vim.opt.title = true
vim.opt.termguicolors = true
--vim.opt.background = "dark"
--vim.opt.pumblend = 10 --Enables pseudo-transparency for the popup-menu
vim.o.statuscolumn = "%C%s%l "

-- Editing
vim.opt.fileencoding = 'utf-8'
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "" -- Fat cursor
--vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.colorcolumn = "80"
vim.opt.cursorline  = true
vim.opt.number = true
vim.opt.scrolloff = 10 -- Min number of lines to keep above/below the cursor
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "useopen"
vim.opt.undofile = true
vim.opt.completeopt = 'menuone,noselect'
--vim.opt.breakindent = true  -- wrapped line will continue visually indented
vim.opt.inccommand = 'split'

-- No idea how this effects performence
vim.opt.updatetime = 250 -- time to updating things (gutter/diagnostics etc)
vim.o.timeoutlen = 300 -- Time in ms to wait for a mapped sequence to complete

-- Indentation
vim.opt.expandtab = true -- Indent with spaces
vim.opt.shiftwidth = 4   -- Number of spaces to use when indenting
vim.opt.softtabstop = 4  -- Number of spaces a <tab> counts for when inserting
vim.opt.tabstop = 4      -- Width of a <tab> character

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override 'ignorecase' if search contains upper case

-- 'Invisible' characters
vim.opt.list = true
vim.opt.listchars = {
    extends = "❯",
    nbsp = "␣",
    precedes = "❮",
    trail = "·",
    tab = "▸ ",
}

-- vim.keymap.set("n", "<c-c>", "<esc>")
vim.keymap.set("n", "<esc>", ":noh<return><esc>")
vim.keymap.set("n", "<esc>^[", "<esc>^[")

-- alt + j/k to movie lines up and down
-- Had to use weird char from testing with `sed -n l` ¯\_(ツ)_/¯
vim.keymap.set("n", "√", ":m .+1<cr>==")
vim.keymap.set("n", "ª", ":m .-2<cr>==")
vim.keymap.set("i", "√", "<Esc>:m .+1<cr>==gi")
vim.keymap.set("i", "ª", "<Esc>:m .-2<cr>==gi")
vim.keymap.set("v", "√", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "ª", ":m '<-2<cr>gv=gv")

-- Halfpages but keep cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")

-- Keep clipbord after pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Statusline
-- %1*, %2*, etc = User # color
-- %{expand('%:h')} = path
-- %t = filename
-- %m = modified flag
-- %y = file type
-- %-3v = vortial column number
-- %l/%L = current line/total lines
vim.opt.statusline = "%1* %{expand('%:h')}%2* %t%m %3*%y *%= %-3v %l/%L"


-------------------------------------------------------------------------------
-- Auto commands
-------------------------------------------------------------------------------

-- Indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    command = "setlocal ts=4 sts=4 sw=4 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    command = "setlocal ts=2 sts=2 sw=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    command = "setlocal ts=2 sts=2 sw=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    command = "setlocal ts=4 sts=4 sw=4 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    command = "setlocal spell textwidth=72"
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
})

-- Highlight yank
vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank()
    end
})


------------------------------------------------------------------------------
-- LSP
------------------------------------------------------------------------------

local servers = {
    bashls = {},
    clangd = {},
    cssls = {},
    eslint = {},
    gopls = {},
    intelephense = {},
    jsonls = {},
    pyright = {},
    rust_analyzer = {},
    svelte = {},
    tsserver = {},
    html = { filetypes = { 'html', 'twig', 'hbs'} },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}


-- nvim-cmp supports additional completion capabilities,
-- so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

-- Lua
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals  = { "vim" }
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME
                },
            },
        }
    }
}

-- Configure nvim-cmp
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}


-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero
--[[
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    -- Create your keybindings here...
  end
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "gopls",
    "html",
    "intelephense",
    "jsonls",
    "lua_ls",
    "rust_analyzer",
    "svelte",
    "tsserver",
  }
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})


]]--

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<c-p>', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })

-------------------------------------------------------------------------------
-- Providers
-------------------------------------------------------------------------------
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
