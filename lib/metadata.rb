require 'nokogiri'
require 'open-uri'

class Metadata
  def initialize
    @titles = Array.new
    @location = Array.new
    @salary = Array.new
    @content = Array.new
  end
end

class Engine < Metadata
  def scan_now(page = 1)
    # link = "https://www.simplyhired.com/search?q=full+stack+developer&pn=#{page}"
    # Nokogiri::HTML(open(link))
    file = File.read('C:\dev\Rails\example\20 Best full stack developer jobs (Hiring Now!) _ SimplyHired.html')
    Nokogiri::HTML(file).css('body')
  end

  # --- GET RAW DATA ---
  def get_titles(page)
    page.css('.card-link').each do |card|
      @titles << card.content
    end
    @titles
  end

  private :get_titles

  # --- SHOW DATA ---
  def display_titles
    get_titles(page)
    @titles.each { |line| p line }
  end
end

site = Engine.new
page = site.scan_now
# p site.get_titles(page)

