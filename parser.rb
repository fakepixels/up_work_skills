require 'rubygems'
require 'net/http'
require 'nokogiri'

# Class for parsing skills on UpWork
# Simple usage :)

# skill_parser = SkillParser.new ('a'..'z')
# skill_parser.parse_pages
# p skill_parser.data

class SkillParser
  attr_accessor :pages, :data

  # pages is array or range of pages 
  def initialize pages
    raise ArgumentError.new('Only array, or range') unless pages.kind_of?(Array) ||  pages.kind_of?(Range)
    @pages = pages || ('a'..'z')
    @data = []
  end

  # just parser
  def parse_pages
    @pages.each do |page|     
      begin
        uri = URI("https://www.upwork.com/i/freelancer-skills-#{page}/")
        doc = Nokogiri::HTML(Net::HTTP.get(uri)) do |config|
            config.strict.nonet.noblanks.noerror 
        end

        doc.css('.skill-item').each do |list|
          skill = list.css('a').text
          unless skill.nil?          
            @data << skill
          end
        end
      rescue Exception => e
        puts "Some errors: #{e}"
      end
    end
  end
end