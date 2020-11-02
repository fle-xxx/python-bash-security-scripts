import requests
import keyboard 
from requests.adapters import HTTPAdapter


def main():

    count = 0
    root_link = 'https://example.com/index.html?token=AB' # this is a constant part of link
    adapter = HTTPAdapter(max_retries = 5) # create an adapter, to retry request after unsuccessful attempt
    http = requests.Session()
    http.mount("https://", adapter)

    for i in range(100, 200): 

        if keyboard.is_pressed('s'): # bad "Status" button. will be updated 
            print(count)

        final_string = str(i) # convert variable part of token to string type
        full_link = root_link + final_string 
        response = http.get(full_link)


        if ('word which must be in response' in response.text):
            print(full_link + '\n')

        count += 1

if __name__ == '__main__':
    main()
