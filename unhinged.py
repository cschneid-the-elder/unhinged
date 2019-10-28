#! /usr/bin/python

import random
import sys

sw = 1

for line in sys.stdin:
    for word in line.split(' '):
        if word.istitle() or word.isupper() or (len(word) > 0 and word[0].isdigit()) or word.endswith('\n'):
            sys.stdout.write(word + ' ')
        else:
            if random.random() < 0.09:
                if random.random() < 0.2:
                    e = '!'
                else:
                    e = ''
                if sw == 1 or word.startswith('"'):
                    sys.stdout.write(word.upper() + e + ' ')
                    sw = 0
                else:
                    sys.stdout.write('"' + word + e + '" ')
                    sw = 1
            else:
                sys.stdout.write(word + ' ')
                
print
print