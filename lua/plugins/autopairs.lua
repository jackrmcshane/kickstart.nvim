-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local conds = require 'nvim-autopairs.conds'
    local cmp = require 'cmp'
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

    -- require('nvim-autopairs').setup {}
    npairs.setup {}

    npairs.add_rules {
      Rule('$', '$', { 'tex', 'latex' })
        -- don't add a pair if the next character is %
        :with_pair(conds.not_after_regex '%%'),
    }

    -- Autoclosing angle-brackets that only proc when being written after a word like so<>,
    -- but not out in the open like so <
    npairs.add_rules {
      Rule('<', '>'):with_pair(conds.before_regex '%a+'):with_move(function(opts)
        return opts.char == '>'
      end),
    }

    -- If you want to automatically add `(` after selecting a function or method
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
