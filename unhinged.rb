#! /usr/bin/env ruby

prng = Random.new
sw = true
while aLine = gets
	aNewLine = String.new
	aLine.split(' ').each do |w|
		if (w.upcase == w || w.capitalize == w || w =~ /^[0-9]/ || w =~ /\n$/) 
			aNewLine << w + " "
		else
			if prng.rand(100) < 9
				if prng.rand(100) < 20
					e = "!"
				else
					e = ""
				end
				if sw
					aNewLine << "\"" + w + e + "\" "
					sw = false
				else
					aNewLine << w.upcase + e + " "
					sw = true
				end
			else
				aNewLine << w + " "
			end
		end
	end
	puts aNewLine
end


