-- 1. Проверяем, загружен ли плагин. 
-- Если вы используете vim.pack.add, плагин уже должен быть в runtimepath.
local status, rainbow = pcall(require, 'rainbow-delimiters')

-- Если плагин не найден, просто выходим без ошибок
if not status then
    return
end

-- 2. Настраиваем глобальную переменную конфигурации
-- В Neovim 0.12.1 это основной способ общения с этим плагином
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow.strategy['global'],
        -- Для терминала или специфических типов файлов можно отключить
        commonlisp = rainbow.strategy['global'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        -- Специальный запрос для Lua, который красит блоки do-end, if-then-else
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

-- 3. (Опционально) Принудительно связываем группы подсветки с цветами вашей темы,
-- если тема их не поддерживает по умолчанию.
local function set_rainbow_colors()
    local colors = {
        Red = '#E06C75',
        Yellow = '#E5C07B',
        Blue = '#61AFEF',
        Orange = '#D19A66',
        Green = '#98C379',
        Violet = '#C678DD',
        Cyan = '#56B6C2'
    }
    for name, color in pairs(colors) do
        vim.api.nvim_set_hl(0, 'RainbowDelimiter' .. name, { fg = color, default = true })
    end
end

set_rainbow_colors()
