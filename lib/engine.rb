class Engine < Metadata
  def scan_now(page = 1, term = nil)
    term = term.strip.gsub!(' ', '+')

    link = "https://www.simplyhired.com/search?q=#{term}&pn=#{page}"
    Nokogiri::HTML(URI(link).open)
  end
  
  # --- GET RAW DATA ---
  def get_it(site, argx)
    key = @title if argx == 'title'
    key = @location if argx == 'location'
    key = @salary if argx == 'salary'
    key = @content if argx == 'content'

    site.css(@map_class[argx]).each do |card|
      key << card.content
    end
    key
  end
end
