import os

out = os.popen('systemctl status laptop-mode.service | grep active').read().split(' ')[4]

if out == 'active' :
    print('ON')
elif out == 'inactive' :
    print('OFF')
else:
    print('nuse')
