class Robot

def kensaku(super_url)

	super_url.each do |url|
		doc = Nokogiri::HTML.parse(open(url))

		title   = doc.css('//div[@class="ptsQes"]/p')[0].to_s
		content = doc.css('//div[@class="ptsQes"]/p')[1].to_s 

		question = Sanitize.clean(title + content).delete("\t")

		best_answer_html = doc.css('//div[@class="mdPstd mdPstdBA othrAns clrfx"]/div/div/div/p').to_s
		best_answer = Sanitize.clean(best_answer_html)

		if question.empty?
			question = "この質問は、18歳未満の方は閲覧できません。\n以下のURLからログインしてご確認下さい。\n" + url
		end

		puts "===[質問]===:\n" + question + "\n\n\n"
		puts "===[ベストアンサー]===:\n" + best_answer + "\n\n\n\n"
	end
end

end
