import urllib.request
import json
import time

class GoogleFinanceAPI:
    def __init__(self):
        self.prefix = "http://finance.google.com/finance/info?client=ig&q="
    
    def get(self,symbol,exchange):
        url = self.prefix+"%s:%s"%(exchange,symbol)
        u = urllib.request.openurl(url)
        content = u.read()
        
        obj = json.loads(content[3:])
        return obj[0]

f=open("data.txt","w+")        
        
if __name__ == "__main__":
    c = GoogleFinanceAPI()
    
    while 1:
        quote = c.get("MSFT","NASDAQ")
        f.write(quote)
        time.sleep(30)


		
