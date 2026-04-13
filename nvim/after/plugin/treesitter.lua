-- Требует установленного компилятора
-- Требует установленного компилятора

-- Safe load check
local status, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts_configs.setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "python",
    "ansible",
    "yaml",
    "markdown",        -- Fixed typo: was "makrdown"
    "markdown_inline"
  },
  highlight = {
    enable = true,
  },
  -- Optional: ensure filetypes are mapped correctly
  sync_install = false,
  auto_install = true,
})
