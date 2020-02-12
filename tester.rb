#!/usr/imports/bin/ruby
require_relative("fractions.rb")

for i in 1..1000 do 
	result = "#{i},"
	frac = get_rational(i)
	result << frac.print_nice << ",";
	label = get_label(frac).float_rep;
	result << "#{label}";

	if (label == i) then
		result << ",VALID";
	else
		result << ",FAIL";
	end

	puts result
end