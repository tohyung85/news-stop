require 'PageCrawler'

class StaticPagesController < ApplicationController
  def index
    crawler = PageCrawler.new
    @data = {}
    PageCrawler::SUPPORTED_SITES.each_key {|key| @data[key] = crawler.crawl_site(key) }
#    @data = crawler.crawl_site(:straits_times)
#    @bbc_data = crawler.crawl_site(:bbc_news)
#    @bloomberg_data = crawler.crawl_site(:bloomberg)

    @test = :bloomberg.to_s.split('_').map!{|a| a.capitalize!}.join(' ')
  end
end
