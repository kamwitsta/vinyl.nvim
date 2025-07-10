local M = {}

function M.get_theme(variant)


	local p = require("vinyl.palette").get_palette(variant)

	return {

	-- normal -------------------------------------------------------------------------------- {{{ -

	["Normal"]					= {fg=p.beige100,bg=p.beige0},		-- Normal text.
	["NormalNoBG"]				= {fg=p.beige100},					-- hack to get CursorLine under anything linked to Normal
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- comments ------------------------------------------------------------------------------ {{{ -

	["@comment"]				= {fg=p.beige40},					-- line and block comments
	["Comment"]					= {link="@comment"},				-- any comment
	["Ignore"]					= {link="@comment"},				-- left blank, hidden |hl-Ignore|

	["@comment.error"]			= {fg=p.beige0,bg=p.red},			-- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
	["Error"]					= {link="@comment.error"},			-- left blank, hidden |hl-Ignore|

	["@comment.todo"]			= {fg=p.beige0,bg=p.orange},		-- todo-type comments (e.g. `TODO`, `WIP`)
	["Todo"]					= {link="@comment.todo"},			-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	["@comment.warning"]		= {fg=p.beige0,bg=p.orange},		-- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)

	["@comment.note"]			= {fg=p.beige0,bg=p.yellow},		-- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

	["@comment.documentation"]	= {fg=p.green},						-- comments documenting code
	["@string.documentation"]	= {link="@comment.documentation"},	-- string documenting code (e.g. Python docstrings)

	["SpecialComment"]			= {fg=p.beige60},					-- special things inside a comment
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- constants ----------------------------------------------------------------------------- {{{ -

	["@constant"]				= {fg=p.green},						-- constant identifiers
	["@boolean"]				= {link="@constant"},				-- boolean literals
	["@character"]				= {link="@constant"},				-- character literals
	["@constant.builtin"]		= {link="@constant"},				-- built-in constant values
	["@constant.macro"]			= {link="@constant"},				-- constants defined by the preprocessor
	["@number"]					= {link="@constant"},				-- numeric literals
	["@number.float"]			= {link="@constant"},				-- floating-point number literals
	["@string"]					= {link="@constant"},				-- string literals
	["Boolean"]					= {link="@constant"},				-- a boolean constant: TRUE, false
	["Character"]				= {link="@constant"},				-- a character constant: 'c', '\n'
	["Constant"]				= {link="@constant"},				-- any constant
	["Float"]					= {link="@constant"},				-- a floating point constant: 2.3e10
	["Number"]					= {link="@constant"},				-- a number constant: 234, 0xff
	["String"]					= {link="@constant"},				-- a string constant: "this is a string"
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- specials ------------------------------------------------------------------------------ {{{ -

	["@character.special"]		= {fg=p.purple},					-- special characters (e.g. wildcards)
	["@attribute"]				= {link="@character.special"},		-- attribute annotations (e.g. Python decorators, Rust lifetimes)
	["@attribute.builtin"]		= {link="@character.special"},		-- builtin annotations (e.g. `@property` in Python)
	["@property"]				= {link="@character.special"},		-- the key in key/value pairs
	["@string.escape"]			= {link="@character.special"},		-- escape sequences
	["@string.regexp"]			= {link="@character.special"},		-- regular expressions
	["@string.special"]			= {link="@character.special"},		-- other special strings (e.g. dates)
	["@string.special.path"]	= {link="@character.special"},		-- filenames
	["@string.special.symbol"]	= {link="@character.special"},		-- symbols or atoms
	["@string.special.url"]		= {link="@character.special"},		-- URIs (e.g. hyperlinks)
	["@punctuation.special"]	= {link="@character.special"},		-- special symbols (e.g. `{}` in string interpolation)
	["Conceal"]					= {link="@character.special"},		-- Placeholder characters substituted for concealed text (see 'conceallevel').
	["Special"]					= {link="@character.special"},		-- any special symbol
	["SpecialChar"]				= {link="@character.special"},		-- special character in a constant
	["SpecialKey"]				= {link="@character.special"},		-- Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- variables ----------------------------------------------------------------------------- {{{ -

	["@variable"]				= {link="NormalNoBG"},				-- various variable names
	["@variable.parameter"]		= {link="NormalNoBG"},				-- parameters of a function
	["@variable.member"]		= {link="NormalNoBG"},				-- object and struct fields
	["Identifier"]				= {link="NormalNoBG"},				-- any variable name

	-- --------------------------------------------------------------------------------------- }}} -
	-- functions ----------------------------------------------------------------------------- {{{ -

	["@function"]				= {fg=p.yellow},					-- function definitions
	["Function"]				= {link="@function"},				-- function name (also: methods for classes)

	["@function.builtin"]		= {link="NormalNoBG"},				-- built-in functions
	["@function.call"]			= {link="NormalNoBG"},				-- function calls
	["@function.macro"]			= {link="NormalNoBG"},				-- preprocessor macros
	["@function.method"]		= {link="NormalNoBG"},				-- method definitions
	["@function.method.call"]	= {link="NormalNoBG"},				-- method calls

	-- --------------------------------------------------------------------------------------- }}} -
	-- types --------------------------------------------------------------------------------- {{{ -

	["@type"]					= {fg=p.red},						-- type or class definitions and annotations
	["@type.builtin"]			= {link="@type"},					-- built-in types
	["@type.definition"]		= {link="@type"},					-- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
	["Type"]					= {link="@type"},					-- int, long, char, etc.
	["StorageClass"]			= {link="@type"},					-- static, register, volatile, etc.
	["Structure"]				= {link="@type"},					-- struct, union, enum, etc.
	["Typedef"]					= {link="@type"},					-- a typedef

	["@constructor"]			= {link="@type"},					-- constructor calls and definitions

	["Define"]					= {link="@type"},					-- preprocessor #define
	["Macro"]					= {link="@type"},					-- same as Define
	
	["@keyword"]				= {link="@type"},					-- keywords not fitting into specific categories
	["@keyword.function"]		= {link="@type"},					-- keywords that define a function (e.g. `func` in Go, `def` in Python)
	["@keyword.modifier"]		= {link="@type"},					-- keywords modifying other constructs (e.g. `const`, `static`, `public`)
	["@keyword.type"]			= {link="@type"},					-- keywords describing namespaces and composite types (e.g. `struct`, `enum`)

	-- --------------------------------------------------------------------------------------- }}} -
	-- delimiters ---------------------------------------------------------------------------- {{{ -

	["@punctuation.bracket"]	= {fg=p.orange},					-- brackets (e.g. `()`, `{}`, `[]`)
	["@punctuation.delimiter"]	= {link="@punctuation.bracket"},	-- delimiters (e.g. `;`, `.`, `,`)
	["@tag.delimiter"]			= {link="@punctuation.bracket"},	-- XML-style tag delimiters
	["Delimiter"]				= {link="@punctuation.bracket"},	-- character that needs attention
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- operators ----------------------------------------------------------------------------- {{{ -

	["@operator"]				= {fg=p.blue},						-- symbolic operators (e.g. `+`, `*`)
	["@keyword.operator"]		= {link="@operator"},				-- operators that are English words (e.g. `and`, `or`)
	["@variable.builtin"]		= {link="@operator"},				-- built-in variable names (e.g. `this`, `self`)
	["@variable.parameter.builtin"] = {link="@operator"},			-- special parameters (e.g. `_`, `it`)
	["Operator"]				= {link="@operator"},				-- "sizeof", "+", "*", etc.
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- flow control -------------------------------------------------------------------------- {{{ -

	["@keyword.conditional"]	= {fg=p.red},						-- keywords related to conditionals (e.g. `if`, `else`)
	["@keyword.conditional.ternary"] = {link="@keyword.conditional"},-- ternary operator (e.g. `?`, `:`)
	["@keyword.exception"]		= {link="@keyword.conditional"},	-- keywords related to exceptions (e.g. `throw`, `catch`)
	["@keyword.return"]			= {link="@keyword.conditional"},	-- keywords like `return` and `yield`
	["@label"]					= {link="@keyword.conditional"},	-- `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
	["Conditional"]				= {link="@keyword.conditional"},	-- if, then, else, endif, switch, etc.
	["Exception"]				= {link="@keyword.conditional"},	-- try, catch, throw
	["Keyword"]					= {link="@keyword.conditional"},	-- any other keyword
	["Label"]					= {link="@keyword.conditional"},	-- case, default, etc.
	["Statement"]				= {link="@keyword.conditional"},	-- any statement

	["@keyword.repeat"]			= {link="NormalNoBG"},				-- keywords related to loops (e.g. `for`, `while`)
	["@keyword.coroutine"]		= {link="NormalNoBG"},				-- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
	["Repeat"]					= {link="NormalNoBG"},				-- for, do, while, etc.
	
	-- --------------------------------------------------------------------------------------- }}} -
	-- preproc ------------------------------------------------------------------------------- {{{ -

	["@module"]					= {fg=p.blue},						-- modules or namespaces
	["@module.builtin"]			= {link="@module"},					-- built-in modules or namespaces

	["@keyword.import"]			= {link="@module"},					-- keywords for including or exporting modules (e.g. `import`, `from` in Python)
	["@keyword.directive"]		= {link="@module"},					-- various preprocessor directives and shebangs
	["@keyword.directive.define"] = {link="@module"},				-- preprocessor definition directives
	["Include"]					= {link="@module"},					-- preprocessor #include
	["PreCondit"]				= {link="@module"},					-- preprocessor #if, #else, #endif, etc.
	["PreProc"]					= {link="@module"},					-- generic Preprocessor

	-- --------------------------------------------------------------------------------------- }}} -
	-- debugging ----------------------------------------------------------------------------- {{{ -
	
	["@keyword.debug"]			= {fg=p.teal},						-- keywords related to debugging
	["Debug"]					= {link="@keyword.debug"},			-- debugging statements

	-- --------------------------------------------------------------------------------------- }}} -

	-- markup -------------------------------------------------------------------------------- {{{ -
	
	["@markup.heading"]			= {bold=true},						-- headings, titles (including markers)
	["@markup.heading.1"]		= {fg=p.red,bold=true},				-- top-level heading
	["@markup.heading.2"]		= {fg=p.orange,bold=true},			-- section heading
	["@markup.heading.3"]		= {fg=p.yellow,bold=true},			-- subsection heading
	["@markup.heading.4"]		= {fg=p.green,bold=true},			-- and so on
	["@markup.heading.5"]		= {fg=p.teal,bold=true},			-- and so forth
	["@markup.heading.6"]		= {fg=p.blue,bold=true},			-- six levels ought to be enough for anybody

	["@markup.link"]			= {link="NormalNoBG"},				-- text references, footnotes, citations, etc.

	["@markup.link.label"]		= {link="@character.special"},		-- link, reference descriptions
	["Tag"]						= {link="@character.special"},		-- you can use CTRL-] on this
	["Underlined"]				= {link="@character.special"},		-- text that stands out, HTML links

	["@markup.link.url"]		= {link="@comment"},				-- URL-style links

	["@markup.list"]			= {link="@operator"},				-- list markers
	["@markup.list.checked"]	= {link="@operator"},				-- checked todo-style list markers
	["@markup.list.unchecked"]	= {link="@operator"},				-- unchecked todo-style list markers

	["@markup.quote"]			= {fg=p.blue},						-- block quotes
	["@markup.math"]			= {link="@markup.quote"},			-- math environments (e.g. `$ ... $` in LaTeX)
	["@markup.raw"]				= {link="@markup.quote"},			-- literal or verbatim text (e.g. inline code)
	["@markup.raw.block"]		= {link="@markup.quote"},			-- literal or verbatim text as a stand-alone block

	["@markup.strong"]			= {bold=true},						-- bold text

	["@markup.italic"]			= {italic=true},					-- italic text

	["@markup.strikethrough"]	= {link="@comment"},				-- struck-through text

	["@markup.underline"]		= {underline=true},					-- underlined text (only for literal underline markup!)

	-- --------------------------------------------------------------------------------------- }}} -
	-- tags ---------------------------------------------------------------------------------- {{{ -
	
	["@tag"]					= {link="NormalNoBG"},				-- XML-style tag names (e.g. in XML, HTML, etc.)
	["@tag.attribute"]			= {link="NormalNoBG"},				-- XML-style tag attributes
	["@tag.builtin"]			= {link="NormalNoBG"},				-- builtin tag names (e.g. HTML5 tags)
	
	-- --------------------------------------------------------------------------------------- }}} -

	-- ui ------------------------------------------------------------------------------------ {{{ -

	["Cursor"]					= {fg=p.beige0,bg=p.beige100},		-- Character under the cursor.
	["CursorIM"]				= {link="Cursor"},					-- Like Cursor, but used when in IME mode. *CursorIM*
	["lCursor"]					= {link="Cursor"},					-- Character under the cursor when |language-mapping| is used (see 'guicursor').
	["TermCursor"]				= {link="Cursor"},					-- Cursor in a focused terminal.
	
	["CursorColumn"]			= {bg=p.beige10},					-- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
	["CursorLine"]				= {link="CursorColumn"},			-- Screen-column at the cursor, when 'cursorcolumn' is set.
	["CursorLineNr"]			= {link="@punctuation.bracket"},	-- Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
	["ColorColumn"]				= {link="CursorColumn"},			-- Used for the columns set with 'colorcolumn'.

	["Directory"]				= {link="@type"},    				-- Directory names (and other special names in listings).

	["FloatBorder"]				= {link="WinSeparator"},			-- Border of floating windows.
	["FloatTitle"]				= {link="@markup.heading.2"},		-- Title of floating windows.
	["FloatFooter"]				= {link="MoreMsg"},					-- Footer of floating windows.
	["NormalFloat"]				= {link="NormalNoBg"},				-- Normal text in floating windows.

	["Folded"]					= {fg=p.beige40},					-- Line used for closed folds.

	["FoldColumn"]				= {link="NormalNoBG"},				-- 'foldcolumn'
	["SignColumn"]				= {link="NormalNoBG"},				-- Column where |signs| are displayed.
	["CursorLineFold"]			= {link="NormalNoBG"},				-- Like FoldColumn when 'cursorline' is set for the cursor line.
	["CursorLineSign"]			= {link="NormalNoBG"},				-- Like SignColumn when 'cursorline' is set for the cursor line.

	["LineNr"]					= {link="@comment"},				-- 	Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	["LineNrAbove"]				= {link="@comment"},				-- Line number for when the 'relativenumber' option is set, above the cursor line.
	["LineNrBelow"]				= {link="@comment"},				-- Line number for when the 'relativenumber' option is set, below the cursor line.

	["MatchParen"]				= {fg=p.orange,bg=p.beige40,bold=true},-- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

	["MsgArea"]					= {link="Normal"},					-- Area for messages and command-line, see also 'cmdheight'.
	["ErrorMsg"]				= {link="@comment.error"},			-- Error messages on the command line.
	["ModeMsg"]					= {fg=p.beige100,bold=true},		-- 'showmode' message (e.g., "-- INSERT --").
	["MsgSeparator"]			= {fg=p.beige0,bg=p.beige20},		-- Separator for scrolled messages |msgsep|.
	["MoreMsg"]					= {fg=p.beige0,bg=p.purple},		-- |more-prompt|
	["Title"]					= {link="MoreMsg"},					-- Titles for output from ":set all", ":autocmd" etc.
	["Question"]				= {link="MoreMsg"},					-- |hit-enter| prompt and yes/no questions.
	["WarningMsg"]				= {link="@comment.warning"},		-- Warning messages.

	["NonText"]					= {fg=p.beige10},					-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	["EndOfBuffer"]				= {link="NonText"},      			-- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
	["Whitespace"]				= {link="NonText"},					-- "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.

	["NormalNC"]				= {link="Normal"},					-- Normal text in non-current windows.

	["Pmenu"]					= {fg=p.beige100,bg=p.beige20},		-- Popup menu: Normal item.
	["PmenuSel"]				= {fg=p.beige0,bg=p.blue},			-- Popup menu: Selected item. Combined with |hl-Pmenu|.
	["PmenuKind"]				= {fg=p.teal,bg=p.beige20},		-- Popup menu: Normal item "kind".
	["PmenuKindSel"]			= {fg=p.beige0,bg=p.teal},			-- Popup menu: Selected item "kind".
	["PmenuExtra"]				= {fg=p.purple,bg=p.beige20},		-- Popup menu: Normal item "extra text".
	["PmenuExtraSel"]			= {fg=p.beige0,bg=p.purple},		-- Popup menu: Selected item "extra text".
	["PmenuSbar"]				= {fg=p.beige100,bg=p.beige40},		-- Popup menu: Scrollbar.
	["PmenuThumb"]				= {link="PmenuSbar"},				-- Popup menu: Thumb of the scrollbar.
	["PmenuMatch"]				= {link="Pmenu"},					-- Popup menu: Matched text in normal item. Combined with |hl-Pmenu|.
	["PmenuMatchSel"]			= {link="Pmenu"},					-- Popup menu: Matched text in selected item. Combined with |hl-PmenuMatch| and |hl-PmenuSel|.
	["ComplMatchIns"]			= {link="NormalNoBG"},				-- Matched text of the currently inserted completion.
	["Menu"]					= {link="Pmenu"},					-- Current font, background and foreground colors of the menus. Also used for the toolbar. Applicable highlight arguments: font, guibg, guifg.
	["Tooltip"]					= {link="Pmenu"},					-- Current font, background and foreground of the tooltips. Applicable highlight arguments: font, guibg, guifg.
	["WildMenu"]				= {link="PmenuSel"},				-- Current match in 'wildmenu' completion.

	["QuickFixLine"]			= {fg=p.blue},						-- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

	["Scrollbar"]				= {link="PmenuSbar"},				-- Current background and foreground of the main window's scrollbars. Applicable highlight arguments: guibg, guifg.

	["Search"]					= {fg=p.beige100,bg=p.beige40},		-- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
	["CurSearch"]				= {fg=p.beige100,bg=p.blue,bold=true},-- Current match for the last search pattern (see 'hlsearch'). Note: This is correct after a search, but may get outdated if changes are made or the screen is redrawn.
	["IncSearch"]				= {link="CurSearch"},				-- 'incsearch' highlighting; also used for the text replaced with ":s///c".

	["SnippetTabstop"]			= {link="NormalNoBG"},				-- Tabstops in snippets. |vim.snippet|

	["SpellBad"]				= {underline=true},					-- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	["SpellCap"]				= {underline=true},					-- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	["SpellLocal"]				= {underline=true},					-- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	["SpellRare"]				= {underline=true},					-- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

	["StatusLine"]				= {fg=p.beige20,bg=p.beige60,bold=true},-- Status line of current window.
	["StatusLineTerm"]			= {link="StatusLine"},				-- Status line of |terminal| window.
	["TabLineSel"]				= {link="StatusLine"},				-- Tab pages line, active tab page label.
	["WinBar"]					= {link="StatusLine"},				-- Window bar of current window.
	["StatusLineNC"]			= {fg=p.beige80,bg=p.beige20},		-- Status lines of not-current windows.
	["StatusLineTermNC"]		= {link="StatusLineNC"},			-- Status line of non-current |terminal| windows.
	["TabLine"]					= {link="StatusLineNC"},			-- Tab pages line, not active tab page label.
	["TabLineFill"]				= {link="StatusLineNC"},			-- Tab pages line, where there are no labels.
	["WinBarNC"]				= {link="StatusLineNC"},			-- Window bar of not-current windows.

	["Substitute"]				= {link="Search"},					-- |:substitute| replacement text highlighting.

	["Visual"]					= {fg=p.beige0,bg=p.beige80},		-- Visual mode selection.
	["VisualNOS"]				= {fg=p.beige0,bg=p.beige80},		-- Visual mode selection when vim is "Not Owning the Selection".

	["WinSeparator"]			= {fg=p.beige80},					-- Separators between window splits.

	-- --------------------------------------------------------------------------------------- }}} -
	-- diff ---------------------------------------------------------------------------------- {{{ -

	["@diff.delta"]				= {fg=p.beige0,bg=p.blue},			-- changed text (for diff files)
	["Changed"]					= {link="@diff.delta"},				-- changed line in a diff
	["DiffChange"]				= {link="@diff.delta"},				-- Diff mode: Changed line. |diff.txt|
	
	["@diff.plus"]				= {fg=p.beige0,bg=p.green},			-- added text (for diff files)
	["Added"]					= {link="@diff.plus"},				-- added line in a diff
	["DiffAdd"]					= {link="@diff.plus"},				-- Diff mode: Added line. |diff.txt|

	["@diff.minus"]				= {fg=p.beige0,bg=p.orange},		-- deleted text (for diff files)
	["DiffDelete"]				= {link="@diff.minus"},				-- Diff mode: Deleted line. |diff.txt|
	["Removed"]					= {link="@diff.minus"},				-- removed line in a diff

	["DiffText"]				= {link="NormalNoBG"},				-- Diff mode: Changed text within a changed line. |diff.txt|

	-- --------------------------------------------------------------------------------------- }}} -

	-- indegrations -------------------------------------------------------------------------- {{{ -
	
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	["IblIndent"]				= {fg=p.beige20},					-- The default highlight group for indentation characters.
	["IblWhitespace"]			= {link="NormalNoBG"},				-- The default highlight group for whitespace characters.
	["IblScope"]				= {fg=p.blue},						-- The default highlight group for |ibl.config.scope| characters.

	-- --------------------------------------------------------------------------------------- }}} -

	-- lsp diagnostics ----------------------------------------------------------------------- {{{ -

	["DiagnosticError"]				= {fg=p.red,bg=p.beige10},		--Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	["DiagnosticWarn"]				= {fg=p.yellow,bg=p.beige10},	--Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	["DiagnosticInfo"]				= {fg=p.blue,bg=p.beige10},		--Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	["DiagnosticHint"]				= {fg=p.teal,bg=p.beige10},		--Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	["DiagnosticOk"]				= {fg=p.green,bg=p.beige10},	--Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	["DiagnosticVirtualTextError"]	= {link="DiagnosticError"},		--Used for "Error" diagnostic virtual text.
	["DiagnosticVirtualTextWarn"]	= {link="DiagnosticWarn"},		--Used for "Warn" diagnostic virtual text.
	["DiagnosticVirtualTextInfo"]	= {link="DiagnosticInfo"},		--Used for "Info" diagnostic virtual text.
	["DiagnosticVirtualTextHint"]	= {link="DiagnosticHint"},		--Used for "Hint" diagnostic virtual text.
	["DiagnosticVirtualTextOk"]		= {link="DiagnosticOk"},		--Used for "Ok" diagnostic virtual text.
	["DiagnosticUnderlineError"]	= {fg=p.red,underline=true},	--Used to underline "Error" diagnostics.
	["DiagnosticUnderlineWarn"]		= {fg=p.yellow,underline=true},	--Used to underline "Warn" diagnostics.
	["DiagnosticUnderlineInfo"]		= {fg=p.blue,underline=true},	--Used to underline "Info" diagnostics.
	["DiagnosticUnderlineHint"]		= {fg=p.teal,underline=true},	--Used to underline "Hint" diagnostics.
	["DiagnosticUnderlineOk"]		= {fg=p.green,underline=true},	--Used to underline "Ok" diagnostics.
	["DiagnosticFloatingError"]		= {link="DiagnosticError"},		--Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
	["DiagnosticFloatingWarn"]		= {link="DiagnosticWarn"},		--Used to color "Warn" diagnostic messages in diagnostics float.
	["DiagnosticFloatingInfo"]		= {link="DiagnosticInfo"},		--Used to color "Info" diagnostic messages in diagnostics float.
	["DiagnosticFloatingHint"]		= {link="DiagnosticHint"},		--Used to color "Hint" diagnostic messages in diagnostics float.
	["DiagnosticFloatingOk"]		= {link="DiagnosticOk"},		--Used to color "Ok" diagnostic messages in diagnostics float.
	["DiagnosticSignError"]			= {fg=p.red},					--Used for "Error" signs in sign column.
	["DiagnosticSignWarn"]			= {fg=p.yellow},				--Used for "Warn" signs in sign column.
	["DiagnosticSignInfo"]			= {fg=p.blue},					--Used for "Info" signs in sign column.
	["DiagnosticSignHint"]			= {fg=p.teal},					--Used for "Hint" signs in sign column.
	["DiagnosticSignOk"]			= {fg=p.green},					--Used for "Ok" signs in sign column.
	["DiagnosticDeprecated"]		= {fg=p.purple,bg=p.beige10},	--Used for deprecated or obsolete code.
	["DiagnosticUnnecessary"]		= {fg=p.teal,bg=p.beige10},		--Used for unnecessary or unused code.

	-- --------------------------------------------------------------------------------------- }}} -

	-- lsp (disabled) ------------------------------------------------------------------------ {{{ -

	-- ["@lsp.mod.abstract"]			= {link="NormalNoBG"},				-- Types and member functions that are abstract
	-- ["@lsp.mod.async"]				= {link="NormalNoBG"},				-- Functions that are marked async
	-- ["@lsp.mod.declaration"]		= {link="NormalNoBG"},				-- Declarations of symbols
	-- ["@lsp.mod.defaultLibrary"]		= {link="NormalNoBG"},				-- Symbols that are part of the standard library
	-- ["@lsp.mod.definition"]			= {link="NormalNoBG"},				-- Definitions of symbols, for example, in header files
	-- ["@lsp.mod.deprecated"]			= {link="NormalNoBG"},				-- Symbols that should no longer be used
	-- ["@lsp.mod.documentation"]		= {link="NormalNoBG"},				-- Occurrences of symbols in documentation
	-- ["@lsp.mod.modification"]		= {link="NormalNoBG"},				-- Variable references where the variable is assigned to
	-- ["@lsp.mod.readonly"]			= {link="NormalNoBG"},				-- Readonly variables and member fields (constants)
	-- ["@lsp.mod.static"]				= {link="NormalNoBG"},				-- Class members (static members)
	-- ["@lsp.type.class"]				= {link="NormalNoBG"},				-- Identifiers that declare or reference a class type
	-- ["@lsp.type.decorator"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference decorators and annotations
	-- ["@lsp.type.enum"]				= {link="NormalNoBG"},				-- Identifiers that declare or reference an enumeration type
	-- ["@lsp.type.enumMember"]		= {link="NormalNoBG"},				-- Identifiers that declare or reference an enumeration property, constant, or member
	-- ["@lsp.type.event"]				= {link="NormalNoBG"},				-- Identifiers that declare an event property
	-- ["@lsp.type.function"]			= {link="NormalNoBG"},				-- Identifiers that declare a function
	-- ["@lsp.type.interface"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference an interface type
	-- ["@lsp.type.keyword"]			= {link="NormalNoBG"},				-- Tokens that represent a language keyword
	-- ["@lsp.type.method"]			= {link="NormalNoBG"},				-- Identifiers that declare a member function or method
	-- ["@lsp.type.modifier"]			= {link="NormalNoBG"},				-- Tokens that represent a modifier
	-- ["@lsp.type.namespace"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference a namespace, module, or package
	-- ["@lsp.type.number"]			= {link="NormalNoBG"},				-- Tokens that represent a number literal
	-- ["@lsp.type.operator"]			= {link="NormalNoBG"},				-- Tokens that represent an operator
	-- ["@lsp.type.parameter"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference a function or method parameters
	-- ["@lsp.type.property"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference a member property, member field, or member variable
	-- ["@lsp.type.regexp"]			= {link="NormalNoBG"},				-- Tokens that represent a regular expression literal
	-- ["@lsp.type.string"]			= {link="NormalNoBG"},				-- Tokens that represent a string literal
	-- ["@lsp.type.struct"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference a struct type
	-- ["@lsp.type.type"]				= {link="NormalNoBG"},				-- Identifiers that declare or reference a type that is not covered above
	-- ["@lsp.type.typeParameter"]		= {link="NormalNoBG"},				-- Identifiers that declare or reference a type parameter
	-- ["@lsp.type.variable"]			= {link="NormalNoBG"},				-- Identifiers that declare or reference a local or global variable

	-- --------------------------------------------------------------------------------------- }}} -
	
	}

end

return M
