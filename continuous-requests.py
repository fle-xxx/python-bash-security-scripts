import requests
from requests.adapters import HTTPAdapter


def main():

    count = 0
    root_link = 'https://example.com/blabla?key=' 
    adapter = HTTPAdapter(max_retries = 5) 
    http = requests.Session()
    http.mount("https://", adapter)

    for i in range(5100, 6000): 

        final_string = str(i) 
        full_link = root_link + final_string 
        http.get(full_link, headers={'Cookie': 'Cookie1=value1; Cookie2=value2;'}) # make requests and do not check response (I used it for flood)

        count += 1

if __name__ == '__main__':
    main()
