-- return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- "zbirenbaum/copilot.lua",
  -- cmd = "Copilot",
  -- build = ":Copilot auth",
  -- opts = {
    -- suggestion = { enabled = true },
    -- panel = { enabled = true },
    -- filetypes = {
      -- markdown = true,
      -- help = true,
    -- },
  -- },
-- }
return {
  { "sindrets/diffview.nvim" },
  -- custom config which piggybacks on the copilot extras in lazy.lua.
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          -- use the built-in keymapping for "accept" (<M-l>)
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
  },
}
