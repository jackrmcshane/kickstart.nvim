--[[

If you don't know anything about Lua, I recommend taking some time to read through
a guide. One possible example which will only take 10-15 minutes:
  - https://learnxinyminutes.com/docs/lua/

After understanding a bit more about Lua, you can use `:help lua-guide` as a
reference for how Neovim integrates Lua.
- :help lua-guide
- (or HTML version): https://neovim.io/doc/user/lua-guide.html

Next, run AND READ `:help`.
  This will open up a help window with some basic information
  about reading, navigating and searching the builtin help documentation.

  This should be the first place you go to look when you're stuck or confused
  with something. It's one of my favorite Neovim features.

  MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
  which is very useful when you're not exactly sure of what you're looking for.

I have left several `:help X` comments throughout the init.lua
  These are hints about where to find more information about the relevant settings,
  plugins or Neovim features used in Kickstart.

 NOTE: Look for lines like this

  Throughout the file. These are for you, the reader, to help you understand what is happening.
  Feel free to delete them once you know what you're doing, but they should serve as a guide
  for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

--]]

local plugins = 'plugins'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'settings'
require 'keymaps'
require 'autocmds'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
require 'util.ensure_lazy_installed'
--
-- [[ Configure and install plugins ]]
require('lazy').setup(
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  plugins,
  {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
  }
)

-- greeting message (kirby dance)
vim.cmd [[ echom "<(\"<) <('')> (>\")>" ]]
