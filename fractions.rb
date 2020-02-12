def main(mode, x, y)
	case ARGV[0]
	when "rational"
		if (ARGV.length != 3) then fail "Usage: fractions.rb rational <numerator> <denominator>" end
		frac = Fraction.new(Integer(ARGV[1]),Integer(ARGV[2]))
		puts get_label(frac).float_rep
	when "natural"
		if (ARGV.length != 2) then fail "Usage: fractions.rb natural <number>" end
		frac = get_rational(Integer(ARGV[1]))
		puts frac.print_nice
	else
		fail "Usage: fractions.rb <mode=\"rational\",\"natural\"> <params>"
	end
end

def main2(n)
	for i in 1..n do 
		result = String(i);
		frac = get_rational(n)
		result << "," << frac.print_nice << ",";
		if get_label(frac).float_rep == i then
			result << "VALID\n"
		else
			result << "INVALID\n"
		end
		puts result
	end

	return nil
end

class Fraction 
	def initialize(x,y)
		@num = x
		@denom = y
		reduce_fract
	end

	def reduce_fract
		if @num < @denom then
			x = @num
			y = @denom
		else
			x = @denom
			y = @num
		end
		
		gcd = euclid_gcd(x.abs,y.abs)

		if (@denom < 0) then
			@denom = @denom * -1
			@num = @num * -1
		end

		@num = @num / gcd
		@denom = @denom / gcd
	end

	def euclid_gcd(x,y)
		if (x == 0) then
			return y
		else
			return euclid_gcd(y % x, x)
		end
	end

	def multiply(x)
		numb = @num * x
		return Fraction.new(numb,@denom)
	end

	def divide(x)
		den = @denom * x
		return Fraction.new(@num, den)
	end

	def divide_f(fract)
		deno = fract.num * @denom
		num = fract.denom * @num
		return Fraction.new(num, deno)
	end

	def add(x)
		num = @num + x*@denom
		return Fraction.new(num, @denom)
	end

	def add_f(f)
		num = @num*f.denom + f.num*@denom
		deno = @denom*f.denom
		return Fraction.new(num, deno)
	end

	def print_nice
		result = "";
		result << String(@num) << "/" << String(@denom);
		return result;
	end

	def num
		@num
	end

	def denom
		@denom
	end

	def float_rep
		@num.to_f / @denom.to_f
	end
end

def sterns_diatom(x) 
	if x == 0 then
		return 0
	elsif x == 1 then
		return 1
	elsif x % 2 == 0 then
		return sterns_diatom(x/2)
	else
		return sterns_diatom((x-1)/2)+sterns_diatom((x+1)/2)
	end
end

def f(x)
	return Fraction.new(sterns_diatom(x), sterns_diatom(x+1))
end

# Bijection
def f_inv (x)
	if x.float_rep == 1 then
		return Fraction.new(1,1)
	elsif x.float_rep < 1 then
		return f_inv(x.divide_f(x.multiply(-1).add(1))).multiply(2)
	else
		return f_inv(x.add(-1)).multiply(2).add(1)
	end
end

# Bijection N -> Q
def h(z)
	if z % 2 == 0 then
		return z/2
	else
		return -1*(z - 1)/2
	end
end

# Bijection of Z->N
def h_inv(z)
	if z.float_rep > 0 then
		return z.multiply(2)
	elsif z.float_rep == 0
		return Fraction.new(1,1)
	else
		return z.multiply(-2).add(-1)
	end
end

def g(z)
	if z > 0 then
		return f(z)
	elsif z < 0 then
		return f(-1*z).multiply(-1)
	else
		return Fraction.new(0,1);
	end
end

def g_inv(z)
	if z.float_rep > 1 then
		return f_inv(z.add(-1)).multiply(2).add(1)
	elsif z.float_rep == 1 then
		return Fraction.new(1,1)
	elsif z.float_rep == 0 then
		return Fraction.new(0,1)
	elsif z.float_rep < 1 and z.float_rep > 0 then
		return f_inv(z.divide_f(Fraction.new(1,1).add_f(z.multiply(-1)))).multiply(2)
	elsif z.float_rep > -1 and z.float_rep < 0 then
		return f_inv(z.multiply(-1).divide_f(z.add(1))).multiply(-2).add(-1)
	elsif z.float_rep == -1 then
		return Fraction.new(-1,1)
	elsif z.float_rep < -1 then
		return (f_inv(z.multiply(-1).add(-1)).add(1)).multiply(-2)
	end
end

def get_label(f)
	return h_inv(g_inv(f))
end

def get_rational(n)
	return g(h(n))
end




