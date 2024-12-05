return require("packer").startup(function(use)
  require("nvim-tree").setup({

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- for file icons
    },
    config = function()
      -- Disable netrw to let nvim-tree manage the file explorer
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Enable true colors
      vim.opt.termguicolors = true

      -- Configure nvim-tree
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              git = true,
              file = false,
              folder = false,
              folder_arrow = true,
            },
            glyphs = {
              folder = {
                arrow_closed = "⏵",
                arrow_open = "⏷",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "⌥",
                renamed = "➜",
                untracked = "★",
                deleted = "⊖",
                ignored = "◌",
              },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  }
})
end)

