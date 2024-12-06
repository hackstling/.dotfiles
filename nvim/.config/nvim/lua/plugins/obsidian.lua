return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre /home/norbert/hacking/ext/**.md",
    --   "BufNewFile /home/norbert/hacking/ext/**.md",
    -- },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Second Brain",
          path = "$HOME/SecondBrain/",
        },
      },

      -- disable_frontmatter = true,

      -- key mappings, below are the defaults
      mappings = {
        -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
    })
  end
}
