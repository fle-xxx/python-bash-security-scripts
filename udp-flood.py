from scapy.all import *

payload = 'a' * 100

send(IP(dst="192.168.1.108")/fuzz(UDP()/payload),loop=1)
