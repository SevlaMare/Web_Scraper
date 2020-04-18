class Engine < Metadata
  def scan_now(page = 1, term = nil)
    term = term.strip.gsub!(' ', '+')

    link = "https://www.simplyhired.com/search?q=#{term}&pn=#{page}"
    Nokogiri::HTML(URI(link).open)
  end
end
