## Main Components of my Nvim Config
* core
    * keymappings
    * settings
    * autocmds
* plugins
* util
* snippets
* after/ftplugin


## Desired Functionality
- [x] code formatting
- [x] tmux-vim-navigator
- [x] surround plugin
- [x] autopairs plugin
- [x] which key
- [x] indent-blankline
- [x] rainbow parenthesis
    - [ ] keymap to toggle
- [x] commenting (Comment.nvim)
    - [x] not using Comment.nvim
- [x] treesitter
    - [x] improved syntax highlighting
    - [x] incremental selection
    - [x] decremental selection
    - [x] treesitter-context
- [x] LSP, Mason
    - [x] go to file functionality (have in this current iteration)
    - [x] c/c++
    - [x] python
    - [x] lua
    - [x] bash
    - [x] md
    - [x] latex
- [ ] telescope
    - [x] search for files in filetree
    - [x] search keybinds
    - [x] grep through files in filetree
    - [x] diagnostics
    - [x] quickfix
    - [ ] available snippets (based on filetype) (there is a telescope-luasnip plugin avail, but have not been able to get it working yet..)
- [x] completion engine (nvim-cmp)
    - [x] docs & scrolling
- [x] snippets engine (LuaSnip)
    - [x] useful snippets.. (c, python, md, latex)
    - [x] use register s for impromptu snippet
    - [ ] set up personal snippets sourcing
- [x] quickfix integration
- [x] function/autocommand to resume previous cursor position on BufEnter
- [x] function/autocommand to delete all trailing whitespace before BufPreWrite
- [x] toggle relative linenumber on focus
- [x] keybind for global search and replace
- [ ] move over
    - [x] settings
    - [x] keymaps
    - [x] autocmds
    - [x] commands
    - [x] after files
    - [x] check after files to ensure appropriate
- [ ] harpoon
- [ ] linting
    - [ ] c/c++, python, lua, bash, latex, md, etc
- [ ] latex live preview
- [ ] markdown live preview
- [ ] session management
    - [ ] 1, 2, 3, 4 could be used to load particular sessions!!
- [ ] git integration -- kickstart has something good, but it was throwing errors, will have to resolve at some point
    - [ ] lazygit
    - [ ] gitsigns
        - [ ] toggle with keybind
    - [ ] ...
- [ ] undo tree
- [ ] colorscheme switcher plugin
- [ ] notetaking plugin
- [ ] automkdir plugin
- [ ] terminal integration
- [ ] debugging (dap)
    - [x] installed
    - [ ] configured
    - [ ] c, python, lua, etc.
- [ ] test integration plugin?
- [ ] motion plugins? (https://github.com/rockerBOO/awesome-neovim)
- [ ] register previewing?
- [ ] SETTINGS
    - [x] scrolloff = 10
    - [x] disable swap file
    - [x] set undo file dir
    - [x] no newline comment


### Future Features
- [ ] Debugging (nvim-dap)
- [ ] easy folding
    - [] function to toggle foldlevel
- [ ] wildmenu completion
- [ ] nvchad theme switcher
- [ ] wildmenu compeltion (wilder) -- this may already be accomplished through nvim-cmp

