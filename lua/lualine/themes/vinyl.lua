local p = require("vinyl.palette").palette

return {

	normal = {
		a = {fg=p.beige0,bg=p.teal1,bold=true},
		b = {fg=p.beige0,bg=p.beige80},
		c = {fg=p.beige0,bg=p.beige60},
	},

	insert = {
		a = {fg=p.beige0,bg=p.blue1,bold=true},
		b = {fg=p.beige0,bg=p.beige80},
		c = {fg=p.beige0,bg=p.beige60},
	},

	visual = {
		a = {fg=p.beige0,bg=p.purple1,bold=true},
		b = {fg=p.beige0,bg=p.beige80},
		c = {fg=p.beige0,bg=p.beige60},
	},

	replace = {
		a = {fg=p.beige0,bg=p.orange2,bold=true},
		b = {fg=p.beige0,bg=p.beige80},
		c = {fg=p.beige0,bg=p.beige60},
	},

	command = {
		a = {fg=p.beige0,bg=p.green1,bold=true},
		b = {fg=p.beige0,bg=p.beige80},
		c = {fg=p.beige0,bg=p.beige60},
	},

	inactive = {
		a = {fg=p.beige0,bg=p.beige40,bold=true},
		b = {fg=p.beige0,bg=p.beige40},
		c = {fg=p.beige0,bg=p.beige20},
	},

}
