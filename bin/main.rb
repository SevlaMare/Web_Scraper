#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require_relative '../lib/metadata.rb'
require_relative '../lib/engine.rb'

site = Engine.new

page = site.scan_now
p site.get_titles(page)
