
-- Функция для загрузки плагинов из директории plugins с применением настроек
local function load_file(path)
  local co = coroutine.running()
  vim.defer_fn(function()
    loadfile(path)()
    coroutine.resume(co)
  end, 2)
  coroutine.yield()
end

coroutine.wrap(function()
  local plugins = vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true);

  for _, path in ipairs(plugins) do
    load_file(path)
  end
end)()
