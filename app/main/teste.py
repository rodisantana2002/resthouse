import string
from random import randrange

LENGTH = 8
alphabets = string.digits + string.ascii_letters

def randstr(n):
    return ''.join(alphabets[randrange(len(alphabets))] for i in range(n))

if __name__ == '__main__':
    print( randstr(LENGTH))