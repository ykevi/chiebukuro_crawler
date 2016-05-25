require 'nokogiri'
require 'open-uri'
require 'sanitize'

require_relative "robot"

print "キーワードを入力して下さい。"

keyword = gets.chomp

url_jp = "http://chiebukuro.search.yahoo.co.jp/search?p=" + keyword
url = URI.encode(url_jp)

doc = Nokogiri::HTML.parse(open(url))

arr1 = doc.css('div.KSsin a').map{|link| link['href']}

super_url = Array.new

arr1.each do |url|
	super_url.push(url) if url.include?("detail")
end

robot = Robot.new

robot.kensaku(super_url)

