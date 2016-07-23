require 'mechanize'
require 'NewsArticle'

class PageCrawler

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming  

  attr_reader :data

  @mechanize = nil

  SUPPORTED_SITES = { :straits_times => 'http://www.straitstimes.com/'}
  def initialize
    @mechanize = Mechanize.new
    #page = mechanize.get('http://www.bbc.com/news')
  end

  def crawl_site(site)
    case site
    when :straits_times
      @data = straits_times_data(SUPPORTED_SITES[:straits_times]) 
    else
      @data = nil
    end    

    return @data
  end

  private

  def straits_times_data(url)

    page = @mechanize.get(url)
    article_data = []
    raw_articles = page.search("[data-vr-zone^='Top Stories']").search("div[class^='views-row']")    
    raw_articles.each do |raw_article|       
      article = NewsArticle.new
      article.headline = raw_article.search(".story-headline a").text
      article.link = url + raw_article.search(".story-headline a").attribute('href').value
      article.description = raw_article.search(".media-text").text
      article_data << article
    end    

    return article_data
  end

end