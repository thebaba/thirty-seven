
namespace :thirtyseven do
  desc 'Parse thirty-seven.org html to generate seed data'
  task :olddata => :environment do

    Factoid.delete_all

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
          f.note = child.to_s
        else
          body += child.to_s
        end
      end
      f.body = body.gsub(/\(\)\.?/,"").strip
      f.save
    end

  end
end
