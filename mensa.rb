require 'nokogiri'
require 'open-uri'

class MensaScraper

  def initialize
    @doc = Nokogiri::HTML(open('http://www.studentenwerk-dresden.de/mensen/speiseplan/')) do |config|
      # This is probably not an issue here, but we're not allowing any connections during parsing
      config.strict.nonet
    end
  end

  def get_mensa_list
    menus = @doc.css('.speiseplan')
    menus.each do |menu|
      mensa = menu.css('thead .text').text

      # Otherwise it's listed as 'BioMensa U-Boot (Bio-Code-Nummer: DE-ÖKO-021)'
      if mensa.include? 'U-Boot'
        mensa = 'BioMensa U-Boot'
      end

      yield mensa
    end
  end

end

mensa = MensaScraper.new
mensa.get_mensa_list do |m|
  puts m
end
