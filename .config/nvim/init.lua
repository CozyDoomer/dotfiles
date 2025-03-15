-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- (python) append poetry envs to virtual env selection
require("swenv").setup {
  -- other options
  venvs_path = vim.fn.expand "~/.cache/pypoetry/virtualenvs",
  get_venvs = function(venvs_path)
    local venvs = require("swenv.api").get_venvs()
    local more_venvs = {}
    local scan_dir = require("plenary.scandir").scan_dir
    local _, Path = pcall(require, "plenary.path")
    -- poetry venv source
    local paths = scan_dir(venvs_path, { depth = 1, only_dirs = true, silent = true })
    for _, path in ipairs(paths) do
      table.insert(more_venvs, {
        name = Path:new(path):make_relative(venvs_path),
        path = path,
        source = "poetry",
      })
    end

    local function tableMerge(result, ...)
      for _, t in ipairs { ... } do
        for _, v in ipairs(t) do
          table.insert(result, v)
        end
      end
    end

    local merged_venvs = {}
    tableMerge(merged_venvs, venvs, more_venvs)
    return merged_venvs
  end,
}

-- display notifications bottom right
require("notify").setup {
  top_down = false,
}
