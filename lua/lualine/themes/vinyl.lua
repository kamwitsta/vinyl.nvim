local p = require("vinyl.palette").get_palette(nil)

return {

	normal = {
		a = {fg=p.beige0,bg=p.beige60,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige20},
	},

	insert = {
		a = {fg=p.beige0,bg=p.teal,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	visual = {
		a = {fg=p.beige0,bg=p.purple,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	replace = {
		a = {fg=p.beige0,bg=p.orange,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	command = {
		a = {fg=p.beige0,bg=p.green,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	inactive = {
		a = {fg=p.beige0,bg=p.beige20,bold=true},
		b = {fg=p.beige0,bg=p.beige20},
		c = {fg=p.beige0,bg=p.beige20},
	},

}
