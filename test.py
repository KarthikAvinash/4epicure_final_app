import requests

url = "https://recipenutrition.pythonanywhere.com/grocery-items/"
# You can replace Test Recipe with "Carrot Juice".. Space is accepted inside the request url.
response = requests.get(url)

if response.status_code == 200:
    recipe = response.json()
    print(recipe)
else:
    print("Error:", response.status_code, response.text)

recipe_id = 23
url = "http://recipenutrition.pythonanywhere.com/grocery/delete/24"

response = requests.delete(url)
if response.status_code == 204:
    print("Grocery item deleted successfully!")
else:
    print("Error deleting grocery item.")
