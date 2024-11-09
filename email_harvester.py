from googleapiclient.discovery import build
import json
import re

# Replace with your Google API Key and Custom Search Engine ID
api_key = "<api_key>"
cse_id = "<cse_id>"

search_query = '"technical recruiter" OR "talent+acquisition" OR "recruitment" "CA" intitle:"@gmail.com" -intitle:"profiles" -inurl:"dir/+"+site:www.linkedin.com/in/'

def google_search(query):
    service = build("customsearch", "v1", developerKey=api_key)
    start_index = 1  # Starting index for the search
    results = []
    
    while True:
        # Make the API call
        res = service.cse().list(q=query, cx=cse_id, start=start_index).execute()

        # Add results to the list
        items = res.get('items', [])
        results.extend(items)
        
        # Check if there are more results
        if len(items) < 10:  # If less than 10 results are returned, we are at the end
            break
        
        # Increment start index for the next request
        start_index += 10
    
    return results


# Example usage
results = google_search(search_query)
email_pattern = r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'

for result in results:
    # print(result['title'], result['htmlTitle'], result['link'])
    email = re.findall(email_pattern, result['title'])
    # print(result['title'])
    # print(result['link'])
    if email:
        print(f"Title: {result['title']}, LinkedIn: {result['link']}, Email: {email[0]}")
        with open('emails.txt', 'a') as f:
            f.write(f"{email[0]}\n")
    else:
        print(f"Title: {result['title']}, LinkedIn: {result['link']}")

    
