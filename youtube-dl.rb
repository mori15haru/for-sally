module Configuration
  def self.home
    Dir.home
  end
end

module Ytdl
  def self.download(urls)
    validate_dir
    urls.each_with_index do |url, index|
      puts "# In progress #{index+1}/#{urls.count}"
      run(url)
    end
  end

  private

  def self.validate_dir
    Dir.mkdir(dir) unless File.exist?(dir)
  end

  def self.run(url)
    system(command(url))
  end

  def self.command(url)
    "youtube-dl --write-thumbnail -o \'#{dir}/%(title)s.%(ext)s\' #{url}"
  end

  def self.dir
    File.join(Configuration.home, today)
  end

  def self.today
    Time.now.strftime("%Y%m%d")
  end

  def self.gallery
    File.new(File.join(dir, 'gallery.html'), "a+").tap do |file|
      file << "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/></head><body>"
      Dir.glob(File.join(dir, '*.jpg')).each do |image|
        file << "<img src=#{image.gsub(' ', '%20')} width=\"200\">"
        file << "<br>"
        file << "<p>#{File.basename(image, '.jpg')}</p>"
        file << "<br>"
      end
      file << "<body></html>"
    end
  end
end

if __FILE__ == $0
  puts "#{'='*60}"

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

  urls = [].tap do |urls_array|
    greeting
    while url = gets.chomp
      break if bye.include?(url)
      urls_array << url
      print prompt
    end
  end
  puts "# 2. OK. I'll download #{urls.count} videos"
  Ytdl.download(urls)
  puts "# 3. Find your videos in #{Ytdl.dir}"
  puts "#{'='*60}"
  Ytdl.gallery
end
