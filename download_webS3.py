import os
import requests
import xml.etree.ElementTree as ET
import sys

if len(sys.argv) != 2:
    print("Usage: script_name.py <URL>")
    sys.exit(1)

# Получение полного URL из аргумента
full_url = sys.argv[1]

# Разделение на базовый URL и путь к XML
base_url = "/".join(full_url.split("/")[:-1]) + "/"
folder_name = "/".join(full_url.split("/")[3:-1])  # Исключаем доменное имя и берем оставшиеся части пути

response = requests.get(full_url)
if response.status_code != 200:
    print("Error fetching XML!")
    exit()

root = ET.fromstring(response.content)

# Определение пространства имен динамически
namespace = {'s3': root.tag.split('}')[0].strip('{')}

# Папка для сохранения файлов с учетом пути
save_directory = f"./{folder_name}/"
if not os.path.exists(save_directory):
    os.makedirs(save_directory)

keys = root.findall(".//s3:Key", namespaces=namespace)
print(f"Found {len(keys)} Key elements.")

for key in keys:
    relative_path = key.text
    print(f"Processing Key: {relative_path}")

    # Формирование полного URL на основе базового URL и относительного пути
    file_url = base_url + relative_path

    try:
        print(f"Attempting to download: {file_url}")
        file_response = requests.get(file_url)
        if file_response.status_code == 200:
            local_path = os.path.join(save_directory, relative_path)
            os.makedirs(os.path.dirname(local_path), exist_ok=True)  # Создаем папки, если их нет
            with open(local_path, 'wb') as f:
                f.write(file_response.content)
        else:
            print(f"Failed to download {file_url}. Status code: {file_response.status_code}")
    except Exception as e:
        print(f"Error downloading {file_url}. Reason: {e}")

