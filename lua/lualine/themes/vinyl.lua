local p = require("vinyl.palette").palette

return {

	normal = {
		a = {fg=p.beige0,bg=p.beige60,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige20},
	},

	insert = {
		a = {fg=p.beige0,bg=p.teal1,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	visual = {
		a = {fg=p.beige0,bg=p.purple1,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	replace = {
		a = {fg=p.beige0,bg=p.orange2,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	command = {
		a = {fg=p.beige0,bg=p.green1,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige40},
	},

	inactive = {
		a = {fg=p.beige0,bg=p.beige20,bold=true},
		b = {fg=p.beige0,bg=p.beige20},
		c = {fg=p.beige0,bg=p.beige20},
	},

}
