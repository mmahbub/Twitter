require 'json'

INPUT_DIR = "/home/maria/Documents/CS545/Twitter/Data/tweet"

key_to_column = Hash.new
current_row = Array.new
f = File.new('MegaTweets.csv','w')
f.write("'cleantext'")

for filename in Dir.glob(File.join(INPUT_DIR, "*")) do
	data = JSON.parse(IO.read(filename))
		text = data["text"]
		
		text = text.gsub("http:// ","http://")
		text = text.gsub("https:// ","https://")
		text = text.gsub("http://www ","http://www")
		text = text.gsub("https://www ","https://www")
		text = text.gsub("\r","")
		text = text.gsub("\n","")
		text = text.gsub("|","")
	
	        textClean = text
		textClean = textClean.gsub(/pic.twitter.com\/[^\s]*/,"")
		textClean = textClean.gsub(/https:\/\/[^\s]*/,"")
		textClean = textClean.gsub(/http:\/\/[^\s]*/,"")
        textClean = textClean.gsub(/#/, "")
        textClean = textClean.gsub(/@/, "")

		f.write("\n%s" % [textClean])
end
f.close()
