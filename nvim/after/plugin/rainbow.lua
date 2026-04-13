-- Безопасно пытаемся подключить модуль плагина
local status_ok, rainbow_delimiters = pcall(require, 'rainbow-delimiters')
if not status_ok then
    return
end

-- Настройка через глобальную переменную
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        -- Для больших файлов (например, логов) можно использовать 'local'
        common = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
