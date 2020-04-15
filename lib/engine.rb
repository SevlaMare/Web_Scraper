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
      titles << card.content
    end
  end

  # page.css('.jobposting-location').each do |card|
  #   location << card.content
  # end

  # page.css('.jobposting-salary').each do |card|
  #   salary << card.content
  # end

  # page.css('.jobposting-snippet').each do |card|
  #   content << card.content
  # end
end

# # --- CLEAN DATA ---
# temp = []
# (0...location.length).step(2).each do |index|
#   temp << location[index]
# end
# location = temp

# # --- DISPLAY DATA ---
# titles.each { |line| p line }
# location.each { |line| p line }
# salary.each { |line| p line }
# content.each { |line| p line }