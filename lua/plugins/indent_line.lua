-- return {
--   { -- Add indentation guides even on blank lines
--     'lukas-reineke/indent-blankline.nvim',
--     -- Enable `lukas-reineke/indent-blankline.nvim`
--     -- See `:help ibl`
--     main = 'ibl',
--     opts = {},
--   },
-- }
--
return { 
  -- Add indentation guides even on blank lines
  -- See `:help ibl`
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '┊'
    },
  },
}
