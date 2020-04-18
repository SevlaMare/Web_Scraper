require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/metadata.rb'
require_relative '../lib/engine.rb'

def show_all(page = 1, export = true, search = 'ruby')
  scrap = Engine.new
  page = scrap.scan_now(page, search)

  # --- STORE DATA ---
  scrap.get_it(page, 'title')
  scrap.get_it(page, 'location')
  scrap.get_it(page, 'salary')
  scrap.get_it(page, 'content')

  # --- CLEAN DATA ---
  scrap.remove_duplicates

  # --- EXPORT CSV ---
  scrap.export if export

  puts 'File exported.'
end

# page_number, export_to_csv, search term
show_all(1, true, 'ruby rails')
