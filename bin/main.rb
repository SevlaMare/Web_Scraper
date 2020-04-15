#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

file = File.read('C:\dev\Rails\scraper\example\20 Best full stack developer jobs (Hiring Now!) _ SimplyHired.html')
page = Nokogiri::HTML(file).css('body')

# --- GET RAW DATA ---
titles = []
page.css('.card-link').each do |card|
  titles << card.content
end

# next two by two
location = []
page.css('.jobposting-location').each do |card|
  location << card.content
end

salary = []
page.css('.jobposting-salary').each do |card|
  salary << card.content
end

content = []
page.css('.jobposting-snippet').each do |card|
  content << card.content
end

# --- CLEAN DATA ---

# --- DISPLAY DATA ---
titles.each { |line| p line }
location.each { |line| p line }
salary.each { |line| p line }
content.each { |line| p line }
