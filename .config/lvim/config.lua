--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- general
vim.cmd("set timeoutlen=50")

lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true

lvim.builtin.project.active = true
lvim.builtin.nvimtree.setup.view.side = "right"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"
lvim.keys.normal_mode["<C-w>o"] = ":only<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["kj"] = "<ESC>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Telescope last search binding: useful for resuming last search
lvim.builtin.which_key.mappings["sl"] = {
  ":Telescope resume<CR>", "Resume telescope last search"
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
-- session persistence bindings
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
-- markdown preview bindings
lvim.builtin.which_key.mappings["M"] = {
  name = "Markdown",
  p = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" },
  t = { "<cmd>MarkdownPreview<cr>", "Toggle markdown preview" },
  s = { "<cmd>MarkdownPreviewStop<cr>", "Stop markdown preview" },
}

-- spectre search and replace bindings
lvim.builtin.which_key.mappings["R"] = { "Search and Replace" }
lvim.builtin.which_key.mappings["Rw"] = { ":lua require('spectre').open_visual({select_word=true})<CR>",
  "Search and replace selection" }
lvim.builtin.which_key.mappings["Rf"] = { "viw:lua require('spectre').open_file_search()<cr>", "Open file search" }

-- terminal
lvim.builtin.which_key.mappings["t"] = { ":ToggleTerm size=12 direction=horizontal<CR>", "Terminal" }

-- docsstring generator
lvim.builtin.which_key.mappings["D"] = { ":DogeGenerate<CR>", "Python docstring" }

-- neotest bindings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- binding for environment switching
lvim.builtin.which_key.mappings["C"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" }

lvim.builtin.which_key.vmappings["r"] = {
  name = "+Refactor",
  -- Extract supports only visual mode
  e = { "<cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function" },
  f = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", "Extract Function To File" },
  v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>", "Extract Variable" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "+Refactor",
  -- supports only normal
  i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
  I = { "<cmd>lua require('refactoring').refactor('Inline Function')<cr>", "Inline Function" },
  b = { "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", "Extract Block" },
  B = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>", "Extract Block To File" },
}

-- Avante (ai chat) bindings
lvim.builtin.which_key.mappings["a"] = {
  name = "Avante",
  a = { "<cmd>AvanteToggle<CR>", "Toggle Sidebar" },
  r = { "<cmd>AvanteRefresh<CR>", "Refresh Sidebar" },
  f = { "<cmd>AvanteFocus<CR>", "Focus Sidebar" },
  n = { "<cmd>lua require('avante').goto_next()<CR>", "Next Block" },
  p = { "<cmd>lua require('avante').goto_prev()<CR>", "Previous Block" },
  s = { "<cmd>AvanteAsk<CR>", "Ask About File" },
}

lvim.builtin.which_key.vmappings["a"] = {
  name = "Avante",
  e = {
    function()
      vim.cmd("normal! gv")
      vim.cmd("AvanteEdit")
    end,
    "Edit Selected Code"
  },
  s = { "<cmd>AvanteAsk<CR>", "Ask About Selection" },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  local actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
end

-- Additional Plugins
lvim.plugins = {
  { "AckslD/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "mfussenegger/nvim-dap-python" },
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "InsertEnter"
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "bufread",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "tpope/vim-fugitive" },
  { "kkoomen/vim-doge",  doge_doc_standard_python = 'numpy' },
  -- :call doge#install()
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    commit = "e8ed1ac5562bf1a9002fc1d49ae6b0a6a83d1d4d",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      -- add any opts here
      provider = "claude",        -- or your preferred provider
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      windows = {
        position = "right",
        width = 30,
      },
      hints = {
        enabled = false
      }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- -- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic",   -- off, basic, strict
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

-- --@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  {
    exe = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", args = { "--ignore=E203", "--max-line-length=88" }, filetypes = { "python" } },
  {
    exe = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--severity", "warning" },
  },
  {
    exe = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
  {
    exe = "eslint",
    filetypes = { "javascript", "javascriptreact" },
  },
}
-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

require('swenv').setup({
  -- other options
  venvs_path = vim.fn.expand('~/.cache/pypoetry/virtualenvs'),
  get_venvs = function(venvs_path)
    local venvs = require('swenv.api').get_venvs()
    local more_venvs = {}
    local scan_dir = require('plenary.scandir').scan_dir
    local _, Path = pcall(require, 'plenary.path')
    -- poetry venv source
    local paths = scan_dir(venvs_path, { depth = 1, only_dirs = true, silent = true })
    for _, path in ipairs(paths) do
      table.insert(more_venvs, {
        name = Path:new(path):make_relative(venvs_path),
        path = path,
        source = 'poetry',
      })
    end

    local function tableMerge(result, ...)
      for _, t in ipairs({ ... }) do
        for _, v in ipairs(t) do
          table.insert(result, v)
        end
      end
    end

    local merged_venvs = {}
    tableMerge(merged_venvs, venvs, more_venvs)
    return merged_venvs
  end
})

-- copilot settings
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

-- docstring generator format
vim.g["doge_doc_standard_python"] = "numpy"

-- columns for max line length of black
vim.opt.colorcolumn = "88"
