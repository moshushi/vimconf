require("core.options")
require("core.providers")
require("core.keymaps")
require("core.neovide")

-- Если запущен под Linux добавить плагин для редактирования под sudo
-- if vim.uv.os_uname().sysname == "Linux" then
--   vim.pack.add({ "https://github.com/lambdalisue/vim-suda" })
--   vim.g.suda_smart_edit = 1 -- Автоматически предлагать sudo при нехватке прав
-- end


vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/shellRaining/hlchunk.nvim",
  -- "https://github.com/nvim-lua/plenary.nvim",     -- Зависимость для telescope и других, набор lua-функций
  "https://github.com/hiphish/rainbow-delimiters.nvim",
  "https://github.com/nvim-mini/mini.surround",
  -- "https://github.com/Saghen/blink.cmp", -- выбрать один из них
  -- "https://github.com/hrsh7th/nvim-cmp",
})

-- Автозагрзука настроек плагинов идёт из after/plugin
-- require('plugins.name') -- загрузка плагина директинво из его конфига в lua/plugins/name

-- :lua vim.pack.update() - проверяет наличие обновлений для всех плагинов, добавленных через vim.pack.add()
-- :lua vim.pack.del('имя плагина')
-- :scriptnames - посмотреть все скрипт
