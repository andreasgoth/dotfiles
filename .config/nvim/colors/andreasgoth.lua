--
-- andreasgoth colorscheme
--

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "andreasgoth"

vim.cmd.syntax([[keyword jsCommentTodo contained TODO FIXME XXX TBD INCOMPLETE DEBUG BUG NOTE REVIEW REFACTOR REMOVE HACK @todo]])

-- General colors @todo TODO: asdf

vim.api.nvim_set_hl(0, "Todo", { fg = "#ff0000", bg = "#00FF00" })

vim.api.nvim_set_hl(0, "Normal", { fg = "#f6f3e8" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#070707" })

vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1d1d1d" })
vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "#9e9e9e", bg = "#090909", bold = true })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#121212" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1d1d1d" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
vim.api.nvim_set_hl(0, "SignColumn", {  })

vim.api.nvim_set_hl(0, "VertSplit", { fg = "#202020", bg = "#202020" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#000000", italic = true })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#000000", bg = "#333333" })

vim.api.nvim_set_hl(0, "Folded", { fg = "#a0a8b0", bg = "#384048" })
vim.api.nvim_set_hl(0, "Title", { fg = "#f6f3e8" })
vim.api.nvim_set_hl(0, "Visual", { fg = "#000000", bg = "#FFEB87" })

vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#808080", bg = "#343434" })

vim.api.nvim_set_hl(0, "Ignore", { fg = "grey", bg = "black" })
vim.api.nvim_set_hl(0, "WildMenu", { fg = "green", bg = "yellow" })
vim.api.nvim_set_hl(0, "PmenuSbar", { fg = "black", bg = "white" })

vim.api.nvim_set_hl(0, "Error", { undercurl = true, sp = "#FF6C60" })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#FF6C60", bg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = "white", bg = "#FF6C60", bold = true })
vim.api.nvim_set_hl(0, "SpellBad", { fg = "white", bg = "#FF6C60", bold = true })

-- Message displayed in lower left, such as --INSERT--
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#000000", bg = "#ffffff", bold = true })

vim.api.nvim_set_hl(0, "MatchParen", { fg = "#f6f3e8", bg = "#857b6f", bold = true })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#f6f3e8", bg = "#444444" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#000000", bg = "#cae682" })
vim.api.nvim_set_hl(0, "Search", { fg = "#FFEB87", bg = "#444444", underline = true })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = "#83c196", bold = true })
vim.api.nvim_set_hl(0, "String", { fg = "#BBC8C4" })
vim.api.nvim_set_hl(0, "Number", { fg = "#aaa1ca" })

vim.api.nvim_set_hl(0, "Keyword", { fg = "#AABDCA" })
vim.api.nvim_set_hl(0, "PreProc", { fg = "#9e9e9e" })
vim.api.nvim_set_hl(0, "Conditional", { fg = "#B0B0B0" })

vim.api.nvim_set_hl(0, "Todo", { fg = "#FFE266", bg = "#322900", bold = true })

vim.api.nvim_set_hl(0, "Constant", { fg = "#8787D7" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "Type", { fg = "#AABDCA" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#AABDCA" })

vim.api.nvim_set_hl(0, "Special", { fg = "#E18964" })
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#00A0A0" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#B0B0B0" })

vim.api.nvim_set_hl(0, "Character", { link = "Constant" })
vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })
vim.api.nvim_set_hl(0, "Float", { link = "Number" })
vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
vim.api.nvim_set_hl(0, "Label", { link = "Statement" })
vim.api.nvim_set_hl(0, "Exception", { link = "Statement" })
vim.api.nvim_set_hl(0, "Include", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Define", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Macro", { link = "PreProc" })
vim.api.nvim_set_hl(0, "PreCondit", { link = "PreProc" })
vim.api.nvim_set_hl(0, "StorageClass", { link = "Type" })
vim.api.nvim_set_hl(0, "Structure", { link = "Type" })
vim.api.nvim_set_hl(0, "Typedef", { link = "Type" })
vim.api.nvim_set_hl(0, "Tag", { link = "Special" })
vim.api.nvim_set_hl(0, "SpecialChar", { link = "Special" })
vim.api.nvim_set_hl(0, "SpecialComment", { link = "Special" })
vim.api.nvim_set_hl(0, "Debug", { link = "Special" })

-- XML
vim.api.nvim_set_hl(0, "xmlTag", { link = "Keyword" })
vim.api.nvim_set_hl(0, "xmlTagName", { link = "Conditional" })
vim.api.nvim_set_hl(0, "xmlEndTag", { link = "Identifier" })

-- HTML
vim.api.nvim_set_hl(0, "htmlTag", { link = "Keyword" })
vim.api.nvim_set_hl(0, "htmlTagName", { link = "Conditional" })
vim.api.nvim_set_hl(0, "htmlEndTag", { link = "Identifier" })

-- JavaScript
vim.api.nvim_set_hl(0, "javaScriptNumber", { link = "Number" })

-- Python
vim.api.nvim_set_hl(0, "pythonEscape", { link = "Keyword" })
vim.api.nvim_set_hl(0, "pythonSpaceError", { bg = "red" })

-- CSharp
vim.api.nvim_set_hl(0, "csXmlTag", { link = "Keyword" })

-- Diff
vim.api.nvim_set_hl(0, "DiffAdd", { reverse = true, bold = true, bg = "lightgreen", fg = "#333333" })
vim.api.nvim_set_hl(0, "DiffChange", { reverse = true, bold = true, bg = "lightblue", fg = "#333333" })
vim.api.nvim_set_hl(0, "DiffText", { reverse = true, bold = true, bg = "lightgray", fg = "#333333" })
vim.api.nvim_set_hl(0, "DiffDelete", { reverse = true, bold = true, bg = "lightred", fg = "#333333" })

-- Status line
vim.api.nvim_set_hl(0, "User1", { fg = "#808080", bg = "#000000" }) -- Path
vim.api.nvim_set_hl(0, "User2", { fg = "#ffffff", bg = "#000000", bold = true }) -- Filename
vim.api.nvim_set_hl(0, "User3", { fg = "#666666", bg = "#000000" }) -- File type
vim.api.nvim_set_hl(0, "User4", { fg = "#6ca84e", bg = "#000000", bold = true }) -- ale ok
vim.api.nvim_set_hl(0, "User5", { fg = "#fc7a29", bg = "#000000", bold = true }) -- ale warn
vim.api.nvim_set_hl(0, "User6", { fg = "#fc1928", bg = "#000000", bold = true }) -- ale error

-- ALE linter
vim.api.nvim_set_hl(0, "ALEErrorSign", { fg = "#fc1928" })
vim.api.nvim_set_hl(0, "ALEWarningSign", { fg = "#fc7a29" })
vim.api.nvim_set_hl(0, "ALEError", { fg = "#fc1928", bold = true, undercurl = true, sp = "#fb0015" })
vim.api.nvim_set_hl(0, "ALEWarning", { fg = "#fc1928", bold = true, undercurl = true, sp = "#fd9216" })

-- Fidget (nvim-lsp progress indicator)
vim.api.nvim_set_hl(0, "FidgetTitle", { fg = "#f0f0f0" })
vim.api.nvim_set_hl(0, "FidgetTask", { fg = "#888888" })

-- Gitsigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#60bf66" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffd440" })
vim.api.nvim_set_hl(0, "Delete", { fg = "#bf6060" })
