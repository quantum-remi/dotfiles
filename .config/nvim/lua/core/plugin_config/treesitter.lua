require'nvim-treesitter.configs'.setup { 
-- A list of parser names, or "all"
  ensure_installed = {"c", "lua", "vim", "markdown", "markdown_inline", "vimdoc", "query", "css", "fish", "hyprlang", "toml", "yaml", "html"},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

require("nvim-treesitter.install").prefer_git = true
