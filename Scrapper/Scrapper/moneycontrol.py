import newspaper
moneycontrol = newspaper.build('http://www.cnbc.com/india',memoize_articles=False)

f = open('ScrappedData_CNBC.txt', 'w')
#f.write('hi there\n')  # python will convert \n to os.linesep

print('\n\n\nNewspaper build finished...Awaiting Results \n\n')
f.write('\n\n\nNewspaper build finished...Awaiting Results \n\n')

for article in moneycontrol.articles:
	print(article.url)
	#f.write(article.url)

print('\n\n\nNumber of currently crawled articles = %s\n\n' % moneycontrol.size())
f.write('\n\n\nNumber of currently crawled articles = %s\n\n' % moneycontrol.size())


print('\n\n\nCategories are :\n\n')
f.write('\n\n\nCategories are :\n\n')

for category in moneycontrol.category_urls():
	print(category)
	f.write(category)

print('\n\nFeeds are : \n')
f.write('\n\nFeeds are : \n')

for feed_url in moneycontrol.feed_urls():
	print(feed_url)
	f.write(feed_url)

f.write('\n-------------------------------------------------\n\n')
index = 1

for current_article in moneycontrol.articles:
	current_article.download()
	print('\n\nparsing Article %s\n' % index)
	f.write('\n\nparsing Article %s\n' % index)
	
	current_article.parse()
	print('\n\n### TITLE: \n%s' % current_article.title)
	f.write('\n\n### TITLE: \n%s' % current_article.title)
	
	print('\n\n### TEXT: \n%s' % current_article.text)
	f.write('\n\n### TEXT: \n%s' % current_article.text)
	current_article.nlp()
	print('\n\n### summary: \n%s' % current_article.summary)
	f.write('\n\n### summary: \n%s' % current_article.summary)
	
	print('\n\n### keywords: \n%s' % current_article.keywords)
	f.write('\n\n### keywords: \n')
	for keyword in current_article.keywords:
		f.write('%s\n' % keyword)	
		
	index = index + 1	
	f.write('\n-------------------------------------------------\n\n')
	print('\n-------------------------------------------------\n\n')
	
f.close()  # you can omit in most cases as the destructor will call it



