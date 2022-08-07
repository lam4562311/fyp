import socket
import netifaces

s = socket.socket()

while True:

    host = netifaces.gateways()['default'][netifaces.AF_INET][0]
    port = 4041
    print(host,port)
    msg = netifaces.ifaddresses('wlan0')[netifaces.AF_INET][0]['addr']
    s.connect((host, port))
    val = s.recv(1024)
    if(val == b'Request'):
        s.send(bytes(msg,encoding='utf8'))
        break
    s.close()
s.close()
# s.send(bytes(msg,encoding='utf8'))
# # print(s.recv(1024))
# # while True:
# #     s.recv(1024)
