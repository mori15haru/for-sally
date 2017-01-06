require './lib/ytdl.rb'

# comments for Sally
if __FILE__ == $0
  def greeting
    puts '# 1. List up the videos you want to download'
    print '# : '
  end

  def prompt
    '# : '
  end

  def bye
    ['', 'bye']
  end

  # console-ui starts here
  puts "#{'='*60}"

  # gets urls from you until you type nothing ('') or 'bye'
  urls = [].tap do |urls_array|
    greeting
    while url = gets.chomp
      break if bye.include?(url)
      urls_array << url
      print prompt
    end
  end

  # shows the number of videos to download
  puts "# 2. OK. I'll download #{urls.count} videos"

  # Ytdl pulls all the urls
  Ytdl.download(urls)

  # shows the path where you can find the videos
  puts "# 3. Find your videos in #{Ytdl.dir}"
  puts "# 4. Find the list of your videos with thumbnails here #{Ytdl.dir}/gallery.html"
  puts "#{'='*60}"

  # creates a html page to list up the titles and thumbnails
  Ytdl.gallery
end
