vim.api.nvim_create_user_command(
  'LcdToCurrentFile',
  function()
    vim.cmd('lcd %:p:h')
  end,
  {}
)
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- vim.api.nvim_set_option("clipboard","unnamed")
-- vim.g.clipboard = {
--     name = 'myClipboard',
--     copy = {
--         ['+'] = 'tmux load-buffer -',
--         ['*'] = 'tmux load-buffer -',
--     },
--     paste = {
--         ['+'] = 'tmux save-buffer -',
--         ['*'] = 'tmux save-buffer -',
--     },
--     cache_enabled = 1,
-- }

-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

-- Clipboard yank function
-- Define the clipboard yank function in the global scope
-- _G.clipboard_yank = function()
--   print('hello world')
--   vim.fn.system('xclip -i -selection clipboard', vim.fn.getreg('"'))
-- end
--
-- -- Define the clipboard paste function in the global scope
-- _G.clipboard_paste = function()
--   vim.fn.setreg('"', vim.fn.system('xclip -o -selection clipboard'))
-- end
--
-- -- Mapping the yank operation for visual and normal mode using global functions
-- vim.api.nvim_set_keymap('v', 'y', 'y<cmd>lua clipboard_yank()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'd', 'd<cmd>lua clipboard_yank()<CR>', { noremap = true, silent = true })
--
-- -- Mapping the paste operation for normal mode using global functions
-- vim.api.nvim_set_keymap('n', 'p', '<cmd>lua clipboard_paste()<CR>p', { noremap = true, silent = true })
--
