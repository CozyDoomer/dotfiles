-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  -- { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  
}
