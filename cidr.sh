filein=$1 #cidr scope file


        while IFS= read line

                do 

                        nmap -sL -n $line | grep 'Nmap scan report for' | cut -f 5 -d ' ' >> cidr


                done <"$filein"


	wc cidr;

'
Gets file: 
192.168.1.0/24
111.44.55.0/24
...

Creates file: 
192.168.1.0
192.168.1.1
192.168.1.2
...
111.44.55.0
111.44.55.1
111.44.55.2
...

for any cidr
