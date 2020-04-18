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
  
  # --- CLEAN DATA ---
  def remove_duplicates
    temp = []
    (0...@location.length).step(2).each do |index|
      temp << @location[index]
    end
    @location = temp
  end
end