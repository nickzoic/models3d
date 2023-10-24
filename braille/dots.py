s = ""

for x in range(0,8):
    for y in range(0,8):
        z = f"{x}{y}"
        if z not in s:
            s += z

for x in range(0,8):
    s = s.replace(f"{x}{x}{x}", f"{x}{x}")

if s[0] == s[1] == s[-1]: 
    s = s[:-1]

print(s)
print(len(s))
