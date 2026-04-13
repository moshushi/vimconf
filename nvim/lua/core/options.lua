-- Установка лидер-клавиш
vim.g.mapleader = ","
-- vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus" -- Синхронизация буфера обмена Neovim с системным буфером обмена

-- Поведение TAB в начале строки
vim.opt.expandtab = true  -- Преобразовывать табы в пробелы
vim.opt.shiftwidth = 2    -- Размер отступа (для команд >> и <<)
vim.opt.tabstop = 2       -- Ширина символа табуляции

-- Переключение раскладки внутри neovim
vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0 -- Начинать в английской раскладке
vim.opt.imsearch = 0 -- Поиск тоже начинать в английской

-- Общие настройки оформления (вне условия Neovide)
vim.opt.termguicolors = true  -- Включение 24-битного цвета
vim.opt.cmdheight = 2         -- Высота командной строки
vim.opt.cursorline = true     -- Показывать линию курсора
vim.opt.background = "dark"   -- Сообщение о тёмном фоне
vim.cmd('colorscheme desert') -- Загрузка темы

-- Показываем невидимые символы
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',       -- Символ для табуляции
  trail = '·',      -- Пробелы в конце строки
  nbsp = '␣',       -- Неразрывные пробелы
  extends = '→',    -- Если строка уходит за край экрана
  precedes = '←',
}

-- Установка комбинированного режима отображения строк
vim.opt.number = true          -- Текущая строка показывает реальный номер
-- vim.opt.relativenumber = true  -- Остальные строки показывают относительный номер

