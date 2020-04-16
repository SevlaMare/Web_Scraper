require 'nokogiri'
require 'open-uri'
require_relative '../lib/metadata.rb'
require_relative '../lib/engine.rb'

def show_all(page = 1)
  scrap = Engine.new
  page = scrap.scan_now(page)

  # --- STORE DATA ---
  scrap.get_titles(page)
  scrap.get_locations(page)
  scrap.get_salaries(page)
  scrap.get_content(page)

  # --- CLEAN DATA ---
  scrap.clean_data

  # --- DISPLAY ---
  scrap.display('title')
  scrap.display('location')
  scrap.display('salary')
  scrap.display('content')
end

show_all(3)
