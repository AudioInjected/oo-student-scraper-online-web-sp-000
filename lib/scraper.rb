require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css(".student-card")
    array = []
    students.each do |student|
      info = {}
      info[:name] = student.css("h4.student-name").text
      info[:location] = student.css("p.student-location").text
      info[:profile_url] = student.css("a")[0].attributes["href"].value

      binding.pry
      array << info
    end
    array
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
