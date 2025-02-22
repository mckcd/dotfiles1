-- Highlight when yanking (copying) text Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

-- 	group = vim.api.nvim_create_augroup("mn-higlight-yank", { clear = true }),
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- })
--
-- local function recording_status()
-- 	local rec_reg = vim.fn.reg_recording()
-- 	if rec_reg == "" then
-- 		return ""
-- 	else
-- 		return "Recording @" .. rec_reg
-- 	end
-- end

-- termian window
-- return {
--     local function OpenFloatingTerminal()
--         local width = math.floor(vim.o.columns * 0.8)
-- local height = math.floor(vim.o.lines * 0.4)
-- local opts = {
--     relative = "editor",
--     width = width,
--     height = height,
--     col = math.floor((vim.o.columns - width) / 2),
--     row = math.floor((vim.o.lines - height) / 2),
--     style = "minimal",
-- }
-- local buf = vim.api.nvim_create_buf(false, true)
-- local win = vim.api.nvim_open_win(buf, true, opts)
-- vim.api.nvim_set_current_win(win)
-- vim.cmd("term")
-- end
-- }
--
-- -- termian window
-- vim.keymap.set(
--     "n",
--     "<leader>tm",
--     ":call OpenFloatingTerminal()<CR>",
--     { noremap = true, silent = true, desc = "Open Floating Terminal" }
-- )
-- vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

local M = {}

-- Function to check if a macro is being recorded
function M.recording_status()
    local rec_reg = vim.fn.reg_recording()
    return rec_reg ~= "" and "Recording @" .. rec_reg or ""
end

-- Function to highlight when text is yanked
function M.highlight_on_yank()
    vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = vim.api.nvim_create_augroup("mn-highlight-yank", { clear = true }),
        callback = function()
            vim.highlight.on_yank()
        end,
    })
end

-- Function to auto-update statusline when recording macros
function M.setup_recording_autocmd()
    vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
        callback = function()
            vim.cmd("redrawstatus")
        end,
    })
end

-- Automatically run necessary setup functions when this file is required
M.highlight_on_yank()
M.setup_recording_autocmd()

return M
