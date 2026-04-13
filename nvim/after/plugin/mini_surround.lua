local status_ok, mini_surround = pcall(require, "mini.surround")
if not status_ok then
    return
end

mini_surround.setup({
    -- Leave empty for default mappings: 
    -- sa (add), sd (delete), sr (replace), sf (find), sF (find left)
})
