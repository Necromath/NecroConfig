require('hop').setup()
vim.api.nvim_set_keymap('v', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = true })<cr>",  {})
vim.api.nvim_set_keymap('v', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",  {})
vim.api.nvim_set_keymap('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = true })<cr>",  {})
vim.api.nvim_set_keymap('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",  {})
vim.api.nvim_set_keymap('o', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true, inclusive_jump = true })<cr>",  {})
vim.api.nvim_set_keymap('o', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",  {})
--
vim.api.nvim_set_keymap('v', '\'\'', "<cmd>lua require'hop'.hint_patterns({  inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', '\'\'', "<cmd>lua require'hop'.hint_patterns({  inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', '\'\'', "<cmd>lua require'hop'.hint_patterns({  inclusive_jump = true })<cr>", {})
