require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/metadata.rb'
require_relative '../lib/engine.rb'

def show_all(page = 1, export = true, search = 'full stack')
  scrap = Engine.new
  page = scrap.scan_now(page, search)

  # --- STORE DATA ---
  scrap.get_it(page, 'title')
  scrap.get_it(page, 'location')
  scrap.get_it(page, 'salary')
  scrap.get_it(page, 'content')

  # --- CLEAN DATA ---
  scrap.remove_duplicates

  # --- DISPLAY ---
  scrap.display('title')
  scrap.display('location')
  scrap.display('salary')
  scrap.display('content')

  # --- EXPORT CSV ---
  scrap.export if export
end

# page_number, export_to_csv
show_all(3, true, 'ruby rails')
