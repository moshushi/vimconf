
-- Отключение неиспользуемых провайдеров
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
-- vim.g.loaded_python3_provider = 0 -- Отключение только если не используются Python плагины

if vim.uv.os_uname().sysname == "Linux" then
    vim.g.python3_host_prog = vim.fn.expand('~/.local/share/nvim/python-provider/bin/python3')
end

if vim.uv.os_uname().sysname == "Windows_NT" then
    local local_app_path = os.getenv("LOCALAPPDATA")
    vim.g.python3_host_prog = local_app_path .. "\\nvim-data\\provider-python\\Scripts\\python.exe"
end
