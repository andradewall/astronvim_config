return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "css",
      "html",
      "javascript",
      "json",
      "php",
      "phpdoc",
      "scss"
    })

    opts.auto_install = true

    opts.highlight = {
      enable = true,
    }

    opts.indent = {
      enable = true,
    }
  end,
}
