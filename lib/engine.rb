class Engine < Metadata
  def scan_now(_page = 1)
    # link = "https://www.simplyhired.com/search?q=full+stack+developer&pn=#{page}"
    # Nokogiri::HTML(open(link))

    file = File.read('C:\dev\Rails\example\20 Best full stack developer jobs (Hiring Now!) _ SimplyHired.html')
    Nokogiri::HTML(file).css('body')
  end

  # --- GET RAW DATA ---
  def get_titles(site)
    site.css('.card-link').each do |card|
      @title << card.content
    end
    @title
  end

  def get_locations(site)
    site.css('.jobposting-location').each do |card|
      @location << card.content
    end
    @location
  end

  def get_salaries(site)
    site.css('.jobposting-salary').each do |card|
      @salary << card.content
    end
    @salary
  end

  def get_content(site)
    site.css('.jobposting-snippet').each do |card|
      @content << card.content
    end
    @content
  end

  # --- CLEAN DATA ---
  def clean_data
    temp = []
    (0...@location.length).step(2).each do |index|
      temp << @location[index]
    end
    @location = temp
  end

  # --- SHOW DATA ---
  def display(argx)
    argx = @title if argx == 'title'
    argx = @location if argx == 'location'
    argx = @salary if argx == 'salary'
    argx = @content if argx == 'content'
    argx.each { |line| p line }
  end
end
