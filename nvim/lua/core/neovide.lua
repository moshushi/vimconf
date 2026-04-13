-- Проверка, запущен ли Neovide
if vim.g.neovide then
    -- 1. Шрифт (убедитесь, что он установлен в Windows)
    -- Рекомендую JetBrainsMono Nerd Font или FiraCode Nerd Font
    vim.o.guifont = "JetBrains Mono,Monospace:h12"

    -- 2. Прозрачность и размытие (Blur)
    -- Значение от 0.0 до 1.0
    vim.g.neovide_opacity = 0.9
    -- Работает только в Windows 10/11
    vim.g.neovide_window_blurred = true

    -- 3. Настройка анимации курсора ("желейный" эффект)
    -- vfx_mode: "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_animation_length = 0.13
    vim.g.neovide_cursor_trail_size = 0.5

    -- 4. Плавность скроллинга
    vim.g.neovide_scroll_animation_length = 0.3

    -- 5. Полноэкранный режим (F11)
    vim.keymap.set('n', '<F11>', function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end)
end

