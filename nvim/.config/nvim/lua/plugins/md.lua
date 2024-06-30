return {
  -- {'ellisonleao/glow.nvim',config = true, cmd = "Glow"},

  'preservim/vim-markdown',

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

}
