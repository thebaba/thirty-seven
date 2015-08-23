require 'open-uri'
require 'pry'

namespace :thirtyseven do
  desc 'Parse thirty-seven.org html to generate seed data'
  task :olddata => :environment do

    Factoid.delete_all

    base = "http://thirty-seven.org/"

    seed = Rails.root + 'db/seeddata/amazing.html'
    doc = Nokogiri::HTML(File.open(seed))

    doc.xpath('//ul/li').each do |element|
      content = element.content.gsub(/\n|\t/," ").strip.squeeze(" ")
      content.gsub!(/\(Note\)\.?/, "")
      puts content
      f = Factoid.new(:summary => content)
      body = ""
      element.children.each do |child|
        if child.name.downcase == 'a' && child.content == 'Note'
          note = Nokogiri::HTML(open("#{base}#{child['href']}"))
          note_html = note.css('body')[0].children.to_s.gsub(/<h2>.*<\/h2>/,"")
          f.note = note_html
        else
          body += child.to_s
        end
      end
      f.body = body.gsub(/\(\)\.?/,"").strip
      f.save
    end

  end
end
