import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# Base URL of the image directory
base_url = "http://172.16.234.26/assets/images/"

# Directory to save images
save_dir = "downloaded_images"
os.makedirs(save_dir, exist_ok=True)

# Fetch page content
response = requests.get(base_url)
response.raise_for_status()

# Parse HTML
soup = BeautifulSoup(response.text, "html.parser")

# Collect all links
links = soup.find_all("a")

# Allowed image extensions
image_extensions = (".png", ".jpg", ".jpeg", ".gif", ".bmp", ".webp")

for link in links:
    href = link.get("href")
    if not href:
        continue
    
    # Check if link ends with an image extension
    if href.lower().endswith(image_extensions):
        full_url = urljoin(base_url, href)
        filename = os.path.join(save_dir, os.path.basename(href))
        
        print(f"Downloading {full_url} -> {filename}")
        img_data = requests.get(full_url).content
        with open(filename, "wb") as f:
            f.write(img_data)

print("All images downloaded successfully!")