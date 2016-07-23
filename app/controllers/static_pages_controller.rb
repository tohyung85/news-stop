require 'PageCrawler'

class StaticPagesController < ApplicationController
  def index
    mechanize = Mechanize.new
    #page = mechanize.get('http://www.bbc.com/news')
    crawler = PageCrawler.new
    @data = crawler.crawl_site(:straits_times)

  end
end
