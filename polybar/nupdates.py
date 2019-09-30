import subprocess as sp

try:
    out = sp.check_output(['pacman', '-Qu'])
    out = out.decode('utf-8').split('\n')[:-1]
    print(len(out))

except:
    print(0)
