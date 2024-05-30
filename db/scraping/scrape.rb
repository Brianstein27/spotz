require "open-uri"
require "nokogiri"
require "csv"


url = "https://www.visitberlin.de/en/top-events-berlin?items_per_page=50"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)

events = []


html_doc.search(".l-list__item").each do |event|
  date = event.search("time").children.take(2).map { |child| child.text }
  time = event.search(".teaser-search__time .me__content").text.strip
  title = event.search(".teaser-search__content h2").text.strip
  address = event.search(".me__content .nopr").text.strip

events << { date: date.last, address: address, title: title, time: time }
end

csv_content = CSV.generate(headers: true) do |csv|
  csv << ["Date", "Time", "Title", "Address"]

    events.each do |event|
      csv << [event[:date], event[:time], event[:title], event[:address]]
    end
  end

  file_path = File.join(__dir__,"events.csv")
  File.write(file_path, csv_content)



