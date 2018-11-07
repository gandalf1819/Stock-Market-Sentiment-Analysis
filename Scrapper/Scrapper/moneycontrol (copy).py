import newspaper
moneycontrol = newspaper.build('http://www.cnbc.com/india',memoize_articles=False)
print('Newspaper build finished...Awaiting Results \n')

for article in moneycontrol.articles:
	print(article.url)

print('Number of currently crawled articles = %s' % moneycontrol.size())

print('Categories are : \n')
for category in moneycontrol.category_urls():
	print(category)

print('Feeds are : \n')
for feed_url in moneycontrol.feed_urls():
	print(feed_url)
	
first_article = moneycontrol.articles[0]
second_article = moneycontrol.articles[1]
first_article.download()


print('parsing Latest Article \n')
first_article.parse()
print(first_article.title)
print(first_article.text)

first_article.nlp()

print(first_article.summary)

print(first_article.keywords)


second_article.download()


print('parsing Second Latest Article \n')
second_article.parse()
print(second_article.title)
#print(first_article.text)

second_article.nlp()

print(second_article.summary)

print(second_article.keywords)






