import re

s = ""

for w in range(0,4):
    for x in range(0,4):
        for y in range(0,4):
            z = f"{w}{x}{y}"
            if z not in s:
                s += z

for x in range(0,4):
    s = re.sub(f'{x}' + '{4,}', f'{x}{x}{x}', s)

while s[0] == s[1] == s[2] == s[-1]: 
    s = s[:-1]

print(s)
print(len(s))

for n in range(0,len(s)):
    z = (s+s)[n:n+3]
    print(n, z, s.find(z,0,n))



# okay so cut those out by hand.
s = "0001002003011012013021022023031032033111211312212313213322232333"

print(s)
print(len(s))

for n in range(0,len(s)):
    z = (s+s)[n:n+3]
    print(n, z, s.find(z,0,n))
