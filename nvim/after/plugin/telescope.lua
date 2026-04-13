-- Требует установленного ripgrep
-- 1. Safety Check: Stop if telescope isn't installed
local status, telescope = pcall(require, "telescope")
if not status then
    return
end

-- 2. Main Configuration (setup)
telescope.setup({
  defaults = {
    -- Appearance
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    
    -- Mappings inside the Telescope window
    mappings = {
      i = { -- Insert mode
        ["<C-n>"] = "move_selection_next",
        ["<C-p>"] = "move_selection_previous",
        ["<C-c>"] = "close",
      },
    },
  },
  pickers = {
    -- Specific settings for 'find_files'
    find_files = {
      hidden = true -- Show hidden files (like .env)
    }
  }
})

-- 3. Keybindings (The most important part)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep (Search text)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search Help' })

-- return {
--   'nvim-telescope/telescope.nvim',
--   tag = '0.1.8',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     local builtin = require('telescope.builtin')
--     -- Горячие клавиши для поиска
--     vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--     vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--   end
-- }

