require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://9gag.com')

categories = page.search('//*[@id="top-nav"]/div/div[1]/ul/li/a')
categories.each do |categ|
  name = categ.xpath('.//span/text()').to_s.strip
  puts name
  next if name == 'More'
  link = categ.xpath('.//@href').to_s
  puts link
  sub_page = agent.get(link)
  articles = sub_page.search("//section[@id='list-view-2']/div[@class='badge-entry-collection']/article/header")

  load_more = sub_page.search("//div[@class='main-wrap']/section/div[@class='loading']/a[@class='btn badge-load-more-post']/@href").to_s

  articles.each do |post|
    link = post.xpath('.//h2/a/@href')
    title = post.xpath('.//h2/a/text()').to_s.strip
    points = post.xpath('.//p/a/span/text()').to_s.strip
    puts link, title, points
    end
  
  load_more_page = agent.get('http://9gag.com' + load_more)
  
  articles = load_more_page.search("//section[@id='list-view-2']/div[@class='badge-entry-collection']/article/header")

  articles.each do |post|
    link = post.xpath('.//h2/a/@href')
    title = post.xpath('.//h2/a/text()').to_s.strip
    points = post.xpath('.//p/a/span/text()').to_s.strip
    puts link, title, points
    end

end
more_categ = page.search('//*[@id="jsid-header-funny-menu-items"]/ul/li/a')
more_categ.each do |categ|
  name = categ.xpath('.//text()').to_s
  link = categ.xpath('.//@href')
  puts name, link
  end





