import requests
import keyboard 
from requests.adapters import HTTPAdapter


def main():

    count = 0
    root_link = 'https://example.com/index.html?token=AB'
    adapter = HTTPAdapter(max_retries = 5)
    http = requests.Session()
    http.mount("https://", adapter)

    for i in range(100, 200): 

        if keyboard.is_pressed('s'):
            print(count)

        final_string = str(i)
        full_link = root_link + final_string
        response = http.get(full_link)


        if ('word which must be in response' in response.text):
            print(full_link + '\n')

        count += 1

if __name__ == '__main__':
    main()
