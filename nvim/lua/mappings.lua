require "nvchad.mappings"

-- add yours here

      function Temp()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i","<C-l>",Temp,{replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true , desc = "Copilot Accept"} );

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
