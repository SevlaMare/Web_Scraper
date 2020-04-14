#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://www.indeed.com/jobs?q=full+stack&l='))

# get raw data
puts 'Search results for Full Stack'
doc.css('div#searchCountPages').each do |link|
  p link.content
end

puts 'Income offer'
doc.css('.salaryText').each do |link|
  p link.content
end

# clean data

# display data
