tarjeta = input("")
digitos = [int(d) for d in tarjeta]

for i in range (len(digitos)-2,-1,-2):
    digitos[i] *= 2
    if digitos[i]>9:
        digitos[i] -= 9

suma = sum(digitos)

print(suma%10 == 0)