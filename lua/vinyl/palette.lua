local M = {}

function M.get_palette(variant)

	if variant=="dark" then
-- - dark -------------------------------------------------------------------------------------- {{{ -
		return {

			beige100= "#ffedc2",	-- normal
			beige80	= "#d4c5a4",
			beige60	= "#a99e85",
			beige40	= "#7e7766",	-- comments
			beige20	= "#545048",
			beige10	= "#3e3c38",	-- omitted for terminal
			beige0	= "#282828",

			red		= "#bc2924",
			orange	= "#ce5c2c",
			yellow	= "#d0a21b",
			green	= "#8a8c46",
			teal	= "#638863",
			blue	= "#498686",
			purple	= "#a66482",

		}
-- --------------------------------------------------------------------------------------------- }}} -
	else
-- - light ------------------------------------------------------------------------------------- {{{ -
		return {

			beige100= "#ffedc2",	-- normal
			beige80	= "#d4c5a4",
			beige60	= "#a99e85",
			beige40	= "#7e7766",	-- comments
			beige20	= "#545048",
			beige10	= "#3e3c38",	-- omitted for terminal
			beige0	= "#282828",

			red		= "#e33631",	-- type + flow control
			orange	= "#f68737",	-- bracket
			yellow	= "#ecc44b",	-- function
			green	= "#baba3b",	-- constant
			teal	= "#67af7f",
			blue	= "#8cb5aa",	-- delimiter + operator + attribute
			purple	= "#ce8d99",	-- special

		}
-- --------------------------------------------------------------------------------------------- }}} -
	end

end

return M

-- beige90	= "#ead9b3",
-- beige70	= "#beb194",
-- beige50	= "#938a75",
-- beige30	= "#696357",
