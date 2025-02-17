require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

function _G.__toggle_contextual(vmode)
    local cfg = require('Comment.config'):get()
    local U = require('Comment.utils')
    local Op = require('Comment.opfunc')
    local range = U.get_region(vmode)
    local same_line = range.srow == range.erow

    local ctx = {
        cmode = U.cmode.toggle,
        range = range,
        cmotion = U.cmotion[vmode] or U.cmotion.line,
        ctype = same_line and U.ctype.linewise or U.ctype.blockwise,
    }

    local lcs, rcs = U.parse_cstr(cfg, ctx)
    local lines = U.get_lines(range)

    local params = {
        range = range,
        lines = lines,
        cfg = cfg,
        cmode = ctx.cmode,
        lcs = lcs,
        rcs = rcs,
    }

    if same_line then
        Op.linewise(params)
    else
        Op.blockwise(params)
    end
end

map('n', '<D-/>', '<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@')
map('x', '<D-/>', '<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@')
map('i', '<D-/>', '<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@')

map("n", "<D-a>", "ggVG")
map("n", "<D-s>", "<cmd>w<CR>")
map("n", "<D-z>", "<cmd>u<CR>")
map("n", "<D-Z>", "<cmd>r<CR>")
map("n", "<D-c>", "<cmd>y<CR>")

map("i", "<D-a>", "<ESC>ggVGi")
map("i", "<D-s>", "<cmd>w<CR>")
map("i", "<D-z>", "<cmd>u<CR>")
map("i", "<D-Z>", "<cmd>r<CR>")

map("v", "<BS>", ":d<CR>i")
