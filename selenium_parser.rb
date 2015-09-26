require 'rubygems'
require 'selenium-webdriver'

# Parser class
class SkillParser
  attr_accessor :pages, :browser, :data

  # pages is array or range of pages
  def initialize(pages)
    raise ArgumentError.new('Only array, or range') unless pages.is_a?(Array) || pages.is_a?(Range)
    @pages = pages || ('a'..'z')
    @browser = Selenium::WebDriver.for :firefox
    @data = []
  end

  # just parser
  def parse_pages
    @pages.each do |page|
      begin
        @browser.get "https://www.upwork.com/i/freelancer-skills-#{page}/"
        links = @browser.find_elements(:xpath,"//*[contains(@class, 'skill-item')]/a").map(&:text)
        @data.concat(links)
      rescue StandartError => e
        puts "Some errors: #{e}"
      end
    end
    @browser.quit
  end
end

#skill_parser = SkillParser.new ('a'..'k')
#skill_parser.parse_pages
#p skill_parser.data

